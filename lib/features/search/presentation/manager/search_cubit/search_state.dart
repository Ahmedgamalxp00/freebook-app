part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchFailure extends SearchState {
  final String errMassage;

  SearchFailure({required this.errMassage});
}

final class SearchSuccess extends SearchState {
  final List<BookModel> books;

  SearchSuccess({required this.books});
}
