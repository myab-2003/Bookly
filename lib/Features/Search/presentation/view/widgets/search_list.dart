import 'package:bookly_app/Features/Home/presentation/widget/Newest_list_view_item.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchList extends StatelessWidget {
  const SearchList({super.key, required this.books});
  final List books;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true, // ✅ مهم عشان يشتغل جوه Dialog
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          GoRouter.of(context).push(AppRouter.kBookDetailsView);
        },
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 4,
            top: 4.0,
            right: 8.0,
            left: 8.0,
          ),
          child: NewestListViewItem(bookModel: books[index]),
        ),
      ),
      itemCount: books.length,
    );
  }
}
