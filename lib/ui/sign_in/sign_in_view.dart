import 'package:chatApp/ui/home/home_view.dart';
import 'package:chatApp/ui/profile_verify/profile_verify_view.dart';
import 'package:chatApp/ui/sign_in/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../navigator_utils.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignInCubit(),
      child: BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state == SignInState.none) {
            pushAndReplaceToPage(context, ProfileVerifyView());
          } else {
            pushAndReplaceToPage(context, HomeView());
          }
        },
        builder: (context, snapshot) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Welcome to My Chat App'),
                  ElevatedButton(
                    child: Text('Login with Google'),
                    onPressed: () {
                      context.read<SignInCubit>().signIn();
                    },
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
