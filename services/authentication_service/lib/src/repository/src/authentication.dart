import 'dart:async';

import 'package:authentication_service/src/models/index.dart';
import 'package:authentication_service/src/providers/api/index.dart';

class AuthenticationRepository {
  Future<Register> register({
    required String username,
    required String password,
    required String email,
    String? firstName,
    String? lastName,
  }) async {
    final register = Register(
      (b) => b
        ..username = username
        ..password = password
        ..email = email
        ..firstName = firstName
        ..lastName = lastName,
    );

    final authenticated = await AuthenticationApi.register(register);
    return authenticated;
  }

  Future<Login> login({
    required String username,
    required String password,
  }) async {
    final loginBody = LoginBody(
      (b) => b
        ..username = username
        ..password = password,
    );

    final authenticated = await AuthenticationApi.login(loginBody);
    return authenticated;
  }

  // todo: add this
  Future logout() async {
    throw UnimplementedError('Log out has not been implemented!');
  }
}
