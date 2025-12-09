import 'package:click_game/controllers/controllers/click_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FourthPage extends StatelessWidget {
  const FourthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClickController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text(
            'CLICK GAME 4',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  thickness: 5,
                  height: 5,
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 15,
                ),
                Obx(() => Text(
                      ctrl.question4.toString(),
                      style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                      textAlign: TextAlign.center,
                    )),
                const SizedBox(
                  height: 15,
                ),
                Obx(() => Text(
                      ctrl.options4.toString(),
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                      textAlign: TextAlign.center,
                    )),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Note: Use the '+' and '-' button below to press the answer."
                  " Each game cost N10 and you could be a winner to win something huge.",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(() => Text(
                      ctrl.counterr4.toString(),
                      style: const TextStyle(
                          fontSize: 50, fontWeight: FontWeight.bold),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Obx(() => Text(
                      ctrl.time3.toString(),
                      style: const TextStyle(
                          fontSize: 80, fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              onPressed: ctrl.incrementCounter4,
              tooltip: 'Start Clicking',
              child: const Icon(Icons.add),
            ),
            InkWell(
              onTap: () {
                ctrl.submit4();
              },
              child: Container(
                height: 35,
                width: 180,
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(5)),
                child: const Center(
                  child: Text(
                    'Sumnit Answer',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                    ),
                  ),
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: ctrl.decrementCounterr4,
              tooltip: 'Start Clicking',
              child: const Icon(Icons.remove),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
    });
  }
}
