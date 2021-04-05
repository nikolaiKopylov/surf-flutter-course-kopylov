import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/constants.dart';
import 'package:places/ui/screen/add_category_screen.dart';
import 'package:places/ui/screen/res/themes.dart';

/// AddSightScreen - экран создания нового места [Sight]
/// и добавлния его в массив моковых даных[mocks]
class AddSightScreen extends StatefulWidget {
  @override
  _AddSightScreenState createState() => _AddSightScreenState();
}

class _AddSightScreenState extends State<AddSightScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController latController = TextEditingController();
  final TextEditingController lonController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  final FocusNode nameFocusNode = FocusNode();
  final FocusNode descriptionFocusNode = FocusNode();
  final FocusNode latFocusNode = FocusNode();
  final FocusNode lonFocusNode = FocusNode();
  final FocusNode categoryFocusNode = FocusNode();

  Map _valuesAdd = {};
  bool _check = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56,
        elevation: 0,
        leadingWidth: 74,
        leading: TextButton(
          onPressed: () {
            print('press button cancel');
          },
          child: Text(AppTexts.cancel),
        ),
        title: Text(
          AppTexts.newPlace,
          style: Theme.of(context).textTheme.headline2,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 24.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _selectAddCategories(
                context: context,
                controller: categoryController,
                currentFocus: categoryFocusNode,
                nextFocus: nameFocusNode,
              ),
              _addField(
                context: context,
                controller: nameController,
                currentFocus: nameFocusNode,
                nextFocus: latFocusNode,
                hint: AppTexts.name,
                lastField: false,
                multipleLines: false,
                title: AppTexts.name,
                nameField: 'name',
              ),
              Row(
                children: [
                  Expanded(
                    child: _addField(
                      context: context,
                      controller: latController,
                      currentFocus: latFocusNode,
                      nextFocus: lonFocusNode,
                      hint: AppTexts.latitude,
                      lastField: false,
                      multipleLines: false,
                      title: AppTexts.latitude,
                      numericField: true,
                      nameField: 'lat',
                    ),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Expanded(
                    child: _addField(
                      context: context,
                      controller: lonController,
                      currentFocus: lonFocusNode,
                      nextFocus: descriptionFocusNode,
                      hint: AppTexts.longitude,
                      lastField: false,
                      multipleLines: false,
                      title: AppTexts.longitude,
                      numericField: true,
                      nameField: 'lon',
                    ),
                  ),
                ],
              ),
              TextButton(
                child: Text(AppTexts.pointMap),
                onPressed: () {
                  print('Press point map button');
                },
              ),
              _addField(
                context: context,
                controller: descriptionController,
                currentFocus: descriptionFocusNode,
                hint: AppTexts.hintText,
                lastField: true,
                multipleLines: true,
                title: AppTexts.descriotion,
                nameField: 'details',
              ),
              SizedBox(
                height: 116,
              ),
              FlatButton(
                height: 48,
                minWidth: double.infinity,
                color: Theme.of(context).buttonColor,
                disabledColor: Theme.of(context).disabledColor,
                disabledTextColor:
                    Theme.of(context).brightness == Brightness.dark
                        ? AppColorsDark.inactiveBlack
                        : AppColorsLight.inactiveBlack,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                onPressed: _check
                    ? () {
                        print(_valuesAdd);
                        addNewSight();
                      }
                    : null,
                child: Text(AppTexts.create.toUpperCase(),
                    style: Theme.of(context).textTheme.caption),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// _addField - виджет создания  TextField для ввода данных нового места
  ///  кроме выбора категории(описано отдельным виджетом)
  Widget _addField({
    TextEditingController controller,
    FocusNode currentFocus,
    FocusNode nextFocus,
    String hint,
    bool multipleLines,
    bool lastField = false,
    BuildContext context,
    String title,
    bool numericField = false,
    String nameField,
  }) {
    assert(controller != null);
    assert(currentFocus != null);
    assert(hint != null);
    assert(multipleLines != null);
    assert(context != null);
    assert(title != null);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 24.0,
            bottom: 12,
          ),
          child: Text(title.toUpperCase()),
        ),
        TextField(
          minLines: multipleLines ? 2 : null,
          maxLines: multipleLines ? 2 : null,
          controller: controller,
          focusNode: currentFocus,
          autofocus: true,
          keyboardType: numericField ? TextInputType.number : null,
          textInputAction: TextInputAction.go,
          onChanged: (value) {
            _valuesAdd[nameField] = value;
            checkAddValues();
            print(_valuesAdd);
          },
          onEditingComplete: () {
            lastField
                ? FocusScope.of(context).unfocus()
                : FocusScope.of(context).requestFocus(nextFocus);
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              left: 16.0,
              right: 10.0,
            ),
            hintText: hint,
            hintStyle: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: AppColorsLight.secondary2),
            suffix: Container(
              //padding: EdgeInsets.all(10),
              height: 20.0,
              width: 20.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: IconButton(
                padding: EdgeInsets.all(2),
                icon: SvgPicture.asset(
                  AppIcons.iconClose,
                  color: Colors.white,
                ),
                onPressed: () {
                  controller.clear();
                  _valuesAdd[nameField] = '';
                  print('press close');
                },
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColorsDark.borderGreen
                    : AppColorsLight.borderGreen,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColorsDark.borderGreen
                    : AppColorsLight.borderGreen,
                width: 2,
              ),
            ),
          ),
          style: Theme.of(context).textTheme.headline5.copyWith(fontSize: 16),
        ),
      ],
    );
  }

  // checkAddValues проверяет все ли поля заполнены
  void checkAddValues() {
    _check = false;
    if (_valuesAdd['name'] != '' &&
        _valuesAdd['lat'] != '' &&
        _valuesAdd['lon'] != '' &&
        _valuesAdd['details'] != '' &&
        _valuesAdd['type'] != '') {
      _check = true;
    }
    setState(() {});
  }

  /// addNewSight добавляет новое место [Sight] в массив моковых даных[mocks]
  void addNewSight() {
    if (_check) {
      var newSight = Sight(
        name: _valuesAdd['name'],
        lat: double.parse(_valuesAdd['lat'].toString()),
        lon: double.parse(_valuesAdd['lon'].toString()),
        url: 'url',
        details: _valuesAdd['details'],
        type: _valuesAdd['type'],
      );

      mocks.add(newSight);
      print(mocks);

      categoryController.clear();
      nameController.clear();
      descriptionController.clear();
      latController.clear();
      lonController.clear();

      _valuesAdd.clear();

      _check = false;

      setState(() {});
    }
  }

  /// SelectAddCategories - открывает screen AddCategory
  /// для выбора категории нового места

  Widget _selectAddCategories({
    TextEditingController controller,
    FocusNode currentFocus,
    FocusNode nextFocus,
    BuildContext context,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            AppTexts.category.toUpperCase(),
          ),
        ),
        SizedBox(
          height: 40,
          child: TextField(
            controller: controller,
            focusNode: currentFocus,
            readOnly: true,
            autofocus: true,
            onTap: () {
              print('tap select category');
              _awaitCategory(context, controller);
              FocusScope.of(context).requestFocus(nextFocus);
            },
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.arrow_forward_ios_rounded),
              hintText: AppTexts.noSelected,
              hintStyle: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: AppColorsLight.secondary2),
            ),
            style: Theme.of(context).textTheme.headline5.copyWith(fontSize: 16),
          ),
        ),
      ],
    );
  }

  void _awaitCategory(
      BuildContext context, TextEditingController controller) async {
    final result = await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => AddCategoryScreen(),
    ));

    setState(() {
      controller.text = result;
      _valuesAdd['type'] = controller.text;
      checkAddValues();
    });
  }
}
