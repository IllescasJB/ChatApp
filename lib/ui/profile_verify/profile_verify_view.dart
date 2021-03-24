import 'package:chatApp/navigator_utils.dart';
import 'package:chatApp/ui/home/home_view.dart';
import 'package:chatApp/ui/profile_verify/profile_verify_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileVerifyView extends StatelessWidget {
  ProfileVerifyView();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileVerifyCubit(context.read(), context.read()),
      child: BlocConsumer<ProfileVerifyCubit, ProfileState>(
        listener: (context, snapshot) {
          if (snapshot.success) {
            pushAndReplaceToPage(context, HomeView());
          }
        },
        builder: (context, snapshot) {
          //refresh the photo
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Verify your identity'),
                  if (snapshot.file != null)
                    Image.file(
                      snapshot.file,
                      height: 150,
                    )
                  else
                    Placeholder(
                      fallbackHeight: 100,
                      fallbackWidth: 100,
                    ),
                  IconButton(
                    icon: Icon(Icons.photo),
                    onPressed: () =>
                        context.read<ProfileVerifyCubit>().pickImage(),
                  ),
                  Text('Your name'),
                  TextField(
                    controller:
                        context.read<ProfileVerifyCubit>().nameController,
                    decoration:
                        InputDecoration(hintText: 'Or just how people now you'),
                  ),
                  ElevatedButton(
                    child: Text('Start chatting now'),
                    onPressed: () {
                      //verify
                      context.read<ProfileVerifyCubit>().startChatting();
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
