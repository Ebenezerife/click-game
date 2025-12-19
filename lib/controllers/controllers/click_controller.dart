import 'dart:async';

import 'package:click_game/game_over_pages/game_over10.dart';
import 'package:click_game/game_over_pages/game_over6.dart';
import 'package:click_game/game_over_pages/game_over7.dart';
import 'package:click_game/game_over_pages/game_over8.dart';
import 'package:click_game/game_over_pages/game_over9.dart';
import 'package:click_game/game_over_pages/gameover1.dart';
import 'package:click_game/game_over_pages/gameover2.dart';
import 'package:click_game/game_over_pages/gameover3.dart';
import 'package:click_game/game_over_pages/gameover4.dart';
import 'package:click_game/game_over_pages/gameover5.dart';
import 'package:click_game/next_pages/topage10.dart';
import 'package:click_game/next_pages/topage2.dart';
import 'package:click_game/next_pages/topage3.dart';
import 'package:click_game/next_pages/topage4.dart';
import 'package:click_game/next_pages/topage5.dart';
import 'package:click_game/next_pages/topage6.dart';
import 'package:click_game/next_pages/topage7.dart';
import 'package:click_game/next_pages/topage8.dart';
import 'package:click_game/next_pages/topage9.dart';
import 'package:click_game/pages/confirm.dart';
import 'package:click_game/pages/eighth_page.dart';
import 'package:click_game/pages/fifth_page.dart';
import 'package:click_game/pages/fourth_page.dart';
import 'package:click_game/pages/home.dart';
import 'package:click_game/pages/nineth_page.dart';
import 'package:click_game/pages/second_page.dart';
import 'package:click_game/pages/seventh_page.dart';
import 'package:click_game/pages/sixth_page.dart';
import 'package:click_game/pages/start_page.dart';
import 'package:click_game/pages/tenth_page.dart';
import 'package:click_game/pages/third_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class ClickController extends GetxController {
  Timer? _timer,
      _timer1,
      _timer2,
      _timer3,
      _timer4,
      _timer5,
      _timer6,
      _timer7,
      _timer8,
      _timer9;
  int remainingseconds = 1;
  int remainingseconds1 = 1;
  int remainingseconds2 = 1;
  int remainingseconds3 = 1;
  int remainingseconds4 = 1;
  int remainingseconds5 = 1;
  int remainingseconds6 = 1;
  int remainingseconds7 = 1;
  int remainingseconds8 = 1;
  int remainingseconds9 = 1;
  var counter = 0.obs;
  var counterr = 0.obs;
  var counterr3 = 0.obs;
  var counterr4 = 0.obs;
  var counterr5 = 0.obs;
  var counterr6 = 0.obs;
  var counterr7 = 0.obs;
  var counterr8 = 0.obs;
  var counterr9 = 0.obs;
  var counterr10 = 0.obs;
  final time = '00.00'.obs;
  final time1 = '00.00'.obs;
  final time2 = '00.00'.obs;
  final time3 = '00.00'.obs;
  final time4 = '00.00'.obs;
  final time5 = '00.00'.obs;
  final time6 = '00.00'.obs;
  final time7 = '00.00'.obs;
  final time8 = '00.00'.obs;
  final time9 = '00.00'.obs;

// new feature for simplicity
  final question1 = 'Multiply the square root of 25 by 10'.obs;
  final question2 = 'Subtract 100 from the product of 20 and 10'.obs;
  final question3 = 'Add 64 to the numbers of state we have in Nigeria'.obs;
  final question4 = 'If X=10 and F= 20, find the product of FX'.obs;
  final question5 =
      'Multiply the number of letters in LAGOS by the Sqaure Root of 16. Multiply the answer by 3'
          .obs;
  final question6 =
      'If X=3,500 and G= 2,000. Find X-G and divide the answer by 10'.obs;
  final question7 = '2 dozens times 7'.obs;
  final question8 = '(3 dozens multiplied by 5)-20'.obs;
  final question9 = '1 dozen times 9'.obs;
  final question10 =
      'How many odd numbers are there between from 3 to 50. Multiply the answer by 5'
          .obs;

  final options1 = 'A.50 B.55 C.60 D.45 E.150'.obs;
  final options2 = 'A.50 B.55 C.60 D.100 E.150'.obs;
  final options3 = 'No Option'.obs; // 'A.50 B.100 C.60 D.45 E.150'.obs;
  final options4 = 'No Option'.obs; // 'A.250 B.55 C.200 D.210 E.150'.obs;
  final options5 = 'No Option'.obs; // 'A.50 B.55 C.60 D.45 E.150'.obs;
  final options6 = 'No Option'.obs; // 'A.50 B.72 C.60 D.45 E.150'.obs;
  final options7 = 'No Option'.obs; // 'A.50 B.55 C.60 D.84 E.150'.obs;
  final options8 = 'No Option'.obs; // 'A.50 B.55 C.60 D.96 E.150'.obs;
  final options9 = 'No Option'.obs; // 'A.50 B.108 C.60 D.45 E.150'.obs;
  final options10 = 'No Option'.obs; // 'A.50 B.55 C.60 D.45 E.120'.obs;

  final answer1 = 50;
  final answer2 = 100;
  final answer3 = 100;
  final answer4 = 200;
  final answer5 = 60;
  final answer6 = 150;
  final answer7 = 168;
  final answer8 = 160;
  final answer9 = 108;
  final answer10 = 115;
  // new features for simplicity stops here

  // testrunning for lucky click starts here

  final task = '5000'.obs;
  var counting = 0.obs;
  final times = '00.00'.obs;
  final timing = '00.00'.obs;
  final tipToLucky = '''YOUR LUCKY NUMBER IS ADDING THE SQUAREROOT OF 114 TO 28.
  ADD THE ANSWER TO THE NUMBER OF STATES IN NIGERIA. SUBTRACT THE ANSWER FROM 100
  . DIVIDE THE REMAINING ANSWER BY THE SQUARE ROOT OF 16'''
      .obs;
  final callAFriend =
      'You can call a friend at when the clock reaches 4.00'.obs;

  void decrementCountingminus5() {
    counting.value - 5;
  }

  void decrementCountingminus10() {
    counting.value - 10;
  }

  void decrementCountingminus15() {
    counting.value - 15;
  }

  void decrementCountingminus20() {
    counting.value - 20;
  }

  void decrementCountingminus25() {
    counting.value - 25;
  }

  void decrementCountingminus30() {
    counting.value - 30;
  }

  void decrementCountingminus35() {
    counting.value - 35;
  }

  void decrementCountingminus40() {
    counting.value - 40;
  }

  void decrementCountingminus45() {
    counting.value - 45;
  }

  void decrementCountingminus50() {
    counting.value - 50;
  }

  void decrementCountingminus55() {
    counting.value - 55;
  }

  void decrementCountingminus60() {
    counting.value - 60;
  }

  void decrementCountingminus65() {
    counting.value - 65;
  }

  void decrementCountingminus70() {
    counting.value - 70;
  }

  void decrementCountingminus75() {
    counting.value - 75;
  }

  void decrementCountingminus80() {
    counting.value - 80;
  }

  void decrementCountingminus85() {
    counting.value - 85;
  }

  void decrementCountingminus90() {
    counting.value - 90;
  }

  void incrementCountingPlus1() {
    counting.value++;
  }

  void luckyNumber() {
    counting.value + 5;
  }
  // testrunning for lucky click ends here

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference basicsCollection;

  @override
  void onInit() {
    basicsCollection = firestore.collection('basics');
    super.onInit();
  }

  // @override
  // void onReady() {
  //  _startTimer(120);
  //  super.onReady();
  // }

  void back() {
    Get.offAll(const StartPage());
    _timer?.cancel();
    _timer1?.cancel();
    _timer2?.cancel();
    _timer3?.cancel();
    _timer4?.cancel();
    _timer5?.cancel();
    _timer6?.cancel();
    _timer7?.cancel();
    _timer8?.cancel();
    _timer9?.cancel();
    counter = 0.obs;
    counterr = 0.obs;
    counterr3 = 0.obs;
    counterr4 = 0.obs;
    counterr5 = 0.obs;
    counterr6 = 0.obs;
    counterr7 = 0.obs;
    counterr8 = 0.obs;
    counterr9 = 0.obs;
    counterr10 = 0.obs;
  }

  void decrementCounter() {
    counter.value--;
  }

  void decrementCounterr() {
    counterr.value--;
  }

  void decrementCounterr3() {
    counterr3.value--;
  }

  void decrementCounterr4() {
    counterr4.value--;
  }

  void decrementCounterr5() {
    counterr5.value--;
  }

  void decrementCounterr6() {
    counterr6.value--;
  }

  void decrementCounterr7() {
    counterr7.value--;
  }

  void decrementCounterr8() {
    counterr8.value--;
  }

  void decrementCounterr9() {
    counterr9.value--;
  }

  void decrementCounterr10() {
    counterr10.value--;
  }

  void incrementCounter() {
    counter.value++;
  }

  void incrementCounter2() {
    counterr.value++;
  }

  void incrementCounter3() {
    counterr3.value++;
  }

  void incrementCounter4() {
    counterr4.value++;
  }

  void incrementCounter5() {
    counterr5.value++;
  }

  void incrementCounter6() {
    counterr6.value++;
  }

  void incrementCounter7() {
    counterr7.value++;
  }

  void incrementCounter8() {
    counterr8.value++;
  }

  void incrementCounter9() {
    counterr9.value++;
  }

  void incrementCounter10() {
    counterr10.value++;
  }

  void submit1() {
    submitCounter();
  }

  void submit2() {
    submitCounter2();
  }

  void submit3() {
    submitCounter3();
  }

  void submit4() {
    submitCounter4();
  }

  void submit5() {
    submitCounter5();
  }

  void submit6() {
    submitCounter6();
  }

  void submit7() {
    submitCounter7();
  }

  void submit8() {
    submitCounter8();
  }

  void submit9() {
    submitCounter9();
  }

  void submit10() {
    submitCounter10();
  }

  void start() {
    _startTimer(50);
    Get.off(HomePage(title: ''));
  }

  void start1() {
    _startTimer1(50);
    Get.off(SecondPage());
  }

  void start2() {
    _startTimer2(50);
    Get.off(ThirdPage());
  }

  void start3() {
    _startTimer3(50);
    Get.off(FourthPage());
  }

  void start4() {
    _startTimer4(50);
    Get.off(FifthPage());
  }

  void start5() {
    _startTimer5(50);
    Get.off(SixthPage());
  }

  void start6() {
    _startTimer6(50);
    Get.off(SeventhPage());
  }

  void start7() {
    _startTimer7(50);
    Get.off(EighthPage());
  }

  void start8() {
    _startTimer8(50);
    Get.off(NinethPage());
  }

  void start9() {
    _startTimer9(50);
    Get.off(TenthPage());
  }

  @override
  void onClose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    if (_timer1 != null) {
      _timer!.cancel();
    }
    if (_timer2 != null) {
      _timer!.cancel();
    }
    if (_timer3 != null) {
      _timer!.cancel();
    }
    if (_timer4 != null) {
      _timer!.cancel();
    }
    if (_timer5 != null) {
      _timer!.cancel();
    }
    if (_timer6 != null) {
      _timer!.cancel();
    }
    if (_timer7 != null) {
      _timer!.cancel();
    }
    if (_timer8 != null) {
      _timer!.cancel();
    }
    if (_timer9 != null) {
      _timer!.cancel();
    }
  }
  // https://www.youtube.com/watch?v=2PPNurZgSt4

  void _startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainingseconds = seconds;

    _timer = Timer.periodic(duration, (Timer timer) {
      if (remainingseconds == 0) {
        timer.cancel();
        Get.off(const GameOver1());
      } else {
        int minutes = remainingseconds ~/ 60;
        int seconds = (remainingseconds % 60);
        time.value =
            "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
        remainingseconds--;
      }
    });
  }

  // second page
  void _startTimer1(int seconds) {
    const duration = Duration(seconds: 1);
    remainingseconds1 = seconds;

    _timer1 = Timer.periodic(duration, (Timer timer1) {
      if (remainingseconds1 == 0) {
        timer1.cancel();
        Get.off(const GameOver2());
      } else {
        int minutes = remainingseconds1 ~/ 60;
        int seconds = (remainingseconds1 % 60);
        time1.value =
            "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
        remainingseconds1--;
      }
    });
  }

  //third page
  void _startTimer2(int seconds) {
    const duration = Duration(seconds: 1);
    remainingseconds2 = seconds;

    _timer2 = Timer.periodic(duration, (Timer timer2) {
      if (remainingseconds2 == 0) {
        timer2.cancel();
        Get.off(const GameOver3());
      } else {
        int minutes = remainingseconds2 ~/ 60;
        int seconds = (remainingseconds2 % 60);
        time2.value =
            "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
        remainingseconds2--;
      }
    });
  }

  // fourth page
  void _startTimer3(int seconds) {
    const duration = Duration(seconds: 1);
    remainingseconds3 = seconds;

    _timer3 = Timer.periodic(duration, (Timer timer3) {
      if (remainingseconds3 == 0) {
        timer3.cancel();
        Get.off(const GameOver4());
      } else {
        int minutes = remainingseconds3 ~/ 60;
        int seconds = (remainingseconds3 % 60);
        time3.value =
            "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
        remainingseconds3--;
      }
    });
  }

// fifth page
  void _startTimer4(int seconds) {
    const duration = Duration(seconds: 1);
    remainingseconds4 = seconds;

    _timer4 = Timer.periodic(duration, (Timer timer4) {
      if (remainingseconds4 == 0) {
        timer4.cancel();
        Get.off(const GameOver5());
      } else {
        int minutes = remainingseconds4 ~/ 60;
        int seconds = (remainingseconds4 % 60);
        time4.value =
            "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
        remainingseconds4--;
      }
    });
  }

// page 6
  void _startTimer5(int seconds) {
    const duration = Duration(seconds: 1);
    remainingseconds5 = seconds;

    _timer5 = Timer.periodic(duration, (Timer timer5) {
      if (remainingseconds5 == 0) {
        _timer5?.cancel();
        Get.off(const GameOver6());
      } else {
        int minutes = remainingseconds5 ~/ 60;
        int seconds = (remainingseconds5 % 60);
        time5.value =
            "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
        remainingseconds5--;
      }
    });
  }

  void _startTimer6(int seconds) {
    const duration = Duration(seconds: 1);
    remainingseconds6 = seconds;

    _timer6 = Timer.periodic(duration, (Timer timer6) {
      if (remainingseconds6 == 0) {
        _timer6!.cancel();
        Get.off(const GameOver7());
      } else {
        int minutes = remainingseconds6 ~/ 60;
        int seconds = (remainingseconds6 % 60);
        time6.value =
            "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
        remainingseconds6--;
      }
    });
  }

  void _startTimer7(int seconds) {
    const duration = Duration(seconds: 1);
    remainingseconds7 = seconds;

    _timer7 = Timer.periodic(duration, (Timer timer7) {
      if (remainingseconds7 == 0) {
        timer7.cancel();
        Get.off(const GameOver8());
      } else {
        int minutes = remainingseconds7 ~/ 60;
        int seconds = (remainingseconds7 % 60);
        time7.value =
            "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
        remainingseconds7--;
      }
    });
  }

  void _startTimer8(int seconds) {
    const duration = Duration(seconds: 1);
    remainingseconds8 = seconds;

    _timer8 = Timer.periodic(duration, (Timer timer8) {
      if (remainingseconds4 == 0) {
        timer8.cancel();
        Get.off(const GameOver9());
      } else {
        int minutes = remainingseconds8 ~/ 60;
        int seconds = (remainingseconds8 % 60);
        time8.value =
            "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
        remainingseconds8--;
      }
    });
  }

  void _startTimer9(int seconds) {
    const duration = Duration(seconds: 1);
    remainingseconds9 = seconds;

    _timer9 = Timer.periodic(duration, (Timer timer9) {
      if (remainingseconds9 == 0) {
        timer9.cancel();
        Get.off(const GameOver10());
      } else {
        int minutes = remainingseconds9 ~/ 60;
        int seconds = (remainingseconds9 % 60);
        time9.value =
            "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
        remainingseconds9--;
      }
    });
  }

  void submitCounter() {
    try {
      if (counter < answer1 || counter > answer1) {
        Get.snackbar('Wrong Answer', 'Congratulations, you made it to step 2',
            duration: const Duration(seconds: 1),
            titleText: const Text(
              'Wrong Answer!!!',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                color: Colors.red,
              ),
            ),
            messageText: const Text(
              'Keep Trying',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                color: Colors.green,
              ),
            ),
            colorText: Colors.red);
        const ClearSelectionEvent();
      } else if (counter == answer1.obs) {
        Get.snackbar(
            'Congratulations', 'Congratulations, you made it to step 2',
            colorText: Colors.green);
        _timer?.cancel();
        update();

        Get.off(const Question2());
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    }
  }

  Future<void> submitCounter2() async {
    try {
      if (counterr < answer2 || counterr > answer2) {
        Get.snackbar('Wrong Answer', 'Congratulations, you made it to step 2',
            titleText: const Text(
              'Wrong Answer!!!',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                color: Colors.red,
              ),
            ),
            messageText: const Text(
              'Keep Trying',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                color: Colors.green,
              ),
            ),
            colorText: Colors.red);

        const ClearSelectionEvent();
      } else if (counterr == answer2.obs) {
        Get.snackbar(
            'Congratulations', 'Congratulations, you made it to step 3',
            colorText: Colors.green);
        _timer1?.cancel();
        update();
        Get.off(const Question3());
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    }
  }

  Future<void> submitCounter3() async {
    try {
      if (counterr3 < answer3 || counterr3 > answer3) {
        Get.snackbar('Wrong Answer', 'Congratulations, you made it to step 2',
            titleText: const Text(
              'Wrong Answer!!!',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                color: Colors.red,
              ),
            ),
            messageText: const Text(
              'Keep Trying',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                color: Colors.green,
              ),
            ),
            colorText: Colors.red);

        const ClearSelectionEvent();
      } else if (counterr3 == answer3.obs) {
        Get.snackbar(
            'Congratulations', 'Congratulations, you made it to step 4',
            colorText: Colors.green);
        _timer2?.cancel();
        update();
        Get.off(const Question4());
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    }
  }

  Future<void> submitCounter4() async {
    try {
      if (counterr4 < answer4 || counterr4 > answer4) {
        Get.snackbar('Wrong Answer', 'Congratulations, you made it to step 2',
            titleText: const Text(
              'Wrong Answer!!!',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                color: Colors.red,
              ),
            ),
            messageText: const Text(
              'Keep Trying',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                color: Colors.green,
              ),
            ),
            colorText: Colors.red);

        const ClearSelectionEvent();
      } else if (counterr4 == answer4.obs) {
        Get.snackbar(
            'Congratulations', 'Congratulations, you made it to step 5',
            colorText: Colors.green);
        _timer3?.cancel();
        update();
        Get.off(const Question5());
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    }
  }

  Future<void> submitCounter5() async {
    try {
      if (counterr5 < answer5 || counterr5 > answer5) {
        Get.snackbar('Wrong Answer', 'Congratulations, you made it to step 2',
            titleText: const Text(
              'Wrong Answer!!!',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                color: Colors.red,
              ),
            ),
            messageText: const Text(
              'Keep Trying',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                color: Colors.green,
              ),
            ),
            colorText: Colors.red);

        const ClearSelectionEvent();
      } else if (counterr5 == answer5.obs) {
        Get.snackbar('Congratulations', 'Congratulations',
            colorText: Colors.green);
        _timer4?.cancel();
        update();
        Get.off(const Question6());
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    }
  }

  Future<void> submitCounter6() async {
    try {
      if (counterr6 < answer6 || counterr6 > answer6) {
        Get.snackbar('Wrong Answer', 'Congratulations, you made it to step 2',
            titleText: const Text(
              'Wrong Answer!!!',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                color: Colors.red,
              ),
            ),
            messageText: const Text(
              'Keep Trying',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                color: Colors.green,
              ),
            ),
            colorText: Colors.red);

        const ClearSelectionEvent();
      } else if (counterr6 == answer6.obs) {
        Get.snackbar('Congratulations', 'Congratulations',
            colorText: Colors.green);
        _timer5?.cancel();
        update();
        Get.off(const Question7());
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    }
  }

  Future<void> submitCounter7() async {
    try {
      if (counterr7 < answer7 || counterr7 > answer7) {
        Get.snackbar('Wrong Answer', 'Congratulations, you made it to step 2',
            titleText: const Text(
              'Wrong Answer!!!',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                color: Colors.red,
              ),
            ),
            messageText: const Text(
              'Keep Trying',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                color: Colors.green,
              ),
            ),
            colorText: Colors.red);

        const ClearSelectionEvent();
      } else if (counterr7 == answer7.obs) {
        Get.snackbar('Congratulations', 'Congratulations',
            colorText: Colors.green);
        _timer6?.cancel();
        update();
        Get.off(const Question8());
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    }
  }

  Future<void> submitCounter8() async {
    try {
      if (counterr8 < answer8 || counterr8 > answer8) {
        Get.snackbar('Wrong Answer', 'Congratulations, you made it to step 2',
            titleText: const Text(
              'Wrong Answer!!!',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                color: Colors.red,
              ),
            ),
            messageText: const Text(
              'Keep Trying',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                color: Colors.green,
              ),
            ),
            colorText: Colors.red);

        const ClearSelectionEvent();
      } else if (counterr5 == answer5.obs) {
        Get.snackbar('Congratulations', 'Congratulations',
            colorText: Colors.green);
        _timer7?.cancel();
        update();
        Get.off(const Question9());
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    }
  }

  Future<void> submitCounter9() async {
    try {
      if (counterr9 < answer9 || counterr9 > answer9) {
        Get.snackbar('Wrong Answer', 'Congratulations, you made it to step 2',
            titleText: const Text(
              'Wrong Answer!!!',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                color: Colors.red,
              ),
            ),
            messageText: const Text(
              'Keep Trying',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                color: Colors.green,
              ),
            ),
            colorText: Colors.red);

        const ClearSelectionEvent();
      } else if (counterr5 == answer5.obs) {
        Get.snackbar('Congratulations', 'Congratulations',
            colorText: Colors.green);
        _timer8?.cancel();
        update();
        Get.off(const Question10());
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    }
  }

  Future<void> submitCounter10() async {
    try {
      if (counterr10 < answer10 || counterr10 > answer10) {
        Get.snackbar('Wrong Answer', 'Congratulations, you made it to step 2',
            titleText: const Text(
              'Wrong Answer!!!',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                color: Colors.red,
              ),
            ),
            messageText: const Text(
              'Keep Trying',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                color: Colors.green,
              ),
            ),
            colorText: Colors.red);

        const ClearSelectionEvent();
      } else if (counterr5 == answer5.obs) {
        Get.snackbar('Congratulations', 'Congratulations',
            colorText: Colors.green);
        _timer9?.cancel();
        update();
        Get.off(const ConfirmPage());
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    }
  }
}
