import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/error/failures.dart';
import 'package:ecommerce_app/features/login/data/models/login_model.dart';

import '../../../../core/apis/end_points.dart';
import '../../../../core/utils/constants.dart';

abstract class LoginDataSources {
  Future<Either<Failures, LoginModel>> login(String email, String password);
}

class RemoteDTO implements LoginDataSources {
  Dio dio = Dio();

  @override
  Future<Either<Failures, LoginModel>> login(
      String email, String password) async {
    try {
      var response =
          await dio.post("${Constants.baseApiUrl}${EndPoints.login}", data: {
        "email": email,
        "password": password,
      });
      LoginModel loginModel = LoginModel.fromJson(response.data);
      return Right(loginModel);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }
}

class LocalDTO implements LoginDataSources {
  @override
  Future<Either<Failures, LoginModel>> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
