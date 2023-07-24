import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failures.dart';
import 'package:ecommerce_app/features/sign_up/domain/entities/SignUpEntity.dart';
import 'package:ecommerce_app/features/sign_up/domain/entities/user_data.dart';

abstract class SignUpDomainRepo {
  Future<Either<Failures, SignUpEntity>> signUp(UserData userData);
}
