import 'dart:async';

import 'package:ceit_alumni/data/models/authentication/index.dart';
import 'package:ceit_alumni/data/providers/api/authentication/index.dart';
import 'package:meta/meta.dart';

class AuthenticationRepository {
  Future<Register> register({
    @required String username,
    @required String password,
    @required String email,
    String firstName,
    String lastName,
  }) async {
    assert(username != null);
    assert(password != null);
    assert(email != null);

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
    @required String username,
    @required String password,
  }) async {
    assert(username != null);
    assert(password != null);

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
