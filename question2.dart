// Question 2: Collections & Control Flow (Difficulty: 2/5) ⭐⭐
/**
 * EXPECTED OUTPUT:
 * Student Scores: {Alice: <random>, Bob: <random>, ...}
 * Highest Score: <Name> with <Score>
 * Lowest Score: <Name> with <Score>
 * Average Score: <Value>
 * Alice: <Score> (Category)
 * ...
 */

import 'dart:math';

void main() {
  // 1. Create a List<String> of student names
  List<String> studentNames = [
    "Alice",
    "Bob",
    "Charlie",
    "Diana",
    "Eve"
  ];

  // 2. Create a Map<String, int> to store student scores
  Map<String, int> studentScores = {};

  // 3. Use a for loop to assign random scores (60-100) to each student
  Random random = Random();

  for (String student in studentNames) {
    int score = 60 + random.nextInt(41);
    studentScores[student] = score;
  }

  // 4. Find and display highest, lowest, and average scores
  String highestStudent = "";
  int highestScore = 0;
  String lowestStudent = "";
  int lowestScore = 100;
  double averageScore = 0.0;

  int totalScore = 0;

  for (String student in studentNames) {
    int score = studentScores[student] ?? 0;

    totalScore += score;

    if (score > highestScore) {
      highestScore = score;
      highestStudent = student;
    }

    if (score < lowestScore) {
      lowestScore = score;
      lowestStudent = student;
    }
  }

  averageScore = totalScore / studentNames.length;

  print("Student Scores: $studentScores");
  print("Highest Score: $highestStudent with $highestScore");
  print("Lowest Score: $lowestStudent with $lowestScore");
  print("Average Score: $averageScore");

  // 5. Categorize each student using a switch statement
  for (String student in studentNames) {
    int score = studentScores[student] ?? 0;
    String category = "";

    switch (score) {
      case >= 90:
        category = "Excellent";
        break;
      case >= 80:
        category = "Good";
        break;
      case >= 70:
        category = "Average";
        break;
      default:
        category = "Needs Improvement";
    }

    print("$student: $score ($category)");
  }
}