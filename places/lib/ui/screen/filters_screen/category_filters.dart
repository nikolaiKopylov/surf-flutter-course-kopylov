import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/filter.dart';
import 'package:places/ui/constants.dart';
import 'package:places/ui/screen/res/themes.dart';

import '../../../mocks.dart';

/// CategoryFilters - фильтры по категориям SightCard
class CategoryFilters extends StatelessWidget {
  final Set<Filter> activeFilters;
  final void Function(Filter filter) onPressed;

  const CategoryFilters({Key key, this.activeFilters, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 16,
          ),
          child: Text(
            AppTexts.categories.toUpperCase(),
            style: Theme.of(context).textTheme.headline6.copyWith(
                  fontSize: 12,
                  color: Theme.of(context) == darkTheme
                      ? AppColorsDark.inactiveBlack
                      : AppColorsLight.inactiveBlack,
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: GridView.count(
            crossAxisCount: 3,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            mainAxisSpacing: 12,
            crossAxisSpacing: 20,
            children: filterList
                .map(
                  (item) => SelectFilter(
                    isSelected: activeFilters.contains(item),
                    onPressed: () {
                      onPressed(item);
                    },
                    filter: item,
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

/// SelectFilter - класс хранящий элемент фильтрации
/// хранит в себе сам фильтр (категорию для фильтраии)[filter],
/// метку выбора категории [isSelected],
/// нажатие на фильтр [onPressed]
class SelectFilter extends StatelessWidget {
  final Filter filter;
  final bool isSelected;
  final VoidCallback onPressed;

  const SelectFilter({
    Key key,
    this.filter,
    this.isSelected,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              width: 64,
              height: 64,
              child: FlatButton(
                onPressed: onPressed,
                shape: const CircleBorder(),
                color: isSelected
                    ? AppColorsLight.green.withOpacity(0.16)
                    : Colors.transparent,
                child: SvgPicture.asset(
                  filter.icon,
                  color: AppColorsLight.green,
                ),
              ),
            ),
            if (isSelected)
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  maxRadius: 8,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: SvgPicture.asset(
                    'res/icon/icon_tick_choice.svg',
                    color: Theme.of(context).backgroundColor,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          filter.title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.overline,
        ),
      ],
    );
  }
}
