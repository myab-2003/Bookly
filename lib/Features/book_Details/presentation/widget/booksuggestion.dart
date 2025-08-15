import 'package:bookly_app/Core/Utils/size_confige.dart';
import 'package:bookly_app/Features/book_Details/presentation/widget/similar_books_list_view.dart';
import 'package:flutter/material.dart';

class Booksuggestion extends StatelessWidget {
  const Booksuggestion({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.defaultSize! * 2,
          ),
          child: Text(
            'You can also like',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: SizeConfig.defaultSize! * 2),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.defaultSize! * 2,
          ),
          height: SizeConfig.defaultSize! * 18,
          child: SimilarBooksListview(), 
        ),
      ],
    );
  }
}
