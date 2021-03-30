import 'package:flutter/material.dart';
import 'package:places/ui/constants.dart';
import 'package:places/ui/screen/res/themes.dart';

class AddSightScreen extends StatefulWidget {
  @override
  _AddSightScreenState createState() => _AddSightScreenState();
}

class _AddSightScreenState extends State<AddSightScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController latController = TextEditingController();
    final TextEditingController lonController = TextEditingController();
    final FocusNode nameFocusNode = FocusNode();
    final FocusNode descriptionFocusNode = FocusNode();
    final FocusNode latFocusNode = FocusNode();
    final FocusNode lonFocusNode = FocusNode();

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
              SelectAddCategories(),
              _addField(
                context: context,
                controller: nameController,
                currentFocus: nameFocusNode,
                nextFocus: latFocusNode,
                hint: AppTexts.name,
                lastField: false,
                multipleLines: false,
                title: AppTexts.name,
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
                onPressed: () {},
                child: Text(AppTexts.create.toUpperCase(),
                    style: Theme.of(context).textTheme.caption),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectAddCategories extends StatefulWidget {
  @override
  _SelectAddCategoriesState createState() => _SelectAddCategoriesState();
}

class _SelectAddCategoriesState extends State<SelectAddCategories> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            AppTexts.category.toUpperCase(),
          ),
        ),
        TextField(
          readOnly: true,
          autofocus: true,
          onTap: () {
            print('tap select category');
          },
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.arrow_forward_ios_rounded),
            hintText: AppTexts.noSelected,
            hintStyle: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: AppColorsLight.secondary2),
          ),
        ),
      ],
    );
  }
}

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
        keyboardType: numericField ? TextInputType.number : null,
        textInputAction: TextInputAction.go,
        onEditingComplete: () {
          lastField
              ? FocusScope.of(context).unfocus()
              : FocusScope.of(context).requestFocus(nextFocus);
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          hintText: hint,
          hintStyle: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: AppColorsLight.secondary2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppColorsDark.inactiveBlack
                  : AppColorsLight.inactiveBlack,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppColorsDark.borderGreen
                  : AppColorsLight.borderGreen,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppColorsDark.borderGreen
                  : AppColorsLight.borderGreen,
            ),
          ),
        ),
      ),
    ],
  );
}
