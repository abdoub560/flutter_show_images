import 'package:flutter/material.dart';
import 'package:flutter_show_images/enums/image_type.dart';

class ImageWithLabel extends StatelessWidget {
  final String text;
  final ImageType imageType;
  final String url;

  ImageWithLabel(this.text, this.imageType, this.url);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            child: Text(
              text,
              style: TextStyle(fontSize: 20, color: Colors.deepOrange),
            ),
          ),
          SizedBox(height: 4,),
          Expanded(
            flex: 1,
            child: (() {
              switch(imageType){

                case ImageType.LOCAL:
                  return Image.asset(url);
                case ImageType.NETWORK:
                  return Center(child: Image.network(url));
              }
            }()),
          )
        ],
      ),
    );
  }
}
