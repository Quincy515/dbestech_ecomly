import 'dart:convert';

import 'package:dbestech_ecomly/core/common/singletons/cache.dart';
import 'package:dbestech_ecomly/core/errors/error_response.dart';
import 'package:dbestech_ecomly/core/errors/exceptions.dart';
import 'package:dbestech_ecomly/core/extensions/string_extension.dart';
import 'package:dbestech_ecomly/core/utils/constants/network_constants.dart';
import 'package:dbestech_ecomly/core/utils/network_utils.dart';
import 'package:dbestech_ecomly/core/utils/typedefs.dart';
import 'package:dbestech_ecomly/src/auth/data/models/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

abstract class UserRemoteDataSource {
  const UserRemoteDataSource();

  Future<UserModel> getUser(String userId);

  Future<UserModel> updateUser({
    required String userId,
    required DataMap updateData,
  });

  Future<String> getUserPaymentProfile(String userId);
}

const USER_ENDPOINT = '/users';

class UserRemoteDataSrcImpl implements UserRemoteDataSource {
  const UserRemoteDataSrcImpl(this._client);

  final http.Client _client;

  @override
  Future<UserModel> getUser(String userId) async {
    try {
      final uri =
          Uri.parse('${NetworkConstants.baseUrl}$USER_ENDPOINT/$userId');

      final response = await _client.get(
        uri,
        headers: Cache.instance.sessionToken!.toAuthHeaders,
      );

      final payload = jsonDecode(response.body) as DataMap;
      await NetworkUtils.renewToken(response);

      if (response.statusCode != 200) {
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerException(
            message: errorResponse.errorMessage,
            statusCode: response.statusCode);
      }

      return UserModel.fromMap(payload);
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 500);
    }
  }

  @override
  Future<String> getUserPaymentProfile(String userId) async {
    try {
      final uri = Uri.parse(
          '${NetworkConstants.baseUrl}$USER_ENDPOINT/$userId/paymentProfile');

      final response = await _client.get(
        uri,
        headers: Cache.instance.sessionToken!.toAuthHeaders,
      );

      final payload = jsonDecode(response.body) as DataMap;
      await NetworkUtils.renewToken(response);

      if (response.statusCode != 200) {
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerException(
            message: errorResponse.errorMessage,
            statusCode: response.statusCode);
      }

      return payload['url'] as String;
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 500);
    }
  }

  @override
  Future<UserModel> updateUser(
      {required String userId, required DataMap updateData}) async {
    try {
      final uri =
          Uri.parse('${NetworkConstants.baseUrl}$USER_ENDPOINT/$userId');

      final response = await _client.put(
        uri,
        body: jsonEncode(updateData),
        headers: Cache.instance.sessionToken!.toAuthHeaders,
      );

      final payload = jsonDecode(response.body) as DataMap;
      await NetworkUtils.renewToken(response);

      if (response.statusCode != 200 && response.statusCode != 201) {
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerException(
            message: errorResponse.errorMessage,
            statusCode: response.statusCode);
      }

      return UserModel.fromMap(payload);
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 500);
    }
  }
}
