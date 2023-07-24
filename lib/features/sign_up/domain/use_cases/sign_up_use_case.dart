import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failures.dart';
import 'package:ecommerce_app/features/sign_up/domain/entities/SignUpEntity.dart';
import 'package:ecommerce_app/features/sign_up/domain/entities/user_data.dart';
import 'package:ecommerce_app/features/sign_up/domain/repositories/sign_up_domain_repo.dart';

class SignUpUseCase {
  SignUpDomainRepo signUpDomainRepo;

  SignUpUseCase(this.signUpDomainRepo);

  Future<Either<Failures, SignUpEntity>> call(UserData userData) =>
      signUpDomainRepo.signUp(userData);
}
