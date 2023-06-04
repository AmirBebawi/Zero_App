import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zero_app/modulus/register_screen/register_cubit/states.dart';


class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);
  bool isPassword = true;

  void passwordVisibility() {
    isPassword = !isPassword;
    emit(RegisterPasswordVisibilityState());
  }
  void forgetPassword()
  {
    emit(RegisterForgetPasswordState());
  }

}
