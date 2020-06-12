import 'package:flutter/material.dart';
import 'package:comunica_mobile/widgets/FilterWidgets/menuItem.dart';

class MenuBuilder extends StatelessWidget {
  final List<MenuItem> items;

  MenuBuilder(this.items, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: items,
    );
  }
}
