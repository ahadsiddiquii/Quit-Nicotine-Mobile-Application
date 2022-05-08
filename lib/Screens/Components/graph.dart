import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nicotine/Constant.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MyHomeScreen extends StatefulWidget {
  final waterCount;
  final stepsCount;
  final foodCount;
  const MyHomeScreen(
      {Key? key,
      required this.waterCount,
      required this.stepsCount,
      required this.foodCount})
      : super(key: key);

  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  final List<ChartData> chartData = [];
  final List<ChartData> chartData2 = [
    //   ChartData('', 11),
    //   ChartData('', 12),
    //   ChartData('', 8),
  ];
  final List<ChartData> chartData3 = [
    //   ChartData('', 5),
    //   ChartData('', 2),
    //   ChartData('', 1),
  ];
  @override
  void initState() {
    super.initState();
    chartData.add(
      ChartData('', widget.waterCount),
    );
    chartData.add(
      ChartData('', 2),
    );
    chartData.add(
      ChartData('', 4),
    );
    chartData2.add(
      ChartData('', 0),
    );
    chartData.add(
      ChartData('', widget.foodCount),
    );
    chartData2.add(
      ChartData('', 0),
    );
    chartData3.add(
      ChartData('', 0),
    );
    chartData3.add(
      ChartData('', 0),
    );
    chartData.add(
      ChartData('', widget.stepsCount),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      color: kLightColor,
                      height: 25.h,
                      child: SfCartesianChart(
                          plotAreaBorderColor: Colors.white,
                          borderColor: Colors.white,
                          backgroundColor: Colors.white,
                          primaryXAxis: CategoryAxis(
                              // majorGridLines: ,
                              // minorTickLines: null,
                              // Axis will be rendered based on the index values
                              arrangeByIndex: false),
                          series: <ChartSeries<ChartData, String>>[
                            ColumnSeries<ChartData, String>(
                              color: kSignupColor,
                              dataSource: chartData,
                              xValueMapper: (ChartData sales, _) => sales.x,
                              yValueMapper: (ChartData sales, _) => sales.y,
                            ),
                            ColumnSeries<ChartData, String>(
                              color: kSigninColor,
                              dataSource: chartData,
                              xValueMapper: (ChartData sales, _) => sales.x,
                              yValueMapper: (ChartData sales, _) => sales.y,
                            ),
                            ColumnSeries<ChartData, String>(
                              color: Colors.yellow,
                              dataSource: chartData,
                              xValueMapper: (ChartData sales, _) => sales.x,
                              yValueMapper: (ChartData sales, _) => sales.y,
                            )
                          ]),
                    ),
                    Container(
                      // height: 5.h,
                      width: 90.w,
                      color: Colors.white,
                      // color: Colors.black26,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 4.w,
                          ),
                          Container(
                            height: 4.h,
                            width: 8.w,
                            decoration: BoxDecoration(
                                color: kSignupColor,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          Text(
                            "  Water",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Container(
                            height: 4.h,
                            width: 8.w,
                            decoration: BoxDecoration(
                                color: kSigninColor,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          Text(
                            "  Food",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Container(
                            height: 4.h,
                            width: 8.w,
                            decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          Text(
                            "  Walk Steps",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                  ],
                ))));
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;
}
