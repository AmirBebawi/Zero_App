import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:zero_app/shared/components/constant.dart';
import '../../shared/components/login_components/default_buttons/default_material_button.dart';
import '../../shared/components/login_components/default_buttons/default_text_button.dart';
import '../../shared/components/login_components/default_text_form_field/default_text_form_field.dart';
import '../register_screen/register_screen.dart';
import 'login_cubit/login_cubit.dart';
import 'login_cubit/states.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'LoginScreen';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    // var passwordController = TextEditingController();
    // var formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: defaultColor,
            body: SingleChildScrollView(
              child: Container(
                height: 96.h,
                margin: EdgeInsetsDirectional.only(
                  start: 5.w,
                  bottom: 5.h,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.only(
                      bottomStart: Radius.circular(
                        10.0.h,
                      ),
                      bottomEnd: Radius.circular(8.h)),
                ),
                child: Form(
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: const AssetImage(
                            'assets/login_screen/Login.png',
                          ),
                          height: 20.h,
                          width: 60.w,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 3.0.w, vertical: 2.0.h),
                          child: LoginTextFormField(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your Email address';
                              }
                            },
                            label: 'Email',
                            prefix: Icons.email,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3.0.w),
                          child: LoginTextFormField(
                            controller: emailController,
                            type: TextInputType.text,
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your Password';
                              }
                            },
                            label: 'Password',
                            prefix: Icons.lock_outline,
                            isShown: LoginCubit.get(context).isPassword,
                            suffix: Icons.remove_red_eye_outlined,
                            suffixPressed: () {},
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3.0.w),
                          child: LoginMaterialButton(
                              onPressed: () {}, text: "Login"),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Text(
                              "Don't have an account?",
                              style: TextStyle(
                                color: defaultColor
,
                              ),
                            ),
                            DefaultTextButton(
                              text: "Register Now ",
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  RegisterScreen.routeName,
                                  (route) => false,
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
