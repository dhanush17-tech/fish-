import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCard extends StatelessWidget {
  final String data;
  final String sub;
  final Color color;
  final Function funct;
  CustomCard({this.data, this.color, this.funct, this.sub});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
              color: color,
              boxShadow: [BoxShadow(blurRadius: 9, color: color)],
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: ListTile(
            //trailing: Icon(Icons.delete, size: 30),
            title: Padding(
              padding: const EdgeInsets.fromLTRB(3, 3, 3, 0),
              child: Column(
                children: [
                  Text(
                    data,
                    style: GoogleFonts.fredokaOne(
                        fontSize: 15, color: Colors.white),
                  ),
                  Text(
                    sub,
                    style: GoogleFonts.fredokaOne(
                        fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.delete,
                size: 25,
              ),
              color: Colors.white,
              onPressed: funct,
            ),
          ),
        ));
  }
}
