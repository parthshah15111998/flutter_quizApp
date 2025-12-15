import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/controller.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
        home: const QuizPage());
  }
}
class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(QuizController());
    return Scaffold(
      appBar: AppBar(title: const Text('Simple GetX Quiz')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(() {
          final q = c.questions[c.index.value];
          return SafeArea(
            bottom: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Question ${c.index.value + 1} / ${c.questions.length}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 12),
                Text(q.q, style: const TextStyle(fontSize: 22)),
                const SizedBox(height: 16),
                ...List.generate(q.opts.length, (i) {
                  // visual feedback after answering:
                  Color tileColor = Colors.grey.shade200;
                  if (c.answered.value) {
                    if (q.correct == i)
                      tileColor = Colors.green.shade300;
                    else if (c.selected.value == i)
                      tileColor = Colors.red.shade300;
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: InkWell(
                      onTap: () => c.pick(i),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: tileColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade400),
                        ),
                        child: Center(
                          child: Text(
                            q.opts[i],
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: c.answered.value ? c.next : null,
                    child: Obx(
                      () => Text(
                        c.index.value == c.questions.length - 1 ? 'Finish' : 'Next',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
