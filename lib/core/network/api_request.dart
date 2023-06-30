import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
// import 'package:skybase/core/database/secure_storage/secure_storage_manager.dart';
import 'package:skybase/core/network/api_config.dart';
import 'package:skybase/core/network/api_exception.dart';
import 'package:skybase/core/network/api_url.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/

Map<String, String> headers = {
  HttpHeaders.authorizationHeader: '',
};

/// Base Request for calling API.
/// * Can be modify as needed.
class ApiRequest {
  static Future<Response> post({
    required String url,
    bool useToken = true,
    String? contentType = Headers.jsonContentType,
    Object? body,
  }) async {
    await _tokenManager(useToken);
    final response = await _safeFetch(
      () => DioClient.find.post(
        url,
        data: _setBody(contentType: contentType, body: body),
        options: Options(headers: headers, contentType: contentType),
      ),
    );
    return response;
  }

  static Future<Response> get({
    required String url,
    bool useToken = true,
    String? contentType = Headers.jsonContentType,
  }) async {
    await _tokenManager(useToken);
    final response = await _safeFetch(
      () => DioClient.find.get(
        url,
        options: Options(headers: headers, contentType: contentType),
      ),
    );
    return response;
  }

  static Future<Response> patch({
    required String url,
    bool useToken = true,
    String? contentType = Headers.jsonContentType,
    Object? body,
  }) async {
    await _tokenManager(useToken);
    final response = await _safeFetch(
      () => DioClient.find.patch(
        url,
        data: _setBody(contentType: contentType, body: body),
        options: Options(headers: headers, contentType: contentType),
      ),
    );
    return response;
  }

  static Future<Response> put({
    required String url,
    bool useToken = true,
    String? contentType = Headers.jsonContentType,
    Object? body,
  }) async {
    await _tokenManager(useToken);
    final response = await _safeFetch(
      () => DioClient.find.put(
        url,
        data: _setBody(contentType: contentType, body: body),
        options: Options(headers: headers, contentType: contentType),
      ),
    );
    return response;
  }

  static Future<Response> delete({
    required String url,
    bool useToken = true,
    String? contentType = Headers.jsonContentType,
  }) async {
    await _tokenManager(useToken);
    final response = await _safeFetch(
      () => DioClient.find.delete(
        url,
        options: Options(headers: headers),
      ),
    );
    return response;
  }
}

Object? _setBody({
  required String? contentType,
  required Object? body,
}) {
  if (contentType == Headers.jsonContentType) {
    return body = jsonEncode(body);
  } else if (contentType == Headers.formUrlEncodedContentType) {
    return body;
  } else if (contentType == ApiUrl.multipartFormData) {
    return FormData.fromMap(body as Map<String, dynamic>);
  } else {
    return null;
  }
}

Future<void> _tokenManager(bool useToken) async {
  DioClient.setInterceptor();
  // String? token = await SecureStorageManager.find.getToken();
  if (useToken) {
    // headers[HttpHeaders.authorizationHeader] = 'token $gitToken';
  } else {
    headers.clear();
  }
}

Future<Response> _safeFetch(Future<Response> Function() tryFetch) async {
  try {
    final response = await tryFetch();
    // return ApiResponse.fromJson(response.data);
    return response;
  } on DioException catch (e) {
    throw NetworkException.getErrorException(e);
  } catch (e) {
    rethrow;
  }
}
