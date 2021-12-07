// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dinamyc_dashboard/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Indicadores'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (home) {
            return SafeArea(
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Wrap(
                          children: [
                            for (var item in home.myList)
                              if (item.estatus)
                                CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () async {
                                    await modalOption(context, home);
                                    home.updateData();
                                  },
                                  child: Container(
                                      margin: EdgeInsets.only(
                                          right: 10, bottom: 10),
                                      height: 200,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child: SfCircularChart(
                                          onPointTapped: null,
                                          onLegendTapped: null,
                                          onDataLabelTapped: null,
                                          title: ChartTitle(
                                              text: item.descripcion),
                                          series: <CircularSeries>[
                                            // Render pie chart
                                            PieSeries<ChartData, String>(
                                                dataSource: [
                                                  // Bind data source
                                                  ChartData('Jan', 35),
                                                  ChartData('Feb', 28),
                                                  ChartData('Mar', 34),
                                                ],
                                                xValueMapper:
                                                    (ChartData data, _) =>
                                                        data.x,
                                                yValueMapper:
                                                    (ChartData data, _) =>
                                                        data.y,
                                                dataLabelSettings:
                                                    DataLabelSettings(
                                                        isVisible: true)),
                                          ])),
                                ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  Future<dynamic> modalOption(BuildContext context, HomeController home) {
    return showCupertinoDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            width: 300,
            height: 400,
            child: Column(
              children: [
                Flexible(
                  child: ListView.builder(
                      itemCount: home.myList.length,
                      itemBuilder: (context, index) {
                        return GetBuilder<HomeController>(builder: (_) {
                          return ListTile(
                            leading: Checkbox(
                                value: home.myList[index].estatus,
                                onChanged: (value) {
                                  home.updateVisible(home.myList[index]);
                                }),
                            title: Text(home.myList[index].descripcion),
                          );
                        });
                      }),
                ),
                IconButton(
                    onPressed: () {
                      Get.back(result: true);
                    },
                    icon: Icon(Icons.arrow_back))
              ],
            ),
          ),
        );
      },
    );
  }
}

class Option extends StatelessWidget {
  const Option({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.amber,
      ),
    );
  }
}
