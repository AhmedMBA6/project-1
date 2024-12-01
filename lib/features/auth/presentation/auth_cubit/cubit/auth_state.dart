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
final class TermsAndConditionUpdateState extends AuthState{}
final class ObscurePasswordTextUpdateState extends AuthState{}

