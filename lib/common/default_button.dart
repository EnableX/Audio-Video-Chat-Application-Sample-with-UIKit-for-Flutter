
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
  Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);
  final String text;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 50,
      child: ElevatedButton(
        onPressed: press,
        clipBehavior: Clip.hardEdge,
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontFamily: "Poppins-Regular",
              fontWeight: FontWeight.normal
          ),
        ),
      ),
    );
  }
}