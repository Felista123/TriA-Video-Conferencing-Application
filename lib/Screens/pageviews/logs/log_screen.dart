import 'package:flutter/material.dart';
import 'package:tria/Screens/callscreens/pickup/pickup_layout.dart';
import 'package:tria/Screens/pageviews/logs/widgets/log_list_container.dart';
import 'package:tria/utils/universal_variables.dart';
import 'package:tria/widgets/tria_appbar.dart';

class LogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PickupLayout(
      scaffold: Scaffold(
        backgroundColor: UniversalVariables.blackColor,
        appBar: TriaAppBar(
          title: "Calls",
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, "/search_screen");
              },
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 15),
          child: LogListContainer(),
        ),
      ),
    );
  }
}
