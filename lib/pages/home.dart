import 'package:click_game/controllers/controllers/click_controller.dart';
import 'package:click_game/pages/payment_page.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required String title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  var ctrl = Get.put(ClickController());

  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Future<void> signOut() async {
  //   await _firebaseAuth.signOut();
  //   Get.offAll(MainPage());
  // }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClickController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text(
            'CLICK GAME',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Dear ${user.email}'),
                    const SizedBox(
                      width: 20,
                    ),
                    // const Text('Balance: NGN 500,000,000')
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     InkWell(
                //       onTap: () {},
                //       child: Container(
                //         height: 35,
                //         width: 180,
                //         decoration: BoxDecoration(
                //             color: Colors.green,
                //             borderRadius: BorderRadius.circular(5)),
                //         child: const Center(
                //           child: Text(
                //             'Withraw Money',
                //             style: TextStyle(
                //               fontSize: 20,
                //               fontWeight: FontWeight.bold,
                //               color: Colors.amber,
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //     InkWell(
                //       onTap: () {
                //         Get.to(const PaymentPage());
                //       },
                //       child: Container(
                //         height: 35,
                //         width: 180,
                //         decoration: BoxDecoration(
                //             color: Colors.blue,
                //             borderRadius: BorderRadius.circular(5)),
                //         child: const Center(
                //           child: Text(
                //             'Deposit',
                //             style: TextStyle(
                //               fontSize: 20,
                //               fontWeight: FontWeight.bold,
                //               color: Colors.amber,
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ), // commented out for future use
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
                      ctrl.question1.toString(),
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
                      ctrl.options1.toString(),
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
                      ctrl.counter.toString(),
                      style: const TextStyle(
                          fontSize: 50, fontWeight: FontWeight.bold),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Obx(() => Text(
                      ctrl.time.toString(),
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
              onPressed: ctrl.incrementCounter,
              tooltip: 'Start Clicking',
              child: const Icon(Icons.add),
            ),
            InkWell(
              onTap: () {
                ctrl.submit1();
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
              onPressed: ctrl.decrementCounter,
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
