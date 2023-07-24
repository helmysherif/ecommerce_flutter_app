import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failures.dart';
import 'package:ecommerce_app/features/login/data/data_sources/data_sources.dart';
import 'package:ecommerce_app/features/login/domain/entities/login_entity.dart';

import '../../domain/repositories/login_domain_repo.dart';

class LoginDataRepo implements LoginDomainRepo {
  LoginDataSources loginDataSources;

  LoginDataRepo(this.loginDataSources);

  @override
  Future<Either<Failures, LoginEntity>> login(String email, String password) =>
      loginDataSources.login(email, password);
}
