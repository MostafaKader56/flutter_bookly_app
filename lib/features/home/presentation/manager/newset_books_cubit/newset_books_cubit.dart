import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bookly_app/core/errors/failures.dart';
import 'package:flutter_bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter_bookly_app/features/home/data/repos/home_repo.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this.homeRepo) : super(NewsetBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchNewsetBooks() async {
    emit(NewsetBooksLoading());
    var result = await homeRepo.fetchNewsetBooks();
    result.fold((failure) => emit(NewsetBooksFailure(failure.errorMesssage)),
        (books) => emit(NewsetBooksSuccess(books)));
  }
}
