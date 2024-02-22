import 'package:bloc/bloc.dart';
import 'package:freebook_app/features/home/data/models/book_model/book_model.dart';
import 'package:freebook_app/features/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.homeRepo) : super(SearchInitial());
  final HomeRepo homeRepo;
  Future<void> fetchSearchList({required String category}) async {
    emit(SearchLoading());
    var result = await homeRepo.fetchBookDetailes(category: category);
    result.fold((failure) {
      emit(SearchFailure(errMassage: failure.errMessage));
    }, (books) {
      emit(SearchSuccess(books: books));
    });
  }
}
