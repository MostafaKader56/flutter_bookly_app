import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter_bookly_app/features/home/data/repos/home_repo.dart';

part 'similar_list_state.dart';

class SimilarListCubit extends Cubit<SimilarListState> {
  SimilarListCubit(this.homeRepo) : super(SimilarListInitial());

  final HomeRepo homeRepo;
  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarListLoading());
    var result = await homeRepo.fetchSimilarBooks(category: category);
    result.fold((failure) => emit(SimilarListFialure(failure.errorMesssage)),
        (books) => emit(SimilarListSuccess(books)));
  }
}
