import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Goal {
  final int id;
  final String title;
  final String description;
  bool isCompleted;

  Goal({
    required this.id,
    required this.title,
    required this.description,
    this.isCompleted = false,
  });
}

class GoalsController extends GetxController {
  var goals = <Goal>[
    Goal(
      id: 1,
      title: 'goal_1_title'.tr,
      description: 'goal_1_desc'.tr,
    ),
    Goal(
      id: 2,
      title: 'goal_2_title'.tr,
      description: 'goal_2_desc'.tr,
    ),
    Goal(
      id: 3,
      title: 'goal_3_title'.tr,
      description: 'goal_3_desc'.tr,
    ),
    Goal(
      id: 4,
      title: 'goal_4_title'.tr,
      description: 'goal_4_desc'.tr,
    ),
    Goal(
      id: 5,
      title: 'goal_5_title'.tr,
      description: 'goal_5_desc'.tr,
    ),
    Goal(
      id: 6,
      title: 'goal_6_title'.tr,
      description: 'goal_6_desc'.tr,
    ),
  ].obs;

  var currentIndex = 0.obs;
  var isAnimating = false.obs;

  double get progressPercentage {
    final completedCount = goals.where((goal) => goal.isCompleted).length;
    return completedCount / goals.length;
  }

  void setCurrentIndex(int index) {
    currentIndex.value = index;
  }

  Future<void> toggleGoalCompletion(int index) async {
    if (isAnimating.value || index >= goals.length) return;

    isAnimating.value = true;
    goals[index].isCompleted = !goals[index].isCompleted;
    update();

    // Only auto-advance if we're marking as complete
    if (goals[index].isCompleted) {
      await Future.delayed(const Duration(milliseconds: 500));
      if (index < goals.length - 1) {
        currentIndex.value = index + 1;
      }
    }

    update();
    isAnimating.value = false;
  }
}