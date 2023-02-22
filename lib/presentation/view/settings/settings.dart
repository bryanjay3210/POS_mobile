import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_checker/utils/alert_dialog.dart';

import '../login/cubit/login_cubit.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ListTile(
              tileColor: Colors.grey[300],
              title: const Text('Logout'),
              trailing: const Icon(Icons.logout),
              onTap: () {
                customDialog(
                    context: context,
                    title: 'Logout',
                    content: const Text('Are you sure you want to logout?'),
                    action: [
                      TextButton(
                          onPressed: () {
                            context.read<LoginCubit>().signOut();
                            Navigator.pop(context);
                          },
                          child: const Text('Yes')),
                      TextButton(
                          onPressed: () => Navigator.pop(context),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white)),
                          child: const Text(
                            'No',
                            style: TextStyle(color: Colors.black),
                          )),
                    ]);
              },
            )
          ],
        ),
      ),
    );
  }
}
