import 'package:click_game/pages/payment_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController amountController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String PublicKey = '';
  final Plugin = PaystackPlugin();
  String message = '';

  @override
  void initState() {
    super.initState();
    Plugin.initialize(publicKey: PublicKey);
  }

  void makePayment() async {
    int price = int.parse(amountController.text) * 100;
    Charge charge = Charge()
      ..amount = price
      ..reference = 'ref_${DateTime.now()}'
      ..email = emailController.text
      ..currency = 'NGN';

    CheckoutResponse response = await Plugin.checkout(
      context,
      method: CheckoutMethod.card,
      charge: charge,
    );

    if (response.status == true) {
      message = 'Payment was successful.Ref : ${response.reference}';
      if (mounted) {}
      Navigator.pushNamedAndRemoveUntil(
          context,
          MaterialPageRoute(
                  builder: (context) => PaymentSuccess(message: message))
              .toString(),
          ModalRoute.withName('/'));
    } else {
      print(response.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Page'),
      ),
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            TextFormField(
              controller: amountController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the amount';
                }
                return null;
              },
              decoration: const InputDecoration(
                prefix: Text('NGN'),
                hintText: '1000',
                labelText: 'Amount',
                border: OutlineInputBorder(),
              ),
            ),
            TextFormField(
              controller: emailController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
              decoration: const InputDecoration(
                prefix: Text('NGN'),
                hintText: '1000',
                labelText: 'Amount',
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                makePayment();
              },
              child: const Text('Make Payment'),
            )
          ],
        ),
      ),
    );
  }
}
