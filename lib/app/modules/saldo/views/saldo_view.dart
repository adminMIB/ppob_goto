import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/saldo_controller.dart';

class SaldoView extends StatefulWidget {
  SaldoView({super.key});

  @override
  State<SaldoView> createState() => _SaldoViewState();
}

class _SaldoViewState extends State<SaldoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Top Up Saldo',
          style: TextStyle(),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 2.h, right: 2.h),
          child: Column(
            children: [
              Text(
                'SaldoView is working',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
