import 'package:bookly_app/Core/Utils/styles.dart';
import 'package:bookly_app/Features/Home/presentation/widget/Newest_list_view.dart';
import 'package:bookly_app/Features/Home/presentation/widget/featured_list_view.dart';
import 'package:flutter/material.dart';
import 'package:bookly_app/Core/Utils/size_confige.dart';
import 'package:bookly_app/Features/Home/presentation/widget/Customappbar.dart';

class Homebody extends StatelessWidget {
  const Homebody({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: SizeConfig.defaultSize! * 6),
        const CustomAppbar(),

        SizedBox(height: SizeConfig.defaultSize! * 2),
        SizedBox(
          // height: SizeConfig.screenHeight! * 0.60,
          height: SizeConfig.defaultSize! * 35,

          child: FeaturedBooksListView(),
        ),
        SizedBox(height: SizeConfig.defaultSize! * 3),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.defaultSize! * 2,
          ),
          child: Text('Newset Books', style: Styles.textStyle21),
        ),
        SizedBox(height: SizeConfig.defaultSize! * 1),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.defaultSize! * 4,
            ),
            child: NewestListView(),
          ),
        ),
        SizedBox(height: SizeConfig.defaultSize! * 2),
      ],
    );
  }
}
