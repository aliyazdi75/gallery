import 'dart:async';

import 'package:account_service/account_service.dart';
import 'package:authentication_service/authentication_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http_service/http_service.dart';
import 'package:meta/meta.dart';

part 'event.dart';
part 'state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    @required this.authenticationRepository,
    @required this.accountRepository,
  })  : assert(authenticationRepository != null),
        assert(accountRepository != null),
        super(const LoginState());

  final AuthenticationRepository authenticationRepository;
  final AccountRepository accountRepository;

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginUsernameChanged) {
      yield state.copyWith(username: event.username);
    } else if (event is LoginPasswordChanged) {
      yield state.copyWith(password: event.password);
    } else if (event is LoginSubmitted) {
      yield* _mapLoginSubmittedToState(state);
    }
  }

  Stream<LoginState> _mapLoginSubmittedToState(LoginState state) async* {
    if (state.password.isEmpty && state.password.isEmpty) {
      yield state.copyWith(status: LoginStatus.initial);
      return;
    }

    yield state.copyWith(status: LoginStatus.loading);
    try {
      // final authenticated = await authenticationRepository.login(
      //   username: state.username,
      //   password: state.password,
      // );
      // _saveAccount(authenticated);
      //todo: fix this after implementation
      if (state.username == 'gallery' && state.password == '94') {
        yield state.copyWith(status: LoginStatus.success);
      } else {
        yield state.copyWith(status: LoginStatus.failure);
      }
    } on BadRequestException catch (e) {
      final error = e.model as LoginBadRequest;
      print(
          'kir to requestet ba ina ${error.username ?? error.password ?? error.nonFieldErrors}');
      yield state.copyWith(status: LoginStatus.failure);
    } on SocketException catch (_) {
      print('kir to netet');
      yield state.copyWith(status: LoginStatus.failure);
    } on Exception catch (_) {
      yield state.copyWith(status: LoginStatus.failure);
    }
  }

  // void _saveAccount(Login authenticated) {
  //   accountRepository.account = Account(
  //     (b) => b
  //       ..token = authenticated.token
  //       ..id = authenticated.id
  //       ..username = authenticated.username
  //       ..email = authenticated.email
  //       ..firstName = authenticated.firstName
  //       ..lastName = authenticated.lastName,
  //   );
  // }
}
