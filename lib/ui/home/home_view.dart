import 'package:chatApp/navigator_utils.dart';
import 'package:chatApp/ui/home/home_cubit.dart';
import 'package:chatApp/ui/home/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chat/chat_view.dart';
import 'chat/selection/friends_selection_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Column(
        children: [
          Expanded(
            child: BlocBuilder<HomeCubit, int>(
              builder: (context, state) {
                return IndexedStack(
                  index: state,
                  children: [
                    ChatView(),
                    SettingsView(),
                  ],
                );
              },
            ),
          ),
          HomeNavigationBar(),
        ],
      ),
    );
  }
}

class HomeNavigationBar extends StatefulWidget {
  HomeNavigationBar({Key key}) : super(key: key);

  @override
  _HomeNavigationBarState createState() => _HomeNavigationBarState();
}

class _HomeNavigationBarState extends State<HomeNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: Text('Chats'),
            onPressed: () {
              context.read<HomeCubit>().onChangeTap(0);
            },
          ),
          FloatingActionButton(
            onPressed: () {
              pushToPage(context, FriendsSelectionView());
            },
            child: Icon(Icons.add),
          ),
          ElevatedButton(
            child: Text('Settings'),
            onPressed: () {
              context.read<HomeCubit>().onChangeTap(1);
            },
          ),
        ],
      ),
    );
  }
}
