import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PoemTile extends StatelessWidget {
  final String poemTitle;
  final String poemLines;
  final Function()? onTap;
  const PoemTile(
      {super.key,
      required this.poemTitle,
      required this.poemLines,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      tileColor: Colors.green.shade400,
      textColor: Colors.white,
      title: Text(
        poemTitle,
        style: GoogleFonts.margarine(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
      subtitle: Text("lines: $poemLines"),
      enableFeedback: true,
      enabled: true,
    );
  }
}
