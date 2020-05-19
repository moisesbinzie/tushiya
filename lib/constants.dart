import 'package:flutter/material.dart';

class PlacedHolder extends StatelessWidget {
  const PlacedHolder({
    Key key,
    @required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Placeholder(
          color: Colors.amber,
          fallbackHeight: MediaQuery.of(context).size.height * 1 / 5),
    );
  }
}
