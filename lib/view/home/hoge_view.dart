import 'package:flutter/material.dart';
import 'package:own_portfolio/view/home/sub/pie_chart_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _card(context),
        const PieChartView(),
      ],
    );
  }

  Widget _card(BuildContext context) {
    return const Card(
      color: Colors.red,
      child: Center(
        child: Text('### DUMMTY CARD ###'),
      ),
    );
  }
}
