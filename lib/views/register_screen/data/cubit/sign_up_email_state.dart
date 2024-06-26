part of 'sign_up_email_cubit.dart';

@immutable
sealed class SignUpEmailState {}

final class SignUpEmailInitial extends SignUpEmailState {}


final class SignUpEmailImageSuccess extends SignUpEmailState {
  final String text = 'Done image picked';
  final File? image;

  SignUpEmailImageSuccess({required this.image});
}

final class SignUpEmailImageLoading extends SignUpEmailState {}

final class SignUpEmailImageFailure extends SignUpEmailState {
  final String errorMessage;
  SignUpEmailImageFailure({required this.errorMessage});
}

final class SignUpEmailLoading extends SignUpEmailState {}

final class SignUpEmailSuccess extends SignUpEmailState {
  final dynamic data;

  SignUpEmailSuccess({required this.data});
}

final class SignUpEmailFailure extends SignUpEmailState {
  final String errorMessage;

  SignUpEmailFailure({required this.errorMessage});
}
