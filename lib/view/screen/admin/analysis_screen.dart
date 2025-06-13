import 'package:flutter/material.dart';
import 'package:food_bridge/controller/admin/analysis_controller.dart';
import 'package:food_bridge/core/class/handlingdataview.dart';
import 'package:food_bridge/core/constant/color.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';

class AnalysisScreen extends StatelessWidget {
  AnalysisScreen({super.key});

  final Map<int, Color> statusColors = {
    0: Colors.orange, // Pending Approval
    1: Colors.green, // Approved
    2: Colors.redAccent // Dismissed
  };

  final Map<int, String> statusLabels = {
    0: 'PendingApproval'.tr,
    1: 'Approved'.tr,
    2: 'Dismissed'.tr
  };

  @override
  Widget build(BuildContext context) {
    Get.put(AnalysisController());

    return Scaffold(
      appBar: AppBar(
        title: Text("AppAnalysis".tr , style: const TextStyle(color: Colors.white, fontSize: 20),),
        backgroundColor: AppColor.primaryColor,
        elevation: 4,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: GetBuilder<AnalysisController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: SingleChildScrollView(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "FoodStatusSummary".tr,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  AspectRatio(
                    aspectRatio: 1.2,
                    child: PieChart(
                      PieChartData(
                        sections: controller.foodStatusData.map((item) {
                          final status = int.tryParse(item['food_status'].toString()) ?? 0;
                          final value = double.tryParse(item['total'].toString()) ?? 0;
                          return PieChartSectionData(
                            value: value,
                            title: '${item['total']}',
                            color: statusColors[status] ?? Colors.grey,
                            radius: 80,
                            titleStyle: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                          );
                        }).toList(),
                        sectionsSpace: 3,
                        centerSpaceRadius: 44,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 20,
                    runSpacing: 10,
                    children: statusLabels.entries.map((entry) {
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: statusColors[entry.key],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            entry.value,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    "OrdersRatingSummary".tr,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  AspectRatio(
                    aspectRatio: 1.5,
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceAround,
                        titlesData: FlTitlesData(
                          leftTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: true, reservedSize: 30),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                int index = value.toInt();
                                if (index >= 0 && index < controller.ordersRatingData.length) {
                                  return Text(
                                    controller.ordersRatingData[index]['orders_rating'].toString(),
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  );
                                }
                                return const Text('');
                              },
                            ),
                          ),
                          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        ),
                        gridData: const FlGridData(show: true, horizontalInterval: 1),
                        borderData: FlBorderData(show: true),
                        barGroups: List.generate(controller.ordersRatingData.length, (index) {
                          final item = controller.ordersRatingData[index];
                          final value = double.tryParse(item['total'].toString()) ?? 0;
                          return BarChartGroupData(
                            x: index,
                            barRods: [
                              BarChartRodData(
                                toY: value,
                                width: 20,
                                color: AppColor.secondaryColor,
                                borderRadius: BorderRadius.circular(8),
                                backDrawRodData: BackgroundBarChartRodData(
                                  show: true,
                                  toY: 5,
                                  color: Colors.grey.shade200,
                                ),
                              ),
                            ],
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
