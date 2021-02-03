import 'package:flutter/material.dart';
import 'package:Maruthuvan/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

List<String> common = ["aaa", "bbb", "ccc", "ddd"];
List<String> symptomList = ["aaa"];

class HeaderWithSearchBox extends StatefulWidget {
  const HeaderWithSearchBox({Key key, @required this.size, this.addSym})
      : super(key: key);

  final Size size;
  final Function addSym;

  @override
  _HeaderWithSearchBoxState createState() => _HeaderWithSearchBoxState();
}

class _HeaderWithSearchBoxState extends State<HeaderWithSearchBox> {
  final TextEditingController _controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding * 2.5),
      // It will cover 20% of our total height
      height: widget.size.height * 0.2,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: 36 + kDefaultPadding,
            ),
            height: widget.size.height * 0.2 - 27,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: Row(
              children: <Widget>[
                Text('Welcome!',
                    style: GoogleFonts.fredokaOne(
                        fontSize: 30, color: Colors.white)),
                Spacer(),
                Image.asset("assets/transp-logo.png")
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 54,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onSubmitted: (value) {
                        setState(() {
                          _controller.text = "";
                        });
                        widget.addSym(value);
                      },
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Discover fishes",
                        hintStyle: TextStyle(
                          color: kPrimaryColor.withOpacity(0.5),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  PopupMenuButton<String>(
                    icon: Icon(Icons.arrow_downward),
                    onSelected: (String value) {
                      widget.addSym(value);
                    },
                    itemBuilder: (BuildContext context) {
                      return common.map<PopupMenuItem<String>>((String value) {
                        return new PopupMenuItem(
                            child: new Text(value), value: value);
                      }).toList();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
