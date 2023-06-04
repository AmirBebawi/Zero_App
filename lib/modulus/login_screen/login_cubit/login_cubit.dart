import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zero_app/modulus/login_screen/login_cubit/states.dart';


class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  bool isPassword = true;

  void passwordVisibility() {
    isPassword = !isPassword;
    emit(LoginPasswordVisibilityState());
  }
  void forgetPassword()
  {
    emit(LoginForgetPasswordState());
  }

}
