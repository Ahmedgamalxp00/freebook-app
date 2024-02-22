import 'package:dartz/dartz.dart';
import 'package:freebook_app/core/errors/failures.dart';
import 'package:freebook_app/features/home/data/models/book_model/book_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> fetchBestSellerBooks();
  Future<Either<Failure, List<BookModel>>> fetchBookDetailes(
      {required String category});
}
