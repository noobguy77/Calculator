import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DelButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color fillColor;
  final Function callback;
  const DelButton({
    Key? key,
    required this.text,
    required this.fillColor,
    required this.textColor,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: SizedBox(
        width: 75,
        height: 75,
        // child: ElevatedButton(
        //   style: ElevatedButton.styleFrom(
        //     primary: fillColor,
        //     onPrimary: textColor,
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.all(Radius.circular(60)),
        //     ),
        //     // shadowColor: Color(0xFF283637),
        //   ),
        //   onPressed: () {
        //     callback(text);
        //   },
        //   child: Text(
        //     text,
        //     style: GoogleFonts.rubik(
        //       textStyle: TextStyle(
        //         fontSize: 20,
        //         // color: Color(0xFFFFFF),
        //       ),
        //     ),
        //   ),
        // ),
        child: ElevatedButton.icon(
          onPressed: callback(text),
          icon: Icon(Icons.delete),
          style: ElevatedButton.styleFrom(
            primary: fillColor,
            onPrimary: textColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(60)),
            ),
          ),
          label: Text(
            text,
            style: GoogleFonts.rubik(
              textStyle: TextStyle(
                fontSize: 20,
                // color: Color(0xFFFFFF),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
