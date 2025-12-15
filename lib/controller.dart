import 'package:flutter_quiz_app/result.dart';
import 'package:get/get.dart';
import 'main.dart';
import 'model.dart';

class QuizController extends GetxController {
  final questions =
      <Question>[
        Question('Capital of France?', [
          'Paris',
          'London',
          'Berlin',
          'Madrid',
        ], 0),
        Question('Red Planet?', ['Earth', 'Mars', 'Jupiter', 'Saturn'], 1),
        Question('5 + 7 = ?', ['10', '11', '12', '13'], 2),
        Question('Language for Flutter?', [
          'Kotlin',
          'Swift',
          'Dart',
          'Java',
        ], 2),
        Question('Author of Romeo & Juliet?', [
          'Dickens',
          'Shakespeare',
          'Twain',
          'Tolstoy',
        ], 1),
        Question('HTTP stands for?', [
          'HyperText...',
          'HighText...',
          'Hyperloop...',
          'HyperText Transmission...',
        ], 0),
        Question('Plants absorb?', ['Oxygen', 'Nitrogen', 'CO2', 'Helium'], 2),
        Question('Largest ocean?', [
          'Atlantic',
          'Indian',
          'Arctic',
          'Pacific',
        ], 3),
        Question('Boiling point of water?', [
          '90°C',
          '100°C',
          '110°C',
          '120°C',
        ], 1),
        Question('King of the Jungle?', [
          'Tiger',
          'Elephant',
          'Lion',
          'Giraffe',
        ], 2),
      ].obs;

  final index = 0.obs, score = 0.obs, selected = (-1).obs;
  final answered = false.obs;

  void pick(int i) {
    if (answered.value) return;
    selected.value = i;
    answered.value = true;
    if (questions[index.value].correct == i) score.value++;
  }

  void next() {
    if (!answered.value) return;
    if (index.value < questions.length - 1) {
      index.value++;
      selected.value = -1;
      answered.value = false;
    } else {
      Get.to(() => const ResultPage());
    }
  }

  void restart() {
    index.value = 0;
    selected.value = -1;
    answered.value = false;
    score.value = 0;
    Get.offAll(() => const QuizPage());
  }
}
