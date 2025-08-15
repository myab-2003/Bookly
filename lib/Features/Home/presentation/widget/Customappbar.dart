import 'package:bookly_app/Core/Utils/size_confige.dart';
import 'package:bookly_app/Features/Search/presentation/view/searchview.dart';
import 'package:bookly_app/Features/Splash/Presentation/Widget/logotext.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          logotext(size: SizeConfig.defaultSize! * 4),

          IconButton(
            onPressed: () => showSearchDialog(context),
            icon: const Icon(Icons.search, size: 40),
          ),
        ],
      ),
    );
  }
}
