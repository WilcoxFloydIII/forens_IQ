// import 'package:dio/dio.dart';
// import 'api_config.dart';

// class NetworkProvider {
//   static final NetworkProvider _instance = NetworkProvider._internal();
//   factory NetworkProvider() => _instance;
//   late Dio _dio;

//   NetworkProvider._internal() {
//     _dio = Dio(
//       BaseOptions(
//         baseUrl: '',
//         connectTimeout: const Duration(seconds: 10),
//         receiveTimeout: const Duration(seconds: 10),
//         responseType: ResponseType.json,
//       ),
//     );

//     ApiConfig.applyToDio(_dio);

//     _dio.interceptors.add(
//       InterceptorsWrapper(
//         onRequest: (options, handler) {
//           return handler.next(options);
//         },
//         onResponse: (response, handler) => handler.next(response),
//         onError: (error, handler) {
//           _handleError(error);
//           return handler.next(error);
//         },
//       ),
//     );
//   }

//   Future<dynamic> get(dynamic endpoint, {Map<String, dynamic>? query}) async {
//     final String path = _normalizeEndpoint(endpoint);
//     try {
//       final response = await _dio.get(path, queryParameters: query);
//       return _parseResponse(response);
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> post(dynamic endpoint, {dynamic data}) async {
//     final String path = _normalizeEndpoint(endpoint);
//     try {
//       final response = await _dio.post(path, data: data);
//       return _parseResponse(response);
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> put(dynamic endpoint, {dynamic data}) async {
//     final String path = _normalizeEndpoint(endpoint);
//     try {
//       final response = await _dio.put(path, data: data);
//       return _parseResponse(response);
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> delete(dynamic endpoint, {dynamic data}) async {
//     final String path = _normalizeEndpoint(endpoint);
//     try {
//       final response = await _dio.delete(path, data: data);
//       return _parseResponse(response);
//     } catch (e) {
//       rethrow;
//     }
//   }

//   String _normalizeEndpoint(dynamic endpoint) {
//     if (endpoint is Uri) return endpoint.toString();
//     if (endpoint is String) return endpoint;
//     return endpoint.toString();
//   }

//   dynamic _parseResponse(Response response) {
//     final data = response.data;
//     if (data is List) {
//       return List<Map<String, dynamic>>.from(data);
//     } else if (data is Map<String, dynamic>) {
//       return data;
//     } else {
//       return {'message': 'Unexpected response format', 'raw': data};
//     }
//   }

//   void _handleError(DioException error) {
//     switch (error.type) {
//       case DioExceptionType.connectionTimeout:
//         print('Connection timeout');
//         break;
//       case DioExceptionType.receiveTimeout:
//         print('Receive timeout');
//         break;
//       case DioExceptionType.badResponse:
//         print('Server error: ${error.response?.statusCode}');
//         break;
//       default:
//         print('Unexpected error: ${error.message}');
//     }
//   }

//   void setAuthToken(String token) {
//     _dio.options.headers['Authorization'] = 'Bearer $token';
//   }

//   void clearAuth() {
//     _dio.options.headers.remove('Authorization');
//   }
// }
