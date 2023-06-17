import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AppColors {
  static const Color backgroundcolor = Colors.white;
  static const Color blackcolor = Colors.black;
  static const Color greycolor = Colors.grey;
  static const Color secondarybluecolor = Colors.blue;
  static const Color whitecolor = Colors.white;
}

class MonitoringUsers extends StatelessWidget {
  final String title;
  final String numbers;
  final String days;
  final String changeInfo;

  const MonitoringUsers({
    required this.title,
    required this.numbers,
    required this.days,
    this.changeInfo = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Replace this container with your own implementation
      child: Text('$title - $numbers - $days - $changeInfo'),
    );
  }
}

class WeekData {
  final int weekNumber;
  final int numberOfSignups;

  WeekData(this.weekNumber, this.numberOfSignups);
}

class AnalyticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample data for the area chart
    List<WeekData> data = [
      WeekData(1, 5),
      WeekData(2, 10),
      WeekData(3, 8),
      WeekData(4, 12),
      WeekData(5, 6),
      WeekData(6, 9),
      WeekData(7, 14),
      // WeekData(8, 4),
      // WeekData(9, 13),
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundcolor,
      body: Padding(
        padding: const EdgeInsets.only(left: 40.0, top: 25, right: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Analytics',
              style: TextStyle(
                color: AppColors.blackcolor,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Monitor user signups and activity here',
              style: TextStyle(
                color: AppColors.greycolor,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MonitoringUsers(
                  title: 'User Signups',
                  numbers: '1',
                  days: 'Last 7 Days',
                  changeInfo: 'No change from May 31 - Jun 07',
                ),
                MonitoringUsers(
                  title: 'Total Users',
                  numbers: '56',
                  days: 'As of Today',
                  changeInfo: 'No change from May 31 - Jun 07',
                ),
                MonitoringUsers(
                  title: 'Total Gyms',
                  numbers: '8',
                  days: 'As of Today',
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'User Signups by Week',
              style: TextStyle(
                color: AppColors.blackcolor,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                color: AppColors.whitecolor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 1,
                  ),
                ],
              ),
              child: SfCartesianChart(
                enableAxisAnimation: true,
                primaryXAxis: NumericAxis(
                  title: AxisTitle(text: 'Weeks'),
                  majorGridLines: MajorGridLines(width: 0),
                ),
                primaryYAxis: NumericAxis(
                  majorGridLines: MajorGridLines(width: 0),
                ),
                series: <ChartSeries>[
                  AreaSeries<WeekData, int>(
                    dataSource: data,
                    xValueMapper: (WeekData week, _) => week.weekNumber,
                    yValueMapper: (WeekData week, _) => week.numberOfSignups,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}


