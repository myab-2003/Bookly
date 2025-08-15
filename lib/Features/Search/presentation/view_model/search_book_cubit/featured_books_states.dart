import 'package:bookly_app/Features/Home/data/models/book_model/book_model.dart';

abstract class SearchBooksStates {}

class SearchBooksInitialState extends SearchBooksStates {}

class SearchBooksLoadingState extends SearchBooksStates {}

class SearchBooksSuccessState extends SearchBooksStates {
  final List<BookModel> books;
  SearchBooksSuccessState(this.books);
}

class SearchBooksErrorState extends SearchBooksStates {
  final String errorMessage;
  SearchBooksErrorState(this.errorMessage);
}
