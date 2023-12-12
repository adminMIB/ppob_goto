import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tagihan_controller.dart';

class TagihanView extends GetView<TagihanController> {
  const TagihanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TagihanView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TagihanView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
