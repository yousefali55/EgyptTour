import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'sign_up_email_state.dart';

class SignUpEmailCubit extends Cubit<SignUpEmailState> {
  SignUpEmailCubit() : super(SignUpEmailInitial());

  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordConfirm = TextEditingController();
  final Dio _dio = Dio();
  File? avatarFile;

  Future<void> pickImage() async {
    emit(SignUpEmailImageLoading());
    final ImagePicker imagePicker = ImagePicker();
    final XFile? imagegallery =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (imagegallery != null) {
      avatarFile = File(imagegallery.path);
      emit(SignUpEmailImageSuccess(image: avatarFile));
    } else {
      avatarFile = null;
      emit(SignUpEmailImageFailure(errorMessage: 'Image not picked'));
    }
  }

  Future<void> signUpEmail() async {
    emit(SignUpEmailLoading());

    const url = 'https://finish-api.onrender.com/api/user/register/';
    FormData formData;
    try {
      formData = FormData.fromMap(
        {
          "fullname": fullName.text,
          "email": email.text,
          "password": password.text,
          "passwordConfirm": passwordConfirm.text,
          if (avatarFile != null && await avatarFile!.exists())
            "avatar": await MultipartFile.fromFile(avatarFile!.path),
        },
      );
    } catch (e) {
      emit(SignUpEmailFailure(
          errorMessage: 'Failed to prepare form data: ${e.toString()}'));
      print('Failed to prepare form data: ${e.toString()}');
      return;
    }

    try {
      final response = await _dio.post(url, data: formData);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        emit(SignUpEmailSuccess(data: data));
        print('${data}');
      } else {
        final errorData = response.data;
        emit(SignUpEmailFailure(
            errorMessage: errorData['message'] ?? 'Registration failed'));
      }
    } on DioError catch (dioError) {
      if (dioError.response != null && dioError.response!.statusCode == 500) {
        final errorMessage = dioError.response!.data['message'] ??
            'Cannot read properties of null (reading \'email\')';
        emit(SignUpEmailFailure(errorMessage: errorMessage));
        print(errorMessage);
      }
    } catch (e) {
      emit(SignUpEmailFailure(errorMessage: e.toString()));
      print('${e.toString()}');
    }
  }
}
