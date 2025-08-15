import 'package:bookly_app/Core/Errors/failure.dart';
import 'package:bookly_app/Core/Utils/Service/api_service.dart';
import 'package:bookly_app/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/Search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  SearchRepoImpl(this.apiServices);
  ApiService apiServices;
  @override
  Future<Either<Failure, List<BookModel>>> getSearchBook(
      {required String q}) async {
    try {
      var data = await apiServices.get(endPoint: 'volumes?q=$q');
      List<BookModel> books = [];
      if (data['items'] != null) {
        for (var item in data['items']) {
          books.add(BookModel.fromJson(item));
        }
        return right(books);
      }
      return left(ServerFailure('No books found'));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
