import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Explore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explore"),
      ),
      body: ListView(
        children: [
          Blog(
              title: "Common Fever",
              desc:
                  "பொதுவாய் காய்ச்சல் வந்தால், நிறைய பேர் நீர் அதிகம் குடிக்க மாட்டார்கள். ....."),
        ],
      ),
      backgroundColor: Colors.greenAccent,
    );
  }
}

class Blog extends StatelessWidget {
  final String title;
  final String desc;

  Blog({this.title, this.desc});
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
            color: Colors.grey,
            boxShadow: [BoxShadow(blurRadius: 9, color: Colors.white)],
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: ListTile(
          //trailing: Icon(Icons.delete, size: 30),
          title: Padding(
            padding: const EdgeInsets.fromLTRB(3, 3, 3, 0),
            child: Column(children: [
              ClipRect(
                child: Image.asset(
                  "assets/sample.jpg",
                  height: 100,
                ),
              ),
              Text(
                title,
                textAlign: TextAlign.left,
                style:
                    GoogleFonts.fredokaOne(fontSize: 15, color: Colors.white),
              ),
              Text(
                desc,
                textAlign: TextAlign.left,
                style:
                    GoogleFonts.fredokaOne(fontSize: 15, color: Colors.white),
              ),
            ]),
          ),
        ),
      ),
    ]);
  }
}