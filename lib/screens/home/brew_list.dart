import 'package:flutter/material.dart';
import 'package:ninja_brew_crew/models/brew.dart';
import 'package:ninja_brew_crew/screens/home/brew_tile.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  const BrewList({super.key});

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context);

    for (var brew in brews) {
      print(brew.name);
      print(brew.sugars);
      print(brew.strength);
    }

    return ListView.builder(
      itemCount: brews.length,
      itemBuilder: (context, index) {
        var brewList = brews[index];
        return BrewTile(brew: brewList);
      },
    );
  }
}
