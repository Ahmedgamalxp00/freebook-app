import 'package:bloc/bloc.dart';
import 'package:freebook_app/features/home/data/models/book_model/book_model.dart';
import 'package:freebook_app/features/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'book_detailes_state.dart';

class BookDetailesCubit extends Cubit<BookDetailesState> {
  BookDetailesCubit(this.homeRepo) : super(BookDetailesInitial());

  final HomeRepo homeRepo;
  Future<void> fetchRelatedBooks({required String category}) async {
    emit(BookDetailesLoading());
    var result = await homeRepo.fetchBookDetailes(category: category);
    result.fold((failure) {
      emit(BookDetailesfailure(errMassage: failure.errMessage));
    }, (books) {
      emit(BookDetailesSuccess(books: books));
    });
  }
}
