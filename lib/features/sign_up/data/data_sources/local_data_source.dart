import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failures.dart';
import 'package:ecommerce_app/features/sign_up/data/data_sources/sign_up_data_source.dart';
import 'package:ecommerce_app/features/sign_up/data/models/SignUpModel.dart';
import 'package:ecommerce_app/features/sign_up/domain/entities/user_data.dart';

class LocalDataSource implements SignUpDataSources {
  @override
  Future<Either<Failures, SignUpModel>> signUp(UserData userData) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
