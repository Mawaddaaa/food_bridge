import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/donor/goals_controller.dart';
import '../../../core/constant/color.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GoalsController controller = Get.put(GoalsController());
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: GetBuilder<GoalsController>(
          builder: (_) {
            final allCompleted = controller.goals.every((goal) => goal.isCompleted);

            return allCompleted
                ? _CongratulationScreen(controller: controller)
                : Column(
              children: [
                _ProgressHeader(controller: controller),
                Expanded(
                  child: PageView.builder(
                    physics: controller.isAnimating.value
                        ? const NeverScrollableScrollPhysics()
                        : const BouncingScrollPhysics(),
                    controller: PageController(initialPage: controller.currentIndex.value),
                    onPageChanged: (index) {
                      controller.setCurrentIndex(index);
                    },
                    itemCount: controller.goals.length,
                    itemBuilder: (context, index) {
                      final goal = controller.goals[index];
                      return _GoalCard(
                        goal: goal,
                        index: index,
                        controller: controller,
                        theme: theme,
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _CongratulationScreen extends StatelessWidget {
  final GoalsController controller;

  const _CongratulationScreen({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Colors.yellow.withOpacity(0.3),
                    Colors.orange.withOpacity(0.3),
                  ],
                ),
              ),
              child: const Icon(
                Icons.emoji_events,
                size: 90,
                color: Colors.amber,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Congrats'.tr,
              style: const TextStyle(
                fontSize: 28,
                color: Colors.green,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'CongratsBody'.tr,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
          Text(
            'goals_count'.tr.replaceFirst(
                '{completed}',
                controller.goals.where((g) => g.isCompleted).length.toString()
            ).replaceFirst(
                '{total}',
                controller.goals.length.toString()
            ),
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                  fontWeight: FontWeight.bold
              ),
            ),

            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                for (var goal in controller.goals) {
                  goal.isCompleted = false;
                }
                controller.currentIndex.value = 0;
                controller.update();
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: AppColor.primaryColor,
              ),
              child: Text(
                'Statrtagain'.tr,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Keep the existing _ProgressHeader and _GoalCard widgets exactly as before

class _ProgressHeader extends StatelessWidget {
  const _ProgressHeader({
    required this.controller,
    Key? key,
  }) : super(key: key);

  final GoalsController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ProgressTitle'.tr,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: controller.progressPercentage,
            backgroundColor: Colors.grey[200],
            color: Colors.green,
            minHeight: 12,
            borderRadius: BorderRadius.circular(10),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                      Text(
                      'goals_count'.tr.replaceFirst(
                          '{completed}',
                          controller.goals.where((g) => g.isCompleted).length.toString()
                      ).replaceFirst(
                          '{total}',
                          controller.goals.length.toString()
                      ),

                style: Theme.of(context).textTheme.bodyMedium,
              ),

                Text(
                'completed_percentage'.tr.replaceAll(
                '{percent}',
                (controller.progressPercentage * 100).toStringAsFixed(0)
                ),

                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}

class _GoalCard extends StatelessWidget {
  const _GoalCard({
    required this.goal,
    required this.index,
    required this.controller,
    required this.theme,
    Key? key,
  }) : super(key: key);

  final Goal goal;
  final int index;
  final GoalsController controller;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 10, bottom: 70),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 4,
        color: goal.isCompleted ? Colors.green.shade50 : theme.cardColor,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: goal.isCompleted
                          ? Colors.green.withOpacity(0.2)
                          : Colors.orange.withOpacity(0.2),
                    ),
                  ),
                  Icon(
                    Icons.emoji_events,
                    size: 60,
                    color: goal.isCompleted ? Colors.green : Colors.orange,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                goal.title,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: goal.isCompleted ? Colors.green : theme.textTheme.headlineSmall?.color,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                goal.description,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              CheckboxListTile(
                value: goal.isCompleted,
                title: Text(
                  goal.isCompleted ? "completed".tr : "markascomplete".tr,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: goal.isCompleted ? Colors.green : AppColor.primaryColor,
                  ),
                ),
                onChanged: (val) {
                  if (!controller.isAnimating.value) {
                    controller.toggleGoalCompletion(index);
                  }
                },
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.green,
                tileColor: Colors.transparent,
                contentPadding: EdgeInsets.zero,
              ),
            ],
          ),
        ),
      ),
    );
  }
}