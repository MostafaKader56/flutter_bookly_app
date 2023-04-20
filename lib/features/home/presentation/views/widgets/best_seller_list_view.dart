import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bookly_app/core/widgets/cutom_error_widget.dart';
import 'package:flutter_bookly_app/core/widgets/cutom_loading_indicator.dart';
import 'package:flutter_bookly_app/features/home/presentation/manager/newset_books_cubit/newset_books_cubit.dart';

import 'best_seller_list_view_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: BlocBuilder<NewsetBooksCubit, NewsetBooksState>(
        builder: (context, state) {
          if (state is NewsetBooksSuccess) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: state.books.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BookListViewItem(bookModel: state.books[index],),
                );
              },
            );
          }
          else if(state is NewsetBooksFailure){
            return CutomErrorWidget(errorMessage: state.errorMesssage);
          }
          else{
            return const CutomLoadingIndicator();
          }
        },
      ),
    );
  }
}
