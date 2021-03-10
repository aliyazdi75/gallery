import 'package:authentication_service/src/models/index.dart';
import 'package:http_service/http_service.dart';

class AuthenticationApi {
  static Future<Register> register(Register register) async {
    final response = await HttpHelper('accounts').httpPost(
      badRequestModel: RegisterBadRequest,
      body: register.toJson(),
    );
    return Register.fromJson(response);
  }

  static Future<Login> login(LoginBody loginBody) async {
    final response = await HttpHelper('auth').httpPost(
      badRequestModel: LoginBadRequest,
      body: loginBody.toJson(),
    );
    return Login.fromJson(response);
  }

  // todo: add this
  static Future logout() async {
    throw UnimplementedError('Log out has not been implemented!');
  }
}
