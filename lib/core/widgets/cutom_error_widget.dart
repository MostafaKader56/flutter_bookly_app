import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CutomErrorWidget extends StatelessWidget {
  const CutomErrorWidget({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errorMessage, style: Styles.textStyle18,));
  }
}