import 'package:bookly_app/Features/Search/data/repos/search_repo.dart';
import 'package:bookly_app/Features/Search/presentation/view_model/search_book_cubit/featured_books_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBooksCubit extends Cubit<SearchBooksStates> {
  SearchBooksCubit(this.searchRepo) : super(SearchBooksInitialState());
  SearchRepo searchRepo;
  Future<void> getSearchBooks({required String q}) async {
    emit(SearchBooksLoadingState());
    var result = await searchRepo.getSearchBook(q: q);
    result.fold(
      (failure) => emit(
        SearchBooksErrorState(failure.errorMessage),
      ),
      (books) => emit(
        SearchBooksSuccessState(books),
      ),
    );
  }
}
