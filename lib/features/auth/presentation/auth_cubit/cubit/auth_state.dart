part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class SignupLoadingState extends AuthState{}
final class SignupSuccessState extends AuthState{}
final class SignupFailureState extends AuthState{
  final String errorMessage;

  SignupFailureState({required this.errorMessage});
}

final class SignInLoadingState extends AuthState{}
final class SignInSuccessState extends AuthState{}
final class SignInFailureState extends AuthState{
  final String errorMessage;

  SignInFailureState({required this.errorMessage});
}

final class ResetPasswordLoadingState extends AuthState{}
final class ResetPasswordSuccessState extends AuthState{}
final class ResetPasswordFailureState extends AuthState{
  final String errorMessage;

  ResetPasswordFailureState({required this.errorMessage});
}


final class TermsAndConditionUpdateState extends AuthState{}
final class ObscurePasswordTextUpdateState extends AuthState{}

