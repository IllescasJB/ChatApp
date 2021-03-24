import 'package:chatApp/dependencies.dart';
import 'package:chatApp/ui/app_theme_cubit.dart';
import 'package:chatApp/ui/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _streamChatClient = StreamChatClient('ee7kbu3sx7rg');

  void _fakeUser() async {
    await _streamChatClient.disconnect();
    _streamChatClient.connectUser(User(id: 'jovaniillescas'),
        _streamChatClient.devToken('jovaniillescas'));
    /*
    final message = Message(
      text:
          '@Josh I told them I was pesca-pescatarian. Which is one who eats solely fish who eat other fish.',
      attachments: [
        Attachment(
            type: "image",
            assetUrl: "https://bit.ly/2K74TaG",
            thumbUrl: "https://bit.ly/2Uumxti",
            extraData: {
              "myCustomField": 123,
            }),
      ],
      mentionedUsers: [User(id: "jovani")],
      extraData: {
        "anotherCustomField": 234,
      },
    );
    
    await _streamChatClient.sendMessage(message, 'canalPaCaldear', 'messaging');
    */
    final channel =
        _streamChatClient.channel('messaging', id: 'jovani', extraData: {
      'members': [
        'jovaniillescas',
        'jovani',
      ]
    });
    await channel.watch();
  }

  @override
  Widget build(BuildContext context) {
    //_fakeUser();
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return MultiRepositoryProvider(
      providers: buildRepositories(_streamChatClient),
      child: BlocProvider(
        create: (context) => AppThemeCubit(context.read())..init(),
        child: BlocBuilder<AppThemeCubit, bool>(builder: (context, snapshot) {
          return MaterialApp(
            title: 'My Chat App',
            theme: snapshot ? ThemeData.dark() : ThemeData.light(),
            home: SplashView(),
            builder: (context, child) {
              return StreamChat(child: child, client: _streamChatClient);
            },
          );
        }),
      ),
    );
  }
}
