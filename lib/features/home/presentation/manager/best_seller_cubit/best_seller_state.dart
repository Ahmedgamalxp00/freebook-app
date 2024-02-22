part of 'best_seller_cubit.dart';

@immutable
sealed class BestSellerState {}

final class BestSellerInitial extends BestSellerState {}

final class BestSellerLoading extends BestSellerState {}

final class BestSellerFailure extends BestSellerState {
  final String errMassage;

  BestSellerFailure({required this.errMassage});
}

final class BestSellerSuccess extends BestSellerState {
  final List<BookModel> books;

  BestSellerSuccess({required this.books});
}
