import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/add_sight_screen.dart';

import '../constants.dart';

/// AddCategoryScreen экран выбора категории нового места
class AddCategoryScreen extends StatefulWidget {
  @override
  _AddCategoryScreenState createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56,
        elevation: 0,
        leadingWidth: 74,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined),
          onPressed: () async {
            await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddSightScreen(),
            ));
            print('press button cancel');
          },
        ),
        title: Text(
          AppTexts.category,
          style: Theme.of(context).textTheme.headline2,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            child: ListView.builder(
              itemCount: filterList.length,
              itemBuilder: _createListView,
            ),
          ),
          FlatButton(
            height: 48,
            minWidth: double.infinity,
            color: Theme.of(context).buttonColor,
            disabledColor: Theme.of(context).disabledColor,
            disabledTextColor: Theme.of(context).brightness == Brightness.dark
                ? AppColorsDark.inactiveBlack
                : AppColorsLight.inactiveBlack,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            onPressed: selectedIndex != -1
                ? () {
                    print(filterList[selectedIndex].title);
                    _sendCategory(context);
                  }
                : null,
            child: Text(AppTexts.create.toUpperCase(),
                style: Theme.of(context).textTheme.caption),
          ),
        ]),
      ),
    );
  }

  Widget _createListView(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // устанавливаем индекс выделенного элемента
          selectedIndex = index;
        });
      },
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 48,
                  child: Text(filterList[index].title,
                      style: TextStyle(fontSize: 24)),
                ),
              ),
              if (index == selectedIndex)
                SvgPicture.asset(
                  AppIcons.iconTick,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColorsDark.green
                      : AppColorsLight.green,
                )
            ],
          ),
          Divider(
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColorsDark.inactiveBlack
                : AppColorsLight.inactiveBlack,
          )
        ],
      ),
    );
  }

  void _sendCategory(BuildContext context) {
    String category = filterList[selectedIndex].title;
    Navigator.pop(context, category);
  }
}
