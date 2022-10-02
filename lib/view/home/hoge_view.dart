import 'package:flutter/material.dart';
import 'package:own_portfolio/view/home/sub/growth_curve_view.dart';
import 'package:own_portfolio/view/home/sub/objective.dart';
import 'package:own_portfolio/view/home/sub/profile_view.dart';
import 'package:own_portfolio/view/home/sub/technology_stacks_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Row(
            children: const [
              Expanded(
                flex: 3,
                // 自己紹介エリア
                child: ProfileView(),
              ),
              Expanded(
                flex: 2,
                // 技術スタックの円グラフ
                child: TechnologysStacksView(),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: const [
              Expanded(
                flex: 1,
                child: GrowthCurveView(),
              ),
              Expanded(
                flex: 1,
                child: ObjectiveView(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
