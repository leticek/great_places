import 'package:flutter/material.dart';

import '../screens/add_place_screen.dart';

class AddYourFirstPlace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Add your first place now!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        FlatButton.icon(
          icon: Icon(Icons.add),
          label: Text('Add a place'),
          textColor: Theme.of(context).primaryColor,
          onPressed: () =>
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName),
          //highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
      ],
    );
  }
}
