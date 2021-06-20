import 'dart:convert';

import 'package:aggie/models/plan_model.dart';
import 'package:aggie/repository/plan_repository.dart';
import 'package:aggie/utils/StorageManager.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part './plan_state.dart';

class PlanCubit extends Cubit<PlanState> {
  final planRepo = PlanRepo();

  PlanCubit() : super(PlanStateInit()) {
    loadData();
  }

  Future loadData() async {
    emit(PlanStateLoading());
    try {
      final res = await planRepo.getPlanList();
      final body = jsonDecode(res.body);
      List<Plan> listTemp = [];
      if (res.statusCode == 200) {
        body['data']['plan']
            .forEach((value) => {listTemp.add(Plan.fromJson(value))});
        emit(PlanLoaded(plans: listTemp));
      } else {
        throw (body['message']);
      }
    } catch (e) {
      print(e);
      emit(PlanStateErrors());
    }
  }

  Future createPlan(String planName, String address, LatLng location) async {
    PlanState temp = state;
    emit(PlanStateLoading());
    try {
      final res = await planRepo.cretePlan(planName, address, location);
      final body = jsonDecode(res.body);
      if (res.statusCode == 201) {
        await this.refresh();
        return true;
      } else {
        print(res.statusCode);
        throw (body['message']);
      }
    } catch (e) {
      if (temp is PlanLoaded) emit(PlanLoaded(plans: temp.plans));
      print(e);
    }
  }

  Future refresh() async {
    try {
      final res = await planRepo.getPlanList();
      final body = jsonDecode(res.body);
      List<Plan> listTemp = [];
      if (res.statusCode == 200) {
        print('refresh plan');
        body['data']['plan']
            .forEach((value) => {listTemp.add(Plan.fromJson(value))});
        emit(PlanLoaded(plans: listTemp));
      } else {
        throw (body['message']);
      }
    } catch (e) {
      print(e);
    }
  }
}
