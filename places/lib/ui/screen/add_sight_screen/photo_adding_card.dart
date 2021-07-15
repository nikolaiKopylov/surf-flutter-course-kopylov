import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/constants.dart';
import 'package:places/ui/widget/image_network.dart';

class PhotoAddingCard extends StatefulWidget {
  final bool firstElement;
  final String imageUrl;
  final Function addPhoto;
  final Function delPhoto;
  final int index;

  const PhotoAddingCard({
    Key key,
    this.firstElement = false,
    this.imageUrl,
    this.addPhoto,
    this.delPhoto,
    this.index,
  }) : super(
          key: key,
        );

  @override
  _PhotoAddingCardState createState() => _PhotoAddingCardState();
}

class _PhotoAddingCardState extends State<PhotoAddingCard> {
  @override
  Widget build(BuildContext context) {
    return widget.firstElement
        ? GestureDetector(
            onTap: () {
              widget.addPhoto();
              print(photosList.length);
            },
            child: Container(
              height: 72.0,
              width: 72.0,
              margin: EdgeInsets.only(
                top: 24.0,
                bottom: 24.0,
                right: 16.0,
              ),
              decoration: BoxDecoration(
                // color: Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
              child: SvgPicture.asset(
                AppIcons.iconPlusPhoto,
                //   color: AppColorsDark.green,
              ),
            ),
          )
        : Container(
            margin: EdgeInsets.only(
              top: 24.0,
              bottom: 24.0,
              right: 16.0,
            ),
            child: Stack(alignment: AlignmentDirectional.topEnd, children: [
              Container(
                height: 72,
                width: 72,
                decoration: BoxDecoration(
                  //   color: Colors.red,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                  child: ImageNetwork(
                    imageUrl: widget.imageUrl,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  print('tap delPhoto');
                  widget.delPhoto();
                },
                child: Material(
                  type: MaterialType.transparency,
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: 3,
                      top: 3,
                    ),
                    child: SvgPicture.asset(
                      AppIcons.iconClear,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ]),
          );
  }
}
