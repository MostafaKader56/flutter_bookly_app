import 'package:flutter/material.dart';

import '../../../../../core/utils/size_config.dart';
import '../../../../../core/utils/styles.dart';
import '../../../data/models/book_model/book_model.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'cutom_book_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth! * 0.17),
          child: CutomBookImage(
            imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ??
                'https://i.pinimg.com/736x/ec/7e/86/ec7e86caa5c7168694316d74ab53f07a.jpg',
          ),
        ),
        const SizedBox(
          height: 43,
        ),
        Text(
          bookModel.volumeInfo.title!,
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            bookModel.volumeInfo.authors?[0] ?? '',
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        BookRating(
            mainAxisAlignment: MainAxisAlignment.center,
            rating: 4.5,
            count: bookModel.volumeInfo.pageCount ?? 0),
        const SizedBox(
          height: 37,
        ),
        BooksAction(bookModel: bookModel,),
      ],
    );
  }
}
