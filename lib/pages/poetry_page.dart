import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PoetryPage extends StatelessWidget {
  final List<String> lines;
  final String poemTitle;

  const PoetryPage({
    super.key,
    required this.lines,
    required this.poemTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green.shade200,
        appBar: AppBar(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          title: Text(
            poemTitle,
            style: GoogleFonts.margarine(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: lines.length,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    (lines[index] == "") ?  " ": "  -  ${lines[index]}",

                    
                    softWrap: true,
                    textAlign: TextAlign.end,
                    style: GoogleFonts.margarine(
                      height: 1.5,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            },
          ),
        ));
  }
}
