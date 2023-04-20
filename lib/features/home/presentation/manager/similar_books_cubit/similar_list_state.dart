part of 'similar_list_cubit.dart';

abstract class SimilarListState extends Equatable {
  const SimilarListState();

  @override
  List<Object> get props => [];
}

class SimilarListInitial extends SimilarListState {}

class SimilarListLoading extends SimilarListState {}
class SimilarListFialure extends SimilarListState {
  final String errorMessage;

  const SimilarListFialure(this.errorMessage);
}
class SimilarListSuccess extends SimilarListState {
  final List<BookModel> books;

  const SimilarListSuccess(this.books);
}
