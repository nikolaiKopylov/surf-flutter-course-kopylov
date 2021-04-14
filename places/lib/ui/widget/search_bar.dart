import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/ui/constants.dart';
import 'package:places/ui/screen/filters_screen.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        readOnly: true,
        decoration: InputDecoration(
          hintText: AppTexts.search,
          hintStyle:
              Theme.of(context).textTheme.headline4.copyWith(fontSize: 16.0),
          prefixIcon: SvgPicture.asset(AppIcons.iconSearch),
          prefixIconConstraints: BoxConstraints(),
          suffixIcon: InkWell(
            onTap: () async {
              print('press filters in searh');

              await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => FiltersScreen(),
              ));
            },
            child: Material(
              type: MaterialType.transparency,
              child: Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: SvgPicture.asset(
                  AppIcons.iconFilter,
                  color: Theme.of(context).buttonColor,
                ),
              ),
            ),
          ),
          suffixIconConstraints: BoxConstraints(),
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          fillColor: Theme.of(context).backgroundColor,
        ),
        onTap: () => print('Press search'),
      ),
    );
  }
}
