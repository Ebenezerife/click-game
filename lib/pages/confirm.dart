import 'package:click_game/controllers/controllers/click_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmPage extends StatelessWidget {
  const ConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClickController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Congratulation!!!!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.lightGreenAccent,
        ),
        backgroundColor: Colors.amber,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 100),
                  child: Text(
                    'You Have Successfully Won The Grand Prize of \$1000',
                    style: TextStyle(
                      backgroundColor: Colors.black,
                      color: Colors.amber,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () {
                    ctrl.back();
                  },
                  child: Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5)),
                    child: const Center(
                      child: Text(
                        'Back To Main Page',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
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
