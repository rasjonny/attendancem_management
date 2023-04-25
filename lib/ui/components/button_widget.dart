import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.onClicked, required this.text});
  final VoidCallback onClicked;
  final String text;
  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          foregroundColor: Colors.white,
          fixedSize: Size(MediaQuery.of(context).size.width * .5, 40),
        ),
        onPressed: onClicked,
        child: Text(text),
      );
}
