import 'package:finance_app/layers/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CategoriesPieChart extends StatefulWidget {
  final UserEntity user;
  const CategoriesPieChart({Key? key, required this.user}) : super(key: key);

  @override
  _CategoriesPieChartState createState() => _CategoriesPieChartState();
}

class _CategoriesPieChartState extends State<CategoriesPieChart> {
  late List<CategoriesData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  getChartData() {
    List transactions = widget.user.transactions!;
    double totalAmount = widget.user.expense!;
    List<CategoriesData> chartData = [];
    // List<CategoriesData> chartData = [
    //   CategoriesData(category: "Alimentação", categoryPercentage: 41.1),
    //   CategoriesData(category: "Transporte", categoryPercentage: 13.7),
    //   CategoriesData(category: "Lazer", categoryPercentage: 16.44),
    //   CategoriesData(category: "Contas", categoryPercentage: 2.74),
    //   CategoriesData(category: "Sáude", categoryPercentage: 26.02),
    // ];

    Map<String, double> categoryTotal = {
      "Alimentação": 0.0,
      "Transporte": 0.0,
      "Contas": 0.0,
      "Saúde": 0.0,
      "Lazer": 0.0,
      "Compras": 0.0,
    };
    transactions.forEach((transaction) {
      if (categoryTotal.containsKey(transaction.category)) {
        categoryTotal[transaction.category] =
            categoryTotal[transaction.category]! + transaction.value!;
      }
    });

    categoryTotal.forEach((category, total) {
      double percentage = (total / totalAmount) * 100;
      String percentageInString = percentage.toStringAsFixed(2);
      double categoryPercentage = double.parse(percentageInString);

      chartData.add(CategoriesData(
          category: category, categoryPercentage: categoryPercentage));
    });

    return chartData;
  }

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.3,
      width: size.width * 0.8,
      child: SfCircularChart(
        title: ChartTitle(
          text: "Porcentagem de despesas por categoria",
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        legend: const Legend(
          isVisible: true,
          overflowMode: LegendItemOverflowMode.wrap,
          textStyle: TextStyle(color: Colors.white),
        ),
        tooltipBehavior: _tooltipBehavior,
        series: <CircularSeries>[
          DoughnutSeries<CategoriesData, String>(
            dataSource: _chartData,
            xValueMapper: (CategoriesData data, _) => data.category,
            yValueMapper: (CategoriesData data, _) => data.categoryPercentage,
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
              showZeroValue: false,
              // color: Colors.white
              textStyle: TextStyle(color: Colors.white),
            ),
            enableTooltip: true,
            // animationDuration: 0.0,
            animationDelay: 0.0,
          ),
        ],
      ),
    );
  }
}

class CategoriesData {
  final String category;
  final double categoryPercentage;

  CategoriesData({required this.category, required this.categoryPercentage});
}
