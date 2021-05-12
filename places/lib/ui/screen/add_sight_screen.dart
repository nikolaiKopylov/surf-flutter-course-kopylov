import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/category.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/constants.dart';
import 'package:places/ui/screen/add_category_screen.dart';

import 'package:places/ui/screen/sight_list_screen.dart';

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

  bool _check = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56,
        elevation: 0,
        leadingWidth: 74,
        leading: TextButton(
          onPressed: () async {
            _clearData();
            await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SightListScreen(),
            ));
            print('press button cancel');
          },
          child: Text(
            AppTexts.cancel,
            style: Theme.of(context).textTheme.subtitle2.copyWith(
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColorsDark.secondary2
                    : AppColorsLight.secondary2),
          ),
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
              AddField(
                // context: context,
                controller: nameController,
                currentFocus: nameFocusNode,
                nextFocus: latFocusNode,
                hint: AppTexts.name,
                lastField: false,
                multipleLines: false,
                title: AppTexts.name,
                nameField: 'name',
                onSubmitted: (_) => checkAddValues(),
              ),
              Row(
                children: [
                  Expanded(
                    child: AddField(
                      controller: latController,
                      currentFocus: latFocusNode,
                      nextFocus: lonFocusNode,
                      hint: AppTexts.latitude,
                      lastField: false,
                      multipleLines: false,
                      title: AppTexts.latitude,
                      numericField: true,
                      nameField: 'lat',
                      onSubmitted: (_) => checkAddValues(),
                    ),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Expanded(
                    child: AddField(
                      controller: lonController,
                      currentFocus: lonFocusNode,
                      nextFocus: descriptionFocusNode,
                      hint: AppTexts.longitude,
                      lastField: false,
                      multipleLines: false,
                      title: AppTexts.longitude,
                      numericField: true,
                      nameField: 'lon',
                      onSubmitted: (_) => checkAddValues(),
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
              AddField(
                controller: descriptionController,
                currentFocus: descriptionFocusNode,
                hint: AppTexts.hintText,
                lastField: true,
                multipleLines: true,
                title: AppTexts.description,
                nameField: 'details',
                onSubmitted: (_) => checkAddValues(),
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

  // checkAddValues проверяет все ли поля заполнены
  checkAddValues() {
    _check = false;
    if (nameController.text != '' &&
        latController.text != '' &&
        lonController.text != '' &&
        descriptionController.text != '' &&
        categoryController.text != '') {
      _check = true;
    }
    setState(() {});
  }

  /// addNewSight добавляет новое место [Sight] в массив моковых даных[mocks]
  void addNewSight() {
    if (_check) {
      Iterable<Category> _type = filterList
          .where((element) => element.name == categoryController.text);
      var newSight = Sight(
        name: nameController.text,
        lat: double.parse(latController.text),
        lon: double.parse(lonController.text),
        url:
            'https://34travel.me/media/upload/images/2020/MAY/marshrut-luban/IMG_7526.jpg',
        details: descriptionController.text,
        type: _type.first,
      );

      mocks.add(newSight);
      print(mocks);

      _clearData();

      setState(() {});
    }
  }

  void _clearData() {
    categoryController.clear();
    nameController.clear();
    descriptionController.clear();
    latController.clear();
    lonController.clear();

    _check = false;
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
          padding: EdgeInsets.only(bottom: 12),
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
              suffixIcon: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColorsDark.inactiveBlack
                    : AppColorsLight.inactiveBlack,
              ),
              hintText: AppTexts.noSelected,
              hintStyle: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: AppColorsLight.secondary2),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColorsDark.inactiveBlack
                        : AppColorsLight.inactiveBlack),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    width: 2,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColorsDark.inactiveBlack
                        : AppColorsLight.inactiveBlack),
              ),
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
      checkAddValues();
    });
  }
}

/// AddField - виджет создания  TextField для ввода данных нового места
///  кроме выбора категории(описано отдельным виджетом)
class AddField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode currentFocus;
  final FocusNode nextFocus;
  final String hint;
  final bool multipleLines;
  final bool lastField;
  final String title;
  final bool numericField;
  final String nameField;
  final Function onSubmitted;

  const AddField({
    Key key,
    @required this.controller,
    @required this.currentFocus,
    this.nextFocus,
    @required this.hint,
    @required this.multipleLines,
    this.lastField = false,
    @required this.title,
    this.numericField = false,
    this.nameField,
    this.onSubmitted,
  })  : assert(controller != null),
        assert(currentFocus != null),
        assert(hint != null),
        assert(multipleLines != null),
        assert(title != null),
        super(key: key);

  @override
  _AddFieldState createState() => _AddFieldState();
}

class _AddFieldState extends State<AddField> {
  bool _isVisible;

  @override
  void initState() {
    super.initState();

    _updateClearVisibile();
    widget.currentFocus.addListener(_updateClearVisibile);
  }

  @override
  void dispose() {
    widget.currentFocus.removeListener(_updateClearVisibile);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 24.0,
            bottom: 12,
          ),
          child: Text(widget.title.toUpperCase()),
        ),
        TextField(
          minLines: widget.multipleLines ? 2 : null,
          maxLines: widget.multipleLines ? 2 : null,
          controller: widget.controller,
          focusNode: widget.currentFocus,
          autofocus: true,
          keyboardType: widget.numericField ? TextInputType.number : null,
          textInputAction: TextInputAction.go,
          onEditingComplete: () {
            widget.lastField
                ? FocusScope.of(context).unfocus()
                : FocusScope.of(context).requestFocus(widget.nextFocus);
          },
          onChanged: (value) {
            _updateClearVisibile();
          },
          onSubmitted: widget.onSubmitted,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              left: 16.0,
              top: 10.0,
              bottom: 10.0,
            ),
            hintText: widget.hint,
            hintStyle: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: AppColorsLight.secondary2),
            suffixIcon: _isVisible
                ? InkWell(
                    onTap: widget.controller.value.text != ''
                        ? () {
                            widget.controller.clear();

                            print('press close');
                          }
                        : null,
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
                  )
                : null,
            suffixIconConstraints: BoxConstraints(),
            isCollapsed: true,
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

  void _updateClearVisibile() {
    setState(() {
      _isVisible =
          widget.controller.text != '' && widget.currentFocus.hasPrimaryFocus;
    });
  }
}
