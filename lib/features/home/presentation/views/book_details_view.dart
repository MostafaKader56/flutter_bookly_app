import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter_bookly_app/features/home/presentation/manager/similar_books_cubit/similar_list_cubit.dart';

import 'widgets/book_details_view_body.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SimilarListCubit>(context).fetchSimilarBooks(
      category: widget.bookModel.volumeInfo.categories![0],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BookDetailsViewBody(bookModel: widget.bookModel,)),
    );
  }
}
