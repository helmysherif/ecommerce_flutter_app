import 'package:ecommerce_app/features/login/data/data_sources/data_sources.dart';
import 'package:ecommerce_app/features/login/data/repositories/login_data_repo.dart';
import 'package:ecommerce_app/features/login/domain/repositories/login_domain_repo.dart';
import 'package:ecommerce_app/features/login/domain/use_cases/login_use_case.dart';
import 'package:ecommerce_app/features/login/presentation/manager/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginDataSources sources;

  LoginCubit(this.sources) : super(LoginInitState());

  static LoginCubit get(context) => BlocProvider.of(context);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  login() async {
    emit(LoginLoadingState());
    LoginDomainRepo loginDomainRepo = LoginDataRepo(sources);
    LoginUseCase loginUseCase = LoginUseCase(loginDomainRepo);
    var result =
        await loginUseCase.call(emailController.text, passwordController.text);
    result.fold((l) {
      emit(LoginErrorState(l));
    }, (r) {
      emit(LoginSuccessState(r));
    });
  }
}
