import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/widgets/cutom_botton.dart';
import '../../../data/models/book_model/book_model.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: CutomButton(
              onPressed: () {},
              text: 'Free',
              backgroundColor: Colors.white,
              textColor: Colors.black,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12)),
            ),
          ),
          Expanded(
            child: CutomButton(
              onPressed: () async {
                Uri uri  = Uri.parse(bookModel.volumeInfo.previewLink!);
                if (await launchUrl(uri)) {
                  await launchUrl(uri);
                }
              },
              text: getisForPreview(bookModel),
              fontSize: 16,
              backgroundColor: Color(0xffef8262),
              textColor: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12)),
            ),
          )
        ],
      ),
    );
  }
  
  getisForPreview(BookModel bookModel) {
    if (bookModel.volumeInfo.previewLink == null) {
      return 'Not Available';
    }
    return 'Preview';
  }
}
