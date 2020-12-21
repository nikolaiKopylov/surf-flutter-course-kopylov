import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/constants.dart';

/// Bottom экрана SightDetail
/// с заглушками копок :
///     "проложить маршрут" ,
///     "запланировать",
///     "в избранное"

class SightDetailBottom extends StatelessWidget {
  final Sight sight;

  const SightDetailBottom({
    Key key,
    @required this.sight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 24,
            bottom: 24,
          ),
          width: 328,
          height: 48,
          color: AppColors.green,
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 24,
            left: 16,
            right: 16,
          ),
          child: Divider(
            color: AppColors.greyDriver,
            height: 0,
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            top: 12,
          ),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 164,
                height: 40,
                color: Colors.blueAccent,
              ),
              Container(
                width: 164,
                height: 40,
                color: Colors.blueAccent,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
