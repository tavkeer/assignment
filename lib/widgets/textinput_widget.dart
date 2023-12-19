import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController textController;
  const TextInputWidget(
      {super.key,
      required this.title,
      required this.hint,
      required this.textController});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [],
    );
  }
}
