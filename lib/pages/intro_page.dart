import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poetry_gate/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade200,
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: Text(
          "Welcome",
          style: GoogleFonts.margarine(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // logo
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white30,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    "lib/assets/PoetryGate.png",
                    height: 150,
                  ),
                ),
                Text(
                  "Poetry Gate",
                  style: GoogleFonts.margarine(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),

                

                // qoute about poem
                Text(
                  "A poet is, before anything else, a person who is passionately in love with language.",
                  style: GoogleFonts.margarine(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "W.H. Auden",
                  style: GoogleFonts.margarine(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),

                

                // button
                MaterialButton(
                  padding: EdgeInsets.all(24), 
                  color: Colors.green,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ));
                  },
                  child: Text(
                    "Start Your Journy",
                    style: GoogleFonts.margarine(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                

                Text(
                  "Created With ❤️ By Mohamed Ali Salaim",
                  style: GoogleFonts.margarine(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
