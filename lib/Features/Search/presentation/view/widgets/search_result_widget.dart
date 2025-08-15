import 'package:bookly_app/Core/Utils/service_locator.dart';
import 'package:bookly_app/Core/widgets/custom_error_widget.dart';
import 'package:bookly_app/Core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/Features/Search/data/repos/search_repo_impl.dart';
import 'package:bookly_app/Features/Search/presentation/view/widgets/search_list.dart';
import 'package:bookly_app/Features/Search/presentation/view_model/search_book_cubit/Search_books_cubit.dart';
import 'package:bookly_app/Features/Search/presentation/view_model/search_book_cubit/featured_books_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key, required this.query});
  final String query;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SearchBooksCubit(getIt.get<SearchRepoImpl>())
            ..getSearchBooks(q: query),
      child: BlocBuilder<SearchBooksCubit, SearchBooksStates>(
        builder: (context, state) {
          if (state is SearchBooksLoadingState) {
            return const CustomLoadingIndicator();
          } else if (state is SearchBooksSuccessState) {
            return SearchList(books: state.books);
          } else if (state is SearchBooksErrorState) {
            return CustomErrorWidget(errMessage: state.errorMessage);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
