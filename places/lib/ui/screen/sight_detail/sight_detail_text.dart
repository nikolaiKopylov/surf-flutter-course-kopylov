import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/styles/text_styles.dart';

/// Текст экрана SightDetail

class SightDetailText extends StatelessWidget {
  final Sight sight;

  const SightDetailText({
    Key key,
    @required this.sight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 16,
        bottom: 16,
      ),
      child: Text(
        mocks[0].details,
        style: AppTextStyles.textStyleDetailText,
      ),
    );
  }
}
