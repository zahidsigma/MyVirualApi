import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:virualapi/constants/constant.dart';

class AvatarWithLoader extends StatelessWidget {
  final String? imageUrl;
  final double radius;
  final String? placeholderImageUrl;
  final File? fileImage;

  const AvatarWithLoader(
      {Key? key,
      this.imageUrl,
      this.radius = 30.0,
      this.placeholderImageUrl,
      this.fileImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(this.imageUrl);
    return CircleAvatar(
      radius: radius,
      backgroundColor: COLOR_BG_LIGHT,
      child: ClipOval(
        child: fileImage != null
            ? Image.file(fileImage!)
            : imageUrl != null
                ? CachedNetworkImage(
                    imageUrl: imageUrl!,
                    placeholder: (context, url) => _buildPlaceholderImage(),
                    errorWidget: (context, url, error) => _buildErrorImage(),
                    fadeInDuration: Duration(milliseconds: 300),
                    fit: BoxFit.cover,
                    width: radius * 2,
                    height: radius * 2,
                  )
                : placeholderImageUrl != null && placeholderImageUrl!.isNotEmpty
                    ? _buildErrorImage()
                    : Container(
                        width: radius * 2,
                        height: radius * 2,
                        decoration: BoxDecoration(
                            color: COLOR_BG_LIGHT,
                            borderRadius: BorderRadius.circular(radius)),
                      ),
      ),
    );
  }

  Widget _buildErrorImage() =>
      placeholderImageUrl != null && placeholderImageUrl!.isNotEmpty
          ? Image.asset(
              placeholderImageUrl!,
              width: radius * 2,
              height: radius * 2,
              fit: BoxFit.cover,
            )
          : SizedBox();

  Widget _buildPlaceholderImage() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: CircularProgressIndicator(),
    ); // Or any other loader widget
  }
}
