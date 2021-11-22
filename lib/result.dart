import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final void Function() restartFunction;
  var finalScore;
  Result(this.restartFunction, this.finalScore);

  String get finalValue {
    var myValue;
    if (finalScore > 40) {
      myValue = "Passed. Your final score is ${finalScore}";
    } else if (finalScore > 30) {
      myValue = "Average. Your final score is ${finalScore}";
    } else {
      myValue = "Fail. Your final score is ${finalScore}";
    }
    return myValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Text(finalValue,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold)),
          FlatButton(
            onPressed: restartFunction,
            child: Text("Restart",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
          )
        ],
      ),
    );
  }
}
