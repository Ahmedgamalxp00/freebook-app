import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:freebook_app/core/errors/failures.dart';
import 'package:freebook_app/core/utils/api_services.dart';
import 'package:freebook_app/features/home/data/models/book_model/book_model.dart';
import 'package:freebook_app/features/search/data/repos/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiServices apiServices;
  SearchRepoImpl(this.apiServices);
  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchList(
      {required String category}) async {
    try {
      var data = await apiServices.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=intitle:$category');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
