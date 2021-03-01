import 'package:flutter/material.dart';
import 'package:places/domain/search_radius.dart';
import 'package:places/ui/constants.dart';
import 'package:sprintf/sprintf.dart';

/// DistanceSlider - слайдер для отображения расстояния до обьектов
class DistanceSlider extends StatefulWidget {
  DistanceSlider({Key key}) : super(key: key);
  @override
  DistanceSliderState createState() => DistanceSliderState();
}

class DistanceSliderState extends State<DistanceSlider> {
  RangeValues _currentRangeValues = const RangeValues(4000, 8000);

  SearchRadius searchRadius;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 56,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppTexts.sliderTitle,
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.start,
              ),
              Text(
                sprintf(AppTexts.sliderRadius, [
                  _currentRangeValues.start.round().toString(),
                  _currentRangeValues.end.round().toString(),
                ]),
                style: Theme.of(context).textTheme.headline6.copyWith(
                      color: AppColorsDark.secondary2,
                    ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8.0),
        RangeSlider(
          values: _currentRangeValues,
          min: 100,
          max: 10000,
          divisions: 1000,
          labels: RangeLabels(
            _currentRangeValues.start.round().toString(),
            _currentRangeValues.end.round().toString(),
          ),
          onChanged: (RangeValues values) {
            setState(() {
              _currentRangeValues = values;
              searchRadius = SearchRadius(
                startValue: _currentRangeValues.start.round(),
                endValue: _currentRangeValues.end.round(),
              );
            });
          },
        ),
      ],
    );
  }
}
