import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failures.dart';
import 'package:ecommerce_app/features/sign_up/data/models/SignUpModel.dart';
import 'package:ecommerce_app/features/sign_up/domain/entities/user_data.dart';

abstract class SignUpDataSources {
  Future<Either<Failures, SignUpModel>> signUp(UserData userData);
}
