import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:iec_project/controllers/auth_controller.dart';

import 'package:get/get.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    Authcontroller auth = Get.put(Authcontroller());
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: const [
              Text(
                'Settings',
                style: TextStyle(
                  fontSize: 24,
                  color: Color.fromARGB(255, 255, 255, 255),
                  // fontWeight: FontWeight.bold,
                ),
              ),
              // Text(
              //   ' ',
              //   style: TextStyle(
              //     fontSize: 22,
              //     color: Colors.black,
              //   ),
              // ),
            ],
          ),
        ),
        elevation: 0.0,
        titleSpacing: 0.0,
        backgroundColor: Color.fromARGB(255, 35, 66, 80),
        actionsIconTheme:
            const IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              auth.signOut();
            },
            child: const Text("sign out")),
      ),
    );
  }
}
