// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:poetry_gate/model/poem.dart';
import 'package:poetry_gate/pages/poetry_page.dart';
import 'package:poetry_gate/util/poem_tile.dart';

class PoemPage extends StatelessWidget {
  final String poetName;
  PoemPage({
    super.key,
    required this.poetName,
  });

  List<Poem> poems = [];

  Future getPoems() async {
    poems.clear();
    var response =
        await http.get(Uri.https("poetrydb.org", "author/$poetName"));
    var jsonData = jsonDecode(response.body);

    for (int i = 0; i < jsonData.length; i++) {
      final poem = Poem(
        title: jsonData[i]["title"],
        lineCount: jsonData[i]["linecount"],
        lines: List.from(jsonData[i]["lines"]),
      );
      poems.add(poem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade200,
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: Text(
          poetName,
          style: GoogleFonts.margarine(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getPoems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: poems.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: PoemTile(
                    poemTitle: poems[index].title,
                    poemLines: poems[index].lineCount,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PoetryPage(
                            lines: poems[index].lines,
                            poemTitle: poems[index].title,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            );
          }
        },
      ),
    );
  }
}
