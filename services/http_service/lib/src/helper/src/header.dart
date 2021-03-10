enum HttpHeaderType {
  authenticated,
  anonymous,
}

abstract class HttpHeader {
  static Map<String, String> setHeader(
    HttpHeaderType headerType,
  ) {
    switch (headerType) {
      // todo: fix token to get if saved
      case HttpHeaderType.authenticated:
        return {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer 6fde8037a4b00105bc1a9e0440e999b708bd4899'
        };
      case HttpHeaderType.anonymous:
        return {'Content-Type': 'application/json'};
      default:
        throw Exception('$headerType is not supported HttpHeaderType');
    }
  }
}

abstract class GithubHttpHeader {
  static Map<String, String> setHeader(
    HttpHeaderType headerType,
  ) {
    switch (headerType) {
      case HttpHeaderType.authenticated:
        return {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer 6fde8037a4b00105bc1a9e0440e999b708bd4899'
        };
      case HttpHeaderType.anonymous:
        return {'Content-Type': 'application/json'};
      default:
        throw Exception('$headerType is not supported HttpHeaderType');
    }
  }
}
