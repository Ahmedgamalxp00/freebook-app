part of 'book_detailes_cubit.dart';

@immutable
sealed class BookDetailesState {}

final class BookDetailesInitial extends BookDetailesState {}

final class BookDetailesLoading extends BookDetailesState {}

final class BookDetailesSuccess extends BookDetailesState {
  final List<BookModel> books;

  BookDetailesSuccess({required this.books});
}

final class BookDetailesfailure extends BookDetailesState {
  final String errMassage;

  BookDetailesfailure({required this.errMassage});
}
