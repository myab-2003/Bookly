import 'package:bookly_app/Core/Utils/size_confige.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imageUrl , required this.h, required this.w});

  final String imageUrl;
  final double h; 
    final double w; 


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        width: SizeConfig.defaultSize! * w,
        height: SizeConfig.defaultSize! * h,
        child: AspectRatio(
          aspectRatio: 2 / 4,
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: imageUrl,
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
