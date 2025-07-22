import 'package:flutter/material.dart';
import 'package:workspace/presention_layer/widgets/variaty_book_screen/variaty_book_image.dart';
import 'package:workspace/presention_layer/widgets/variaty_book_screen/variaty_book_text.dart';

class VariatyBook extends StatelessWidget {
  const VariatyBook({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 25,
            ),
            VariatyBookImage(),
            VariatyBookText(),
          ],
        ),
      ),
    );
  }
}
