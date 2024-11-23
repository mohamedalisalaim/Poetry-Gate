// ignore_for_file: must_be_immutable

import 'dart:convert';

import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:poetry_gate/model/poet.dart';
import 'package:poetry_gate/pages/poems_page.dart';
import 'package:poetry_gate/util/poet_tile.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<Poet> poets = [];

  Future getPoets() async {
    poets.clear();
    var response = await http.get(Uri.https("poetrydb.org", "/author"));
    var jsonData = jsonDecode(response.body);
    for (var eachPoet in jsonData["authors"]) {
      final poet = Poet(name: eachPoet);
      poets.add(poet);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade200,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: Text(
          "The Poets",
          style: GoogleFonts.margarine(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: getPoets(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: poets.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PoetTile(
                      poetName: poets[index].name,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PoemPage(
                                poetName: poets[index].name,
                              ),
                            ));
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
      ),
    );
  }
}
