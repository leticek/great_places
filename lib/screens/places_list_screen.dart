import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/no_places_yet.dart';
import './add_place_screen.dart';
import '../providers/place_provider.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Places'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () =>
                Navigator.of(context).pushNamed(AddPlaceScreen.routeName),
          )
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<Places>(context, listen: false).selectAndSet(),
        builder: (context, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<Places>(
                builder: (context, places, child) => places.items.length <= 0
                    ? AddYourFirstPlace()
                    : ListView.builder(
                        itemCount: places.items.length,
                        itemBuilder: (context, index) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage: FileImage(
                              places.items.elementAt(index).image,
                            ),
                          ),
                          title: Text(places.items[index].title),
                          onTap: () {
                            // Go to detail page ...
                          },
                        ),
                      ),
              ),
      ),
    );
  }
}
