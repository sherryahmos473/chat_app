import 'package:chat_app/blocs/auth/auth_bloc.dart';
import 'package:chat_app/constants.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/views/chat_view.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_pass_textfield.dart';
import 'package:chat_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatelessWidget {
  String? email, password;
  bool isLoading = false;
  static String id = 'RegisterPage';

  GlobalKey<FormState> formKey = GlobalKey();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterSuccess) {
          Navigator.pushNamed(context, ChatPage.id, arguments: email);
          isLoading = false;
        } else if (state is RegisterFailure) {
          showSnackBar(context, state.error);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
              backgroundColor: primaryColor,
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formKey,
                  child: ListView(
                    children: [
                      const SizedBox(height: 20),
                      Image.asset(
                        logo,
                        height: 150,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Scholar Chat',
                            style: TextStyle(
                                fontSize: 32,
                                fontFamily: 'Pacifico'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Row(
                        children: [
                          Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      CustomTextFromfield(
                        hintText: 'Email',
                        onChanged: (data) {
                          email = data;
                        },
                      ),
                      const SizedBox(height: 16),
                      CustomPassTextField(
                        hintText: 'Password',
                        onChanged: (data) {
                          password = data;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                          title: 'REGISTER',
                          ontap: () async {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<AuthBloc>(context)
                                  .add(RegisterEvent(email: email!, password: password!));
                            }
                          }),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t have an account ?',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: Color(0xffD56C04),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              )),
        );
      },
    );
  }
}
