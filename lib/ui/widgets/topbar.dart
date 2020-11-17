import 'package:flutter/material.dart';

class TopBar extends StatefulWidget {
  var titleName;

  TopBar(var this.titleName);

  @override
  State<StatefulWidget> createState() {
    return TopBarState();
  }
}

class TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                //(context);
              },
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Center(
                child: headerText(widget.titleName),
              ),
            )
          ],
        ),
      ),
    );
  }

  Text headerText(var text) {
    return Text(
      text,
      maxLines: 2,
      style: TextStyle(fontSize: 22, color: Color.fromARGB(1, 1, 1, 1)),
    );
  }

  @override
  State<StatefulWidget> createState() {
    return null;
  }
}
