import 'package:flutter/material.dart';

listTileWidget(String kText, Widget kIcon) {
  return Card(
    child: ListTile(
      leading: CircleAvatar(child: kIcon),
      title: Text(kText),
      onTap: () {},
    ),
  );
}
