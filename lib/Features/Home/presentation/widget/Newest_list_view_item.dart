import 'package:bookly_app/Core/Utils/constants.dart';
import 'package:bookly_app/Core/Utils/size_confige.dart';
import 'package:bookly_app/Core/Utils/styles.dart';
import 'package:bookly_app/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/book_Details/presentation/widget/book_rating.dart';
import 'package:bookly_app/Features/book_Details/presentation/widget/custom_book_item.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewestListViewItem extends StatelessWidget {
  const NewestListViewItem({super.key, required this.bookModel});

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: bookModel);
      },
      child: SizedBox(
        height: SizeConfig.defaultSize! * 18,
        child: Row(
          children: [
            CustomBookImage(
              imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
              h: 15,
              w: 10,
            ),
            SizedBox(width: SizeConfig.defaultSize! * 3),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: SizeConfig.defaultSize! * 1.5),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 1.5,
                    child: Text(
                      bookModel.volumeInfo.title ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle15.copyWith(
                        fontFamily: kGtSectraFine,
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.defaultSize! * .5),
                  Text(
                    bookModel.volumeInfo.authors != null &&
                            bookModel.volumeInfo.authors!.isNotEmpty
                        ? bookModel.volumeInfo.authors![0]
                        : 'Unknown',
                    style: Styles.textStyle14,
                  ),
                  SizedBox(height: SizeConfig.defaultSize! * 2),
                  Row(
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: SizeConfig.defaultSize! * 2),
                      BookRating(
                        rating:
                            bookModel.volumeInfo.averageRating?.round() ?? 0,
                        count: bookModel.volumeInfo.ratingsCount ?? 0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
