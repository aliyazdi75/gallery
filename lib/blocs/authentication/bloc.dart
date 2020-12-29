import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ceit_alumni/data/models/account/index.dart';
import 'package:ceit_alumni/data/repositories/account/index.dart';
import 'package:ceit_alumni/data/repositories/authentication/index.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'event.dart';
part 'state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    @required this.authenticationRepository,
    @required this.accountRepository,
  })  : assert(authenticationRepository != null),
        assert(accountRepository != null),
        super(const AuthenticationState.unknown());

  final AuthenticationRepository authenticationRepository;
  final AccountRepository accountRepository;

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AuthenticationStatusChanged) {
      yield await _mapAuthenticationStatusChangedToState(event);
    } else if (event is AuthenticationUnLoggedOutRequested) {
      await authenticationRepository.logout();
    }
  }

  Future<AuthenticationState> _mapAuthenticationStatusChangedToState(
      AuthenticationStatusChanged event) async {
    switch (event.status) {
      case AuthenticationStatus.unauthenticated:
        return const AuthenticationState.unauthenticated();
      case AuthenticationStatus.authenticated:
        final account = _getAccount();
        return account != null
            ? AuthenticationState.authenticated(account)
            : const AuthenticationState.unauthenticated();
      default:
        return const AuthenticationState.unknown();
    }
  }

  Account _getAccount() {
    try {
      return accountRepository.account;
    } on Exception catch (e) {
      debugPrintStack(label: e.toString());
      return null;
    }
  }
}
