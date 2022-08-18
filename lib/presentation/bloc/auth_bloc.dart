import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demon/data/repositories/repository.dart';
import 'package:demon/domain/repositories/repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IRepository _repository = Repository();

  AuthBloc() : super(AuthState.initial()) {
    on<OnLoginPressed>(_onLogin);
  }

  FutureOr<void> _onLogin(OnLoginPressed event, Emitter<AuthState> emit) async {
    emit(state.copyWith(loading: true, isLoggedInSuccess: false));
    final res = await _repository.login(event.email, event.password);

    emit(state.copyWith(loading: false, isLoggedInSuccess: res));
  }
}
