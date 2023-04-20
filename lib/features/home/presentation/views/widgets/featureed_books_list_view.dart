import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bookly_app/core/widgets/cutom_error_widget.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/cutom_loading_indicator.dart';
import '../../manager/featured_books_cubit/featured_books_cubit.dart';
import 'cutom_book_image.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: SizeConfig.screenHeight! * 0.3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: InkWell(
                    onTap: (){
                              GoRouter.of(context).push(AppRouter.kdetailsView, extra: state.books[index]);

                    },
                      child: CutomBookImage(
                    imageUrl: state.books[index].volumeInfo.imageLinks == null
                        ? 'https://i.pinimg.com/736x/ec/7e/86/ec7e86caa5c7168694316d74ab53f07a.jpg'
                        : state.books[index].volumeInfo.imageLinks!.thumbnail,
                  )),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CutomErrorWidget(errorMessage: state.errorMesssage);
        } else {
          return const CutomLoadingIndicator();
        }
      },
    );
  }
}
