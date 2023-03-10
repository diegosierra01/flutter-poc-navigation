import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class WhitePage extends StatefulWidget {
  const WhitePage(
      {super.key,
      required this.title,
      required this.buttonText,
      required this.onPressed,
      required this.color});
  final String title;
  final String buttonText;
  final Color color;
  final Function()? onPressed;
  @override
  State<WhitePage> createState() => _WhitePageState();
}

class _WhitePageState extends State<WhitePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.color,
      body: SafeArea(
        child: Column(
          children: [
            Text(widget.title),
            TextButton(
                onPressed: widget.onPressed, child: Text(widget.buttonText))
          ],
        ),
      ),
    );
    ;
  }
}
