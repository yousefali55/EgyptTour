import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

part 'sign_in_email_state.dart';

class SignInEmailCubit extends Cubit<SignInEmailState> {
  SignInEmailCubit() : super(SignInEmailInitial());
  final Dio dio = Dio();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    try {
      emit(SignInEmailLoading());
      const url = 'https://finish-api.onrender.com/api/user/login/';
      final formData = FormData.fromMap(
        {
          "email": emailController.text,
          "password": passwordController.text,
        },
      );
      final response = await dio.post(url, data: formData);
      if (response.statusCode == 200) {
        emit(SignInEmailSuccess());
        print(response.data);
      } else {
        final errorMessage = response.data['message'] ?? 'Unknown error occurred';
        emit(SignInEmailFailure(errorMessge: errorMessage));
        print(errorMessage);
      }
    } on DioError catch (dioError) {
      if (dioError.response != null && dioError.response!.statusCode == 500) {
        final errorMessage = dioError.response!.data['message'] ?? 'Cannot read properties of null (reading \'email\')';
        emit(SignInEmailFailure(errorMessge: errorMessage));
        print(errorMessage);
      } 
    } catch (e) {
      emit(SignInEmailFailure(errorMessge: e.toString()));
      print(e.toString());
    }
  }
}
