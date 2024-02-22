import 'package:bloc/bloc.dart';
import 'package:freebook_app/features/home/data/models/book_model/book_model.dart';
import 'package:freebook_app/features/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'best_seller_state.dart';

class BestSellerCubit extends Cubit<BestSellerState> {
  BestSellerCubit(this.homeRepo) : super(BestSellerInitial());
  final HomeRepo homeRepo;
  Future<void> fetchBestSellerBooks() async {
    emit(BestSellerLoading());
    var resulte = await homeRepo.fetchBestSellerBooks();
    resulte.fold((failure) {
      emit(BestSellerFailure(errMassage: failure.errMessage));
    }, (books) {
      emit(BestSellerSuccess(books: books));
    });
  }
}
