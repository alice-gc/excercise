import 'package:flutter/material.dart';

class BackNextButton extends StatefulWidget {
  BackNextButton({Key? key, required this.selectHandler, required this.title})
      : super(key: key);

  final VoidCallback selectHandler;
  final String title;

  @override
  State<BackNextButton> createState() => _BackNextButtonState();
}

class _BackNextButtonState extends State<BackNextButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: ElevatedButton(
        child: Text(widget.title),
        onPressed: widget.selectHandler,
      ),
    );
  }
}

class NextSave extends StatelessWidget {
  final VoidCallback selectHandler;
  final String next;

  const NextSave(this.selectHandler, this.next);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: ElevatedButton(
        child: Text(next),
        onPressed: selectHandler,
      ),
    );
  }
}
