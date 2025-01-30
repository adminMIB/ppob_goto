import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/goto_controller.dart';

class GotoView extends GetView<GotoController> {
  const GotoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GotoView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'GotoView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
