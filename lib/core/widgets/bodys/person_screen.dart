import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studyapp/providers/user_sign_provider.dart';

class PersonAccountScreen extends StatelessWidget {
  const PersonAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: Center(
          child: Text("Person account"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.login_outlined),
        onPressed: () async {
          await context.read<SignProvider>().userLogOut();
          Navigator.pushNamedAndRemoveUntil(
              context, '/signin', (route) => false);
        },
      ),
    );
  }
}
