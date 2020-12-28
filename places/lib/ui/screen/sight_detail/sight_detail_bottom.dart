import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/constants.dart';
import 'package:places/ui/screen/sight_detail/sight_detail_widget.dart';

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
        SightDetailButtonGo(sight: sight),
        Padding(
          padding: EdgeInsets.only(
            top: 24.0,
            left: 16.0,
            right: 16.0,
          ),
          child: Divider(
            color: AppColors.greyDriver,
            height: 0.0,
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            top: 12.0,
          ),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SightDetailButtonCalendar(sight: sight),
              SightDetailButtonToFavorites(sight: sight),
            ],
          ),
        ),
      ],
    );
  }
}
