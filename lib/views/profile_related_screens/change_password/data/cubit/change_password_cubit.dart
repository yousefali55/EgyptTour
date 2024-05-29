import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final dio = Dio();
  TextEditingController emailController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController passwrodController = TextEditingController();
  ChangePasswordCubit() : super(ChangePasswordInitial());
  Future<void> changePassword() async {
    try {
      emit(ChangePasswordLoading());
      const url = 'https://finish-api.onrender.com/api/user/resetPassword';
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = await dio.post(
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ),
          url,
          data: {
            "email": emailController.text,
            "code": codeController.text,
            "passwrod": passwrodController.text,
          });
      if (response.statusCode == 201) {
        emit(ChangePasswordSuccess());
        print(response.data);
      } else {
        emit(ChangePasswordFailure(errorMessage: '${response.statusCode}'));
      }
    } catch (e) {
      emit(ChangePasswordFailure(errorMessage: e.toString()));
    }
  }
}
