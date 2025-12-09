import 'package:click_game/controllers/controllers/click_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClickController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'WELCOME',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.amber,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
          foregroundColor: Colors.green,
        ),
        body: Padding(
          padding: const EdgeInsets.all(100.0),
          child: Center(
            child: Column(
              children: [
                const Text(
                  'Question 1 earns you \$100',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 100,
                ),
                InkWell(
                  onTap: () {
                    ctrl.start();
                  },
                  child: Container(
                    height: 35,
                    width: 180,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5)),
                    child: const Center(
                      child: Text(
                        'START Question 1',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
