import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SalesTrendsChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dummy data for the chart
    final List<SalesData> salesData = [
      SalesData('Jan', 35),
      SalesData('Feb', 28),
      SalesData('Mar', 34),
      SalesData('Apr', 32),
      SalesData('May', 40),
    ];

    return SfCartesianChart(
      title: ChartTitle(text: 'Monthly Sales Data'),
      primaryXAxis: CategoryAxis(),
      primaryYAxis: NumericAxis(
        labelFormat: '{value}',
        title: AxisTitle(text: 'Sales (in Units)'),
      ),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <CartesianSeries>[
        LineSeries<SalesData, String>(
          dataSource: salesData,
          xValueMapper: (SalesData data, _) => data.month,
          yValueMapper: (SalesData data, _) => data.sales,
          name: 'Sales',
          dataLabelSettings: DataLabelSettings(isVisible: true),
        ),
      ],
    );
  }
}

// Model class for sales data
class SalesData {
  SalesData(this.month, this.sales);
  final String month;
  final double sales;
}
