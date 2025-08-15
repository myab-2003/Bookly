import 'package:bookly_app/Core/Errors/failure.dart';
import 'package:bookly_app/Features/Home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookModel>>> getSearchBook({
    required String q,
  });
}
