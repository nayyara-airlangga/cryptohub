import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../models/cryptos/graph_data.dart';

class PriceChart extends StatefulWidget {
  const PriceChart({
    Key? key,
    required this.historyList,
  }) : super(key: key);

  final List<GraphData> historyList;

  @override
  _PriceChartState createState() => _PriceChartState();
}

class _PriceChartState extends State<PriceChart> {
  late List<GraphData> historyList;

  @override
  void initState() {
    historyList = widget.historyList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      enableAxisAnimation: true,
      title: ChartTitle(
        text: "Price in USD",
      ),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <ChartSeries<GraphData, String>>[
        LineSeries(
          dataSource: historyList,
          xValueMapper: (GraphData data, _) => data.date,
          yValueMapper: (GraphData data, _) => double.parse(data.price),
          name: "Date and Price",
        ),
      ],
    );
  }
}
