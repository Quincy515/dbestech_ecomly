import 'package:dartz/dartz.dart';
import 'package:dbestech_ecomly/core/common/entities/user.dart';
import 'package:dbestech_ecomly/core/errors/exceptions.dart';
import 'package:dbestech_ecomly/core/errors/failures.dart';
import 'package:dbestech_ecomly/core/utils/typedefs.dart';
import 'package:dbestech_ecomly/src/auth/data/datasources/auth_remote_data_source.dart';
import 'package:dbestech_ecomly/src/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImplementation implements AuthRepository {
  const AuthRepositoryImplementation(this._remoteDataSource);

  final AuthRemoteDataSource _remoteDataSource;

  @override
  ResultFuture<void> forgotPassword(String email) async {
    try {
      await _remoteDataSource.forgotPassword(email);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<User> login({
    required String email,
    required String password,
  }) async {
    try {
      final result =
          await _remoteDataSource.login(email: email, password: password);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> register({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    try {
      await _remoteDataSource.register(
          email: email, password: password, name: name, phone: phone);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> resetPassword({
    required String email,
    required String newPassword,
  }) async {
    try {
      await _remoteDataSource.resetPassword(
          email: email, newPassword: newPassword);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> verifyOTP({
    required String email,
    required String otp,
  }) async {
    try {
      await _remoteDataSource.verifyOTP(email: email, otp: otp);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<bool> verifyToken() async {
    try {
      final result = await _remoteDataSource.verifyToken();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
