part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState(
      {required bool loading, required bool isLoggedInSuccess}) = _Initial;

  factory AuthState.initial() =>
     const AuthState(loading: false, isLoggedInSuccess: false);
}
