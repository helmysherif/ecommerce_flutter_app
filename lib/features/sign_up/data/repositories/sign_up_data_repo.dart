import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failures.dart';
import 'package:ecommerce_app/features/sign_up/data/data_sources/sign_up_data_source.dart';
import 'package:ecommerce_app/features/sign_up/domain/entities/SignUpEntity.dart';
import 'package:ecommerce_app/features/sign_up/domain/entities/user_data.dart';
import 'package:ecommerce_app/features/sign_up/domain/repositories/sign_up_domain_repo.dart';

class SignUpDataRepo implements SignUpDomainRepo {
  SignUpDataSources sources;

  SignUpDataRepo(this.sources);

  @override
  Future<Either<Failures, SignUpEntity>> signUp(UserData userData) =>
      sources.signUp(userData);
}
