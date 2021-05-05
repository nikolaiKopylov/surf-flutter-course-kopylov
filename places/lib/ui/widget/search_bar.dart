import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/domain/filter.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/constants.dart';
import 'package:places/ui/screen/filters_screen.dart';
import 'package:places/ui/screen/sight_search_screen.dart';

/// SearchBar - widget для поиска [Sight]
class SearchBar extends StatelessWidget implements PreferredSizeWidget {
  final bool readOnly;
  final TextEditingController searchController;

  final Function onSubmitted;
  final Function onChange;
  final Function onClear;
  final Filter filter;

  SearchBar({
    Key key,
    this.readOnly = true,
    this.searchController,
    this.onSubmitted,
    this.onClear,
    this.onChange,
    this.filter,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(40);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      margin: EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 6,
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(12.0)),
      child: SizedBox(
        child: Stack(children: [
          TextField(
            readOnly: readOnly,
            controller: searchController,
            onSubmitted: onSubmitted,
            onChanged: onChange,
            decoration: readOnly
                ? InputDecorationReadOnly(context)
                : InputDecorationSearch(context, searchController),
            onTap: readOnly
                ? () async {
                    print('press filters in searh');
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SightSearchScreen(),
                      ),
                    );
                  }
                : null,
          ),
          if (readOnly)
            Positioned(
              right: 12,
              bottom: 8,
              top: 8,
              child: InkWell(
                onTap: () async {
                  print('press filters in searh');

                  await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FiltersScreen(),
                  ));
                },
                child: Material(
                  type: MaterialType.transparency,
                  child: SvgPicture.asset(
                    AppIcons.iconFilter,
                    color: Theme.of(context).buttonColor,
                  ),
                ),
              ),
            )
        ]),
      ),
    );
  }

  /// InputDecoration - для [SearchBar]  на главном экране [SightListScreen]
  InputDecoration InputDecorationReadOnly(BuildContext context) {
    return InputDecoration(
      contentPadding: EdgeInsets.only(bottom: 15),
      hintText: AppTexts.search,
      hintStyle: Theme.of(context).textTheme.headline4.copyWith(fontSize: 16.0),
      prefixIcon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SvgPicture.asset(AppIcons.iconSearch),
      ),
      prefixIconConstraints: BoxConstraints(),
      border: InputBorder.none,
      fillColor: Theme.of(context).backgroundColor,
    );
  }

  /// InputDecoration - для  [SearchBar]  на главном экране [SightSearchScreen]
  InputDecoration InputDecorationSearch(
      BuildContext context, TextEditingController controller) {
    return InputDecoration(
      contentPadding: EdgeInsets.only(bottom: 15),
      hintText: AppTexts.search,
      hintStyle: Theme.of(context).textTheme.headline4.copyWith(fontSize: 16.0),
      prefixIcon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SvgPicture.asset(AppIcons.iconSearch),
      ),
      prefixIconConstraints: BoxConstraints(),
      suffixIcon: InkWell(
        onTap: onClear,
        child: Material(
          type: MaterialType.transparency,
          child: Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: SvgPicture.asset(
              AppIcons.iconClear,
              color: Colors.black,
            ),
          ),
        ),
      ),
      suffixIconConstraints: BoxConstraints(),
      border: InputBorder.none,
      fillColor: Theme.of(context).backgroundColor,
    );
  }
}
