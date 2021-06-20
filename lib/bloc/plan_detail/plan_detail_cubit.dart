import 'dart:convert';

import 'package:aggie/models/plan_model.dart';
import 'package:aggie/repository/plan_repository.dart';
import 'package:aggie/utils/StorageManager.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part './plan_detail_state.dart';

class PlanDetailCubit extends Cubit<PlanDetailState> {
  final planRepo = PlanRepo();

  PlanDetailCubit() : super(PlanStateInit());

  Future loadData(String planId) async {
    emit(PlanDetailStateLoading());
    try {
      final res = await planRepo.getPlanById(planId);
      final body = jsonDecode(res.body);
      if (res.statusCode == 200) {
        emit(PlanDetailLoaded(plan: Plan.fromJson(body['data'])));
      } else {
        throw (body['errors']);
      }
    } catch (e) {
      print(e);
      emit(PlanDetailStateErrors(message: 'error'));
    }
  }

  Future refresh() async {}
}
