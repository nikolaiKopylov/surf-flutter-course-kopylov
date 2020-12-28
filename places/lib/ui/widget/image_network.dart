import 'package:flutter/material.dart';
import 'package:places/ui/screen/util/utils.dart';

class ImageNetwork extends StatelessWidget {
  final imageUrl;

  const ImageNetwork({
    Key key,
    @required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      loadingBuilder: buildImageProgressIndicator,
    );
  }
}
