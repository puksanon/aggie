import 'dart:convert';

import 'package:aggie/models/user_model.dart';
import 'package:aggie/repository/user_repository.dart';
import 'package:aggie/utils/StorageManager.dart';
import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';

part './user_state.dart';

class UserCubit extends Cubit<UserState> {
  final http.Client httpClient = http.Client();
  final userRepo = UserRepo();

  UserCubit() : super(UserInit());

  Future signIn(String email, String password) async {
    emit(UserSingingIn());
    try {
      final res = await userRepo.singIn(email, password);
      final body = jsonDecode(res.body);
      if (res.statusCode == 200) {
        final jwt = body['data']['token'];
        if (jwt != null) {
          Map<String, dynamic> payload = Jwt.parseJwt(jwt);
          StorageManager.saveData('token', jwt);
          emit(UserSingedIn(user: User.fromJson(payload), token: jwt));
          print((state as UserSingedIn).user.email);
          return 'signed';
        }
      } else {
        throw (body['errors']);
      }
    } catch (e) {
      emit(UserSingInError(message: 'Email or Password incorrect'));
      print(e);
    }
  }

  Future logout() async {
    emit(UserInit());
    await StorageManager.deleteData('token');
  }
}
