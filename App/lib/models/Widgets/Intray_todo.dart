import 'package:flutter/material.dart';

import '../global.dart';

class IntrayTodo extends StatelessWidget {

  final String title;
  IntrayTodo({this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      padding: EdgeInsets.all(10),
      height: 120,
      width: 100,
      decoration: BoxDecoration(
          color: redColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.black.withOpacity(0.5),
            ),
          ]),
      child: Row(
        children: <Widget>[
          Radio(),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Avenir',
              fontWeight: FontWeight.w500,
              color: darkGreyColor,
              fontSize: 40,
            ),
          )
        ],
      ),
    );
  }
}
