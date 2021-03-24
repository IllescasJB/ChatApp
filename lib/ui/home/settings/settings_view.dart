import 'package:chatApp/navigator_utils.dart';
import 'package:chatApp/ui/app_theme_cubit.dart';
import 'package:chatApp/ui/home/settings/settings_cubit.dart';
import 'package:chatApp/ui/sign_in/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = StreamChat.of(context).client.state.user;
    print('USUARIO ENCONTRADO: ${user.id}');
    print(user.extraData);
    final image = user?.extraData['image'];
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              SettingsSwitchCubit(context.read<AppThemeCubit>().isDark),
        ),
        BlocProvider(
          create: (context) => SettingsLogoutCubit(context.read()),
        ),
      ],
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              if (image != null) Image.network(image) else Placeholder(),
              BlocBuilder<SettingsSwitchCubit, bool>(
                builder: (context, state) {
                  return Switch(
                    value: state,
                    onChanged: (value) {
                      context
                          .read<SettingsSwitchCubit>()
                          .onChangeDarkMode(value);
                      context.read<AppThemeCubit>().updateTheme(value);
                    },
                  );
                },
              ),
              Builder(
                builder: (context) {
                  return BlocListener<SettingsLogoutCubit, void>(
                    listener: (context, state) {
                      popAllAndPush(context, SignInView());
                    },
                    child: ElevatedButton(
                      child: Text('LOGOUT'),
                      onPressed: () {
                        context.read<SettingsLogoutCubit>().logOut();
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
