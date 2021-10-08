import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:calculator/main.dart';

class CalcButton_LandScape extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color fillColor;
  final Function callback;
  const CalcButton_LandScape({
    Key? key,
    required this.text,
    required this.fillColor,
    required this.textColor,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        width: 65,
        height: 45,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: fillColor,
            onPrimary: textColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(60)),
            ),
            // shadowColor: Color(0xFF283637),
          ),
          onPressed: () {
            callback(text);
          },
          child: Text(
            text,
            style: GoogleFonts.rubik(
              textStyle: TextStyle(
                fontSize: 12,
                // color: Color(0xFFFFFF),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
