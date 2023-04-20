import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bookly_app/core/widgets/cutom_error_widget.dart';
import 'package:flutter_bookly_app/core/widgets/cutom_loading_indicator.dart';

import '../../manager/similar_books_cubit/similar_list_cubit.dart';
import 'cutom_book_image.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarListCubit, SimilarListState>(
      builder: (context, state) {
        if (state is SimilarListSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: CutomBookImage(
                    imageUrl: state
                            .books[index].volumeInfo.imageLinks?.thumbnail ??
                        'https://i.pinimg.com/736x/ec/7e/86/ec7e86caa5c7168694316d74ab53f07a.jpg',
                  ),
                );
              },
            ),
          );
        } else if (state is SimilarListFialure) {
          return CutomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const CutomLoadingIndicator();
        }
      },
    );
  }
}
