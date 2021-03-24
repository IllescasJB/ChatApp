import 'package:chatApp/ui/home/home_view.dart';
import 'package:chatApp/ui/profile_verify/profile_verify_view.dart';
import 'package:chatApp/ui/sign_in/sign_in_view.dart';
import 'package:chatApp/ui/splash/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../navigator_utils.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(context.read())..init(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state == SplashState.none) {
            pushAndReplaceToPage(context, SignInView());
          } else if (state == SplashState.existing_user) {
            pushAndReplaceToPage(context, HomeView());
          } else {
            pushAndReplaceToPage(context, ProfileVerifyView());
          }
        },
        child: Scaffold(
          backgroundColor: Colors.red,
        ),
      ),
    );
  }
}
