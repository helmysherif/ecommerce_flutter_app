import 'package:ecommerce_app/features/sign_up/data/data_sources/sign_up_data_source.dart';
import 'package:ecommerce_app/features/sign_up/data/repositories/sign_up_data_repo.dart';
import 'package:ecommerce_app/features/sign_up/domain/entities/user_data.dart';
import 'package:ecommerce_app/features/sign_up/domain/repositories/sign_up_domain_repo.dart';
import 'package:ecommerce_app/features/sign_up/domain/use_cases/sign_up_use_case.dart';
import 'package:ecommerce_app/features/sign_up/presentation/manager/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpDataSources sources;

  SignUpCubit(this.sources) : super(SignUpInitState());

  static SignUpCubit get(context) => BlocProvider.of(context);
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  signUp() async {
    emit(SignUpLoadingState());
    SignUpDomainRepo signUpDomainRepo = SignUpDataRepo(sources);
    SignUpUseCase signUpUseCase = SignUpUseCase(signUpDomainRepo);
    UserData userData = UserData(
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      password: passwordController.text,
    );
    var result = await signUpUseCase.call(userData);
    result.fold((l) {
      emit(SignUpErrorState(l));
    }, (r) {
      emit(SignUpSuccessState(r));
    });
  }
}
