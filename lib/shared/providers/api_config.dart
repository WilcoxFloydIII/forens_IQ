// ...existing code...

enum ApiEnvironment { development, staging, production }

class ApiConfig {
  static const Map<ApiEnvironment, String> _defaultBases = {
    ApiEnvironment.development: '',
    ApiEnvironment.staging: '',
    ApiEnvironment.production: '',
  };

  static ApiEnvironment get environment {
    const env = String.fromEnvironment('API_ENV', defaultValue: 'production');
    switch (env.toLowerCase()) {
      case 'development':
      case 'dev':
        return ApiEnvironment.development;
      case 'staging':
        return ApiEnvironment.staging;
      default:
        return ApiEnvironment.production;
    }
  }

  static String get _compileTimeBase =>
      const String.fromEnvironment('API_BASE_URL', defaultValue: '');

  static String? _runtimeBase;
  static void setRuntimeBaseUrl(String? url) => _runtimeBase = url;

  static String get baseUrl {
    if (_runtimeBase != null && _runtimeBase!.isNotEmpty) return _runtimeBase!;
    if (_compileTimeBase.isNotEmpty) return _compileTimeBase;
    return _defaultBases[environment]!;
  }

  static const String apiPrefix = 'api';
  static const String apiVersion = 'v1';

  static Uri build(
    String path, {
    Map<String, dynamic>? queryParameters,
    bool includeVersion = true,
  }) {
    final normalized = path.startsWith('/') ? path.substring(1) : path;
    final full = includeVersion
        ? '$baseUrl/$apiPrefix/$apiVersion/$normalized'
        : '$baseUrl/$normalized';
    final uri = Uri.parse(full);
    if (queryParameters == null) return uri;
    return uri.replace(
      queryParameters: queryParameters
          .map((k, v) => MapEntry(k, v == null ? '' : v.toString())),
    );
  }

  static String relativePath(String path) {
    final normalized = path.startsWith('/') ? path.substring(1) : path;
    return normalized;
  }

  static String buildString(String path, {bool includeVersion = true}) =>
      build(path, includeVersion: includeVersion).toString();

  static void applyToDio(dynamic dio) {
    try {
      dio.options.baseUrl = '$baseUrl/$apiPrefix/$apiVersion';
    } catch (_) {

    }
  }
}

class Endpoints {
  static String registerPath() => relative('auth/register');
  static Uri register() => ApiConfig.build(registerPath());

  static String relative(String path) => ApiConfig.relativePath(path);
  static Uri raw(String path,
          {Map<String, dynamic>? queryParameters,
          bool includeVersion = true}) =>
      ApiConfig.build(path,
          queryParameters: queryParameters, includeVersion: includeVersion);
}