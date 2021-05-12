import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/screen/util/utils.dart';

/// SearchResultItem - widget вывод результатов поиска
class SearchResultItem extends StatelessWidget {
  final Sight sight;
  final Function onTap;

  const SearchResultItem({
    Key key,
    @required this.sight,
    @required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color _primaryColor = Theme.of(context).primaryColor;
    return ListTile(
      title: Text(
        sight.name,
        style: Theme.of(context)
            .textTheme
            .subtitle2
            .copyWith(color: _primaryColor),
      ),
      subtitle: Text(
        sight.type.title,
        style: Theme.of(context).textTheme.bodyText2,
      ),
      onTap: onTap,
      leading: Container(
        width: 56.0,
        height: 56.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              12.0,
            ),
          ),
          image: DecorationImage(
            image: Image.network(
              sight.url,
              loadingBuilder: buildImageProgressIndicator,
            ).image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
