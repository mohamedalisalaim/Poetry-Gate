import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PoetTile extends StatelessWidget {
  final void Function()? onPressed;
  final String poetName;

  const PoetTile({
    super.key,
    required this.onPressed,
    required this.poetName,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.green.shade400,
      textColor: Colors.white,
      onTap: onPressed,
      enableFeedback: true,
      enabled: true,
      title: Text(
        poetName,
        style: GoogleFonts.margarine(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}
