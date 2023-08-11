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
  List<CategoriesData> _chatData = [];
  late TooltipBehavior _tooltipBehavior;

  getChartData() {
    List transactions = widget.user.transactions!;
    double totalAmount = widget.user.expense!;
    List<CategoriesData> chartData = [];

    // double totalAmountPerCategory = 0.0;
    // for (int i = 0; i < transactions.length; i++) {
    //   if (transactions[i].type == "expense") {}
    // }

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

    Map<String, double> categoryPercentage = {
      "Alimentação": 0.0,
      "Transporte": 0.0,
      "Contas": 0.0,
      "Saúde": 0.0,
      "Lazer": 0.0,
      "Compras": 0.0,
    };
    categoryTotal.forEach((category, total) {
      double percentage = (total / totalAmount) * 100;
      String percentageInString = percentage.toStringAsFixed(2);
      double categoryPercentage = double.parse(percentageInString);

      _chatData.add(CategoriesData(
          category: category, categoryPercentage: categoryPercentage));
    });

    print("Category total: $categoryTotal");
    return _chatData;
  }

  @override
  void initState() {
    getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.3,
      width: size.width * 0.8,
      child: SfCircularChart(
        title: ChartTitle(
          text: "Porcentagem de despesas por categoria",
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        legend: Legend(
          isVisible: true,
          overflowMode: LegendItemOverflowMode.wrap,
          textStyle: TextStyle(color: Colors.white),
        ),
        tooltipBehavior: _tooltipBehavior,
        series: <CircularSeries>[
          PieSeries<CategoriesData, String>(
            dataSource: _chatData,
            xValueMapper: (CategoriesData data, _) => data.category,
            yValueMapper: (CategoriesData data, _) => data.categoryPercentage,
            dataLabelSettings: DataLabelSettings(
              isVisible: true,
              showZeroValue: false,
              // color: Colors.white
              textStyle: TextStyle(color: Colors.white),
            ),
            enableTooltip: true,
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
