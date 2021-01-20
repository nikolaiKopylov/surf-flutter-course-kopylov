import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/constants.dart';
import 'sight_detail/sight_detail_widget.dart';

/// Экран детализации интересного места , отображает подробную
/// информацию из картотеки
class SightDetail extends StatelessWidget {
  final Sight sight;

  const SightDetail({
    Key key,
    @required this.sight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          SightDetailHeader(
            sight: sight,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 24,
              right: 16,
              left: 16,
              bottom: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SightDetailTitle(
                  sight: sight,
                ),
                SightDetailText(
                  sight: sight,
                ),
              ],
            ),
          ),
          SightDetailBottom(
            sight: sight,
          ),
        ],
      ),
    );
  }
}
