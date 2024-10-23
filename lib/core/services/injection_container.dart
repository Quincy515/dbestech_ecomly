import 'package:dbestech_ecomly/core/common/app/cache_helper.dart';
import 'package:dbestech_ecomly/src/auth/data/datasources/auth_remote_data_source.dart';
import 'package:dbestech_ecomly/src/auth/data/repositories/auth_repository_implementation.dart';
import 'package:dbestech_ecomly/src/auth/domain/repositories/auth_repository.dart';
import 'package:dbestech_ecomly/src/auth/domain/usercases/forgot_password.dart';
import 'package:dbestech_ecomly/src/auth/domain/usercases/login.dart';
import 'package:dbestech_ecomly/src/auth/domain/usercases/register.dart';
import 'package:dbestech_ecomly/src/auth/domain/usercases/reset_password.dart';
import 'package:dbestech_ecomly/src/auth/domain/usercases/verify_otp.dart';
import 'package:dbestech_ecomly/src/auth/domain/usercases/verify_token.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

part 'injection_container.main.dart';
