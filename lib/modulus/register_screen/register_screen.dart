import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zero_app/layout/home_layout/home_layout.dart';
import 'package:zero_app/modulus/login_screen/login_screen.dart';
import 'package:zero_app/modulus/register_screen/register_cubit/register_cubit.dart';
import 'package:zero_app/modulus/register_screen/register_cubit/states.dart';
import '../../shared/components/constant.dart';
import '../../shared/components/register_component/default_buttons/default_material_button.dart';
import '../../shared/components/register_component/default_text form_feild/text_form_feild_register.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = 'RegisterScreen';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var firstNameController = TextEditingController();
    var lastNameController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var confirmPasswordController = TextEditingController();
    var formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit,RegisterStates>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text(
              'Register',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            centerTitle: true,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Container(
                width: double.infinity,
                margin: const EdgeInsetsDirectional.only(
                  end: 20,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                decoration: BoxDecoration(
                  color: defaultColor,
                  borderRadius: const BorderRadiusDirectional.only(
                    topEnd: Radius.circular(100),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: const Color(0xffA0331A),
                          width: 2,
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            LoginScreen.routeName,
                                (route) => false,
                          );
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Color(0xffA0331A),
                          size: 40,
                        ),
                      ),
                    ),
                    RegisterTextFormField(
                      controller: firstNameController,
                      type: TextInputType.name,
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Please enter your First Name ';
                        }
                      },
                      hint: 'First Name',
                    ),
                    RegisterTextFormField(
                      controller: lastNameController,
                      type: TextInputType.name,
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Please enter your Last Name';
                        }
                      },
                      hint: 'Last Name',
                    ),
                    RegisterTextFormField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Please enter your Email address';
                        }
                      },
                      hint: 'E-mail',
                    ),
                    RegisterTextFormField(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      validate: (value) {
                        RegExp regEx = RegExp(r"(?=.*[a-z])(?=.*[A-Z])\w+");
                        if (value.isEmpty) {
                          return "Password must not be empty";
                        } else if (value != confirmPasswordController.text) {
                          return "Password must be same";
                        } else if (value.length < 8) {
                          return 'Should be more than 8 Characters';
                        } else if (!value.toString().contains(regEx)) {
                          return 'Use Numbers and Capital and Small Characters at least 1';
                        } else {
                          return null;
                        }
                      },
                      hint: 'Password',
                      suffix: Icons.visibility,
                    ),
                    RegisterTextFormField(
                      controller: confirmPasswordController,
                      type: TextInputType.visiblePassword,
                      validate: (value) {
                        RegExp regEx = RegExp(r"(?=.*[a-z])(?=.*[A-Z])\w+");
                        if (value.isEmpty) {
                          return "Password must not be empty";
                        } else if (value != passwordController.text) {
                          return "Password must be same";
                        } else if (value.length < 8) {
                          return 'Should be more than 8 Characters';
                        } else if (!value.toString().contains(regEx)) {
                          return 'Use Numbers and Capital and Small Characters at least 1';
                        } else {
                          return null;
                        }
                      },
                      hint: 'Confirm Password',
                      suffix: Icons.visibility,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: RegisterMaterialButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            HomeLayout.routeName,
                                (route) => false,
                          );
                        },
                        text: 'Sign Up',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
