import 'package:flutter/material.dart';
import 'package:places/ui/constants.dart';

class AddSightScreen extends StatefulWidget {
  @override
  _AddSightScreenState createState() => _AddSightScreenState();
}

class _AddSightScreenState extends State<AddSightScreen> {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectAddCategories(),
            AddNameSight(),
            Row(
              children: [
                Expanded(
                  child: AddPointLat(),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: AddPointLon(),
                ),
              ],
            ),
            SizedBox(height: 15.0),
            TextButton(
                onPressed: () {
                  print('press point map button');
                },
                child: Text(
                  AppTexts.pointMap,
                  style: Theme.of(context).textTheme.subtitle2.copyWith(
                        color: Theme.of(context).buttonColor,
                      ),
                ))
          ],
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

class AddNameSight extends StatefulWidget {
  @override
  _AddNameSightState createState() => _AddNameSightState();
}

class _AddNameSightState extends State<AddNameSight> {
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
          child: Text(
            AppTexts.name.toUpperCase(),
          ),
        ),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AddPointLat extends StatefulWidget {
  @override
  _AddPointLatState createState() => _AddPointLatState();
}

class _AddPointLatState extends State<AddPointLat> {
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
          child: Text(AppTexts.latitude.toUpperCase()),
        ),
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AddPointLon extends StatefulWidget {
  @override
  _AddPointLonState createState() => _AddPointLonState();
}

class _AddPointLonState extends State<AddPointLon> {
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
          child: Text(AppTexts.longitude.toUpperCase()),
        ),
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AddDescription extends StatefulWidget {
  @override
  _AddDescriptionState createState() => _AddDescriptionState();
}

class _AddDescriptionState extends State<AddDescription> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 37.0,
            bottom: 12,
          ),
          child: Text(AppTexts.longitude.toUpperCase()),
        ),
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
