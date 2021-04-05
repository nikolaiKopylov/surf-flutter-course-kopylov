import 'package:flutter/material.dart';
import 'package:places/mocks.dart';

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
                    //addNewSight();
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
                  margin: EdgeInsets.symmetric(vertical: 4),
                  padding: EdgeInsets.symmetric(vertical: 8),
                  //color:
                  //      index == selectedIndex ? Colors.black12 : Colors.white60,
                  child: Text(filterList[index].title,
                      style: TextStyle(fontSize: 24)),
                ),
              ),
              if (index == selectedIndex) Icon(Icons.keyboard_arrow_down_sharp)
            ],
          ),
          Divider(
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
