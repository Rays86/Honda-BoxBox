import 'package:flutter/material.dart';

class TitleName extends StatelessWidget {
  final String titleText;
  final IconData infoIcon;
  final VoidCallback onPressed;

  const TitleName(
      {required this.titleText,
      required this.infoIcon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(40.0, 0, 1.0, 0),
          child: Text(
            titleText,
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
        IconButton(
            icon: Icon(
              infoIcon,
              size: 25.0,
            ),
            onPressed: onPressed),
      ],
    );
  }
}
