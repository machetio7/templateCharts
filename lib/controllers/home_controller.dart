import 'package:dinamyc_dashboard/models/goals.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController {
  bool visible = true;
  final List<ChartData> chartData = [
    ChartData('David', 25),
    ChartData('Steve', 38),
    ChartData('Jack', 34),
    ChartData('Others', 52)
  ];
  List<Map<String, dynamic>> dashboard = [
    {"estatus": true, "descripcion": "Metas"},
    {"estatus": true, "descripcion": "Ventas"},
    {"estatus": true, "descripcion": "Facturación"},
    {"estatus": true, "descripcion": "Indicadores"},
  ];
  List<GoalModal> myList = [];

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  void updateVisible(GoalModal item) {
    item.estatus = !item.estatus;
    update();
  }

  void updateData() {
    update();
  }

  void getData() {
    for (var item in dashboard) {
      myList.add(GoalModal.fromJson(item));
    }
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}
