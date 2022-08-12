import 'package:flutter/material.dart';

class NextSave extends StatelessWidget {
  final VoidCallback selectHandler;
  final String next;

  NextSave(this.selectHandler, this.next);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(next),
        onPressed: selectHandler,
      ),
    );
  }
}
