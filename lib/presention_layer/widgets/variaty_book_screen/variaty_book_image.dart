import 'package:flutter/material.dart';

class VariatyBookImage extends StatelessWidget {
  const VariatyBookImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 424,
      width: double.infinity,
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage('assets/images/variaty.png'))),
    );
  }
}
