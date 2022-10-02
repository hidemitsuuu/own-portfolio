import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:own_portfolio/gen/assets.gen.dart';

class TechnologysStacksView extends StatefulWidget {
  const TechnologysStacksView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TechnologyStacksViewState();
}

class TechnologyStacksViewState extends State {
  int touchedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: AspectRatio(
        aspectRatio: 1,
        child: PieChart(
          PieChartData(
              pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                setState(() {
                  if (!event.isInterestedForInteractions ||
                      pieTouchResponse == null ||
                      pieTouchResponse.touchedSection == null) {
                    touchedIndex = -1;
                    return;
                  }
                  touchedIndex =
                      pieTouchResponse.touchedSection!.touchedSectionIndex;
                });
              }),
              borderData: FlBorderData(
                show: false,
              ),
              sectionsSpace: 0,
              centerSpaceRadius: 0,
              sections: _showingSections()),
        ),
      ),
    );
  }

  List<PieChartSectionData> _showingSections() {
    List<PieChartSectionData> widgets = [];

    _dummyDataList.asMap().forEach((index, data) {
      final isTouched = index == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 110.0 : 100.0;
      final widgetSize = isTouched ? 55.0 : 40.0;

      widgets.add(PieChartSectionData(
        color: data.color,
        value: data.value,
        title: '${data.value}%',
        radius: radius,
        titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: const Color(0xffffffff)),
        badgeWidget: _Badge(
          data.icon,
          size: widgetSize,
          borderColor: const Color(0xff0293ee),
        ),
        badgePositionPercentageOffset: .98,
      ));
    });

    return widgets;
  }
}

class _Badge extends StatelessWidget {
  final AssetGenImage icon;
  final double size;
  final Color borderColor;

  const _Badge(
    this.icon, {
    Key? key,
    required this.size,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .15),
      child: Center(
        child: icon.image(),
      ),
    );
  }
}

final _dummyDataList = [
  _DummyData(
      color: const Color(0xff0293ee), value: 40, icon: Assets.images.flutter),
  _DummyData(
      color: const Color(0xfff8b250), value: 30, icon: Assets.images.react),
  _DummyData(
      color: const Color(0xff845bef), value: 15, icon: Assets.images.swift),
  _DummyData(
      color: const Color(0xff13d38e), value: 15, icon: Assets.images.kotlin),
];

class _DummyData {
  _DummyData({
    required this.color,
    required this.value,
    required this.icon,
  });
  Color color;
  double value;
  AssetGenImage icon;
}
