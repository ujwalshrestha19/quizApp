import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  var myValue;
  var myFunction;
  Answer(this.myValue, this.myFunction);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: myFunction,
            child: Text(
              myValue,
            ),
          ),
        )
      ],
    );
  }
}
