import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<QuizController>();
    return Scaffold(
      appBar: AppBar(title: const Text('Result'),leading: SizedBox(),),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Your score',
              style: TextStyle(fontSize: 20, color: Colors.grey[700]),
            ),
            const SizedBox(height: 8),
            Obx(
                  () => Text(
                '${c.score.value} / ${c.questions.length}',
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: c.restart, child: const Text('Restart')),
          ],
        ),
      ),
    );
  }
}