import 'package:bookly_app/Core/Utils/size_confige.dart';
import 'package:bookly_app/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/book_Details/presentation/widget/bookapp_bar.dart';
import 'package:bookly_app/Features/book_Details/presentation/widget/bookdReview.dart';
import 'package:bookly_app/Features/book_Details/presentation/widget/booksuggestion.dart';
import 'package:bookly_app/Features/book_Details/presentation/widget/previewbox.dart';
import 'package:flutter/material.dart';

class bookdetailesbody extends StatelessWidget {
  const bookdetailesbody({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: SizeConfig.defaultSize! * 2),
        bookAppbar(),
        BookDetailsSection(book: bookModel),
        SizedBox(height: SizeConfig.defaultSize! * 2),
        Previewbox(bookModel: bookModel),
        SizedBox(height: SizeConfig.defaultSize! * 1),
        Booksuggestion(),
        SizedBox(height: SizeConfig.defaultSize! * 1),
      ],
    );
  }
}
