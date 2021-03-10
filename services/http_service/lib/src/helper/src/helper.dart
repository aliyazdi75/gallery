import 'dart:convert';
import 'dart:io';

import 'package:constants_service/constants_service.dart';
import 'package:http/http.dart' as http;
import 'package:http_service/http_service.dart';

import 'exception.dart';
import 'header.dart';

typedef HttpMethod = Future<http.Response> Function();

abstract class HttpClientBase {
  Future<String> httpGet({
    String? queryParams,
    HttpHeaderType headerType = HttpHeaderType.anonymous,
  });

  Future<String> httpPost({
    required String body,
    String? queryParams,
    Object? badRequestModel,
    HttpHeaderType headerType = HttpHeaderType.anonymous,
  });
}

class HttpHelper implements HttpClientBase {
  HttpHelper(this.path);

  final http.Client _httpClient = http.Client();
  final String path;

  String _responseData(
    http.Response response, {
    Object? badRequestModel,
  }) {
    try {
      switch (response.statusCode) {
        // 200
        case HttpStatus.ok:
          return utf8.decode(response.bodyBytes);
        // 201
        case HttpStatus.created:
        // 204
        case HttpStatus.noContent:
        // 400
        case HttpStatus.badRequest:
          if (badRequestModel == RegisterBadRequest) {
            throw BadRequestException(
              response.request!.url.path,
              RegisterBadRequest.fromJson(utf8.decode(response.bodyBytes)),
            );
          } else if (badRequestModel == LoginBadRequest) {
            throw BadRequestException(
              response.request!.url.path,
              LoginBadRequest.fromJson(utf8.decode(response.bodyBytes)),
            );
          }
          throw NotHandleException(
            response.request!.url.path,
            'BadRequest Model not implemented',
            response.statusCode.toString(),
          );
        // 401
        case HttpStatus.unauthorized:
          throw UnauthorisedException(
            response.request!.url.path,
            'The Request is Unauthorized',
            response.statusCode.toString(),
          );
        // 403
        case HttpStatus.forbidden:
          throw UnauthorisedException(
            response.request!.url.path,
            'Authorization Forbidden',
            response.statusCode.toString(),
          );
        // 404
        case HttpStatus.notFound:
          throw NotFoundException(response.request!.url.path);
        // 500
        case HttpStatus.internalServerError:
          throw ServerException(
            response.request!.url.path,
            'Server Error Body',
            utf8.decode(response.bodyBytes),
          );
        // Others
        default:
          throw NotHandleException(
            response.request!.url.path,
            'This Status Code Not Handled',
            response.statusCode.toString(),
          );
      }
    } on JsonUnsupportedObjectError catch (e) {
      throw JsonUnsupportedObjectError(e);
    }
  }

  @override
  Future<String> httpGet({
    String? queryParams,
    HttpHeaderType headerType = HttpHeaderType.anonymous,
  }) async {
    try {
      return _responseData(
        await _httpClient.get(
          Uri.https(
            serverAuthority,
            '$serverApiPath/$path',
            queryParams == null
                ? null
                : json.decode(queryParams) as Map<String, dynamic>,
          ),
          headers: HttpHeader.setHeader(headerType),
        ),
      );
    } on SocketException catch (e) {
      throw SocketException(e.url, e.key, e.value);
    } on http.ClientException catch (e) {
      throw http.ClientException(e.message, e.uri);
    }
  }

  @override
  Future<String> httpPost({
    required String body,
    String? queryParams,
    Object? badRequestModel,
    HttpHeaderType headerType = HttpHeaderType.anonymous,
  }) async {
    try {
      return _responseData(
        await _httpClient.post(
          Uri.https(
            serverAuthority,
            '$serverApiPath/$path',
            queryParams == null
                ? null
                : json.decode(queryParams) as Map<String, dynamic>,
          ),
          headers: HttpHeader.setHeader(headerType),
          body: body,
        ),
        badRequestModel: badRequestModel,
      );
    } on SocketException catch (e) {
      throw SocketException(e.url, e.key, e.value);
    } on JsonUnsupportedObjectError catch (e) {
      throw JsonUnsupportedObjectError(e);
    }
  }
}

class GithubHttpHelper implements HttpClientBase {
  GithubHttpHelper(this.path);

  final http.Client _httpClient = http.Client();
  final String path;

  String _responseData(http.Response response) {
    try {
      switch (response.statusCode) {
        // 200
        case HttpStatus.ok:
          return utf8.decode(response.bodyBytes);
        // 404
        case HttpStatus.notFound:
          throw NotFoundException(response.request!.url.path);
        // Others
        default:
          throw NotHandleException(
            response.request!.url.path,
            'This Status Code Not Handled',
            response.statusCode.toString(),
          );
      }
    } on JsonUnsupportedObjectError catch (e) {
      throw JsonUnsupportedObjectError(e);
    }
  }

  @override
  Future<String> httpGet({
    String? queryParams,
    HttpHeaderType headerType = HttpHeaderType.anonymous,
  }) async {
    try {
      return _responseData(
        await _httpClient.get(
          Uri.https(
            githubAuthority,
            '$githubApiPath/$githubAuthor/$githubRepository/$path',
          ),
          headers: GithubHttpHeader.setHeader(headerType),
        ),
      );
    } on SocketException catch (e) {
      throw SocketException(e.url, e.key, e.value);
    } on http.ClientException catch (e) {
      throw http.ClientException(e.message, e.uri);
    }
  }

  @override
  Future<String> httpPost({
    required String body,
    String? queryParams,
    Object? badRequestModel,
    HttpHeaderType headerType = HttpHeaderType.anonymous,
  }) async {
    try {
      return _responseData(
        await _httpClient.post(
          Uri.https(
            githubAuthority,
            '$githubApiPath/$githubAuthor/$githubRepository/$path',
          ),
          headers: GithubHttpHeader.setHeader(headerType),
          body: body,
        ),
      );
    } on TypeError {
      throw NotFoundException(path);
    } on SocketException catch (e) {
      throw SocketException(e.url, e.key, e.value);
    } on JsonUnsupportedObjectError catch (e) {
      throw JsonUnsupportedObjectError(e);
    }
  }
}
