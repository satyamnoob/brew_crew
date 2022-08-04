import 'package:flutter/material.dart';

import '../../models/brew.dart';

class BrewTile extends StatelessWidget {
  const BrewTile({
    Key? key,
    this.brew,
  }) : super(key: key);

  final Brew? brew;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Card(
        margin: const EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.brown[brew!.strength!],
            backgroundImage: AssetImage('assets/coffee_icon.png'),
          ),
          title: Text(brew!.name!),
          subtitle: Text('Takes ${brew!.sugars} sugars(s)'),
        ),
      ),
    );
  }
}
