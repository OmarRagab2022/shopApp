
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/componets/default_button.dart';
import '../../../services/componets/default_text_form.dart';

import '../../../viewModel/auth/signUp/cubit.dart';
import '../../../viewModel/auth/signUp/states.dart';
import '../../layout.dart';

class RegisterScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ShopLayout(),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Register',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 30.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Login now to browse our hot offers',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  DefaultFormField(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    label: 'Email Address',
                    prefix: Icons.email_outlined,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  DefaultFormField(
                    controller: passwordController,
                    type: TextInputType.visiblePassword,
                    label: 'Password',
                    prefix: Icons.lock_outline,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  if (state is! RegisterLoadingState)
                    DefaultButton(
                      function: () {
                        ShopRegisterCubit.get(context).userCreate(
                          email: emailController.text,
                          password: passwordController.text,
                          name: nameController.text,
                          phone: phoneController.text
                        );
                      },
                      text: 'Register',
                    ),
                  if (state is RegisterLoadingState)
                    Center(child: CircularProgressIndicator()),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'REGISTER',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}