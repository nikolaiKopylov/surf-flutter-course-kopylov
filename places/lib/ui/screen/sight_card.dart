import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/styles/text_styles.dart';

class SightCard extends StatelessWidget {
  final Sight sight;

  const SightCard({
    Key key,
    this.sight,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        top: 16,
        right: 16,
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                color: Colors.amber,
                width: double.infinity,
                height: 96,
              ),
              Positioned(
                left: 16,
                top: 16,
                child: Text('музей'),
              ),
              Positioned(
                right: 16,
                top: 16,
                child: Container(
                  color: Colors.red,
                  width: 20,
                  height: 18,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(
              top: 16,
              right: 16,
              left: 16,
            ),
            height: 92,
            width: double.infinity,
            color: Color(0xF5F5F5),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Воронежский областной краеведческий музей',
                    style: AppTextStyles.textStyleSightCardBottomUp,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'краткое описаниe ',
                    style: AppTextStyles.textStyleSightCardBottomDown,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
