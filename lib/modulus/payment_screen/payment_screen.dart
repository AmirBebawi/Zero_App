import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);
  static const String routeName = 'paymentScreen';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Check Out',style: TextStyle(color: Colors.black ,fontSize: 15)),
        centerTitle: true,
      ),
    );
  }
}
