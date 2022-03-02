import 'package:flutter/material.dart';

defaultAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.blue,
    centerTitle: true,
    title: Text('task_one'),
  );
}

editedAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.green,
    centerTitle: true,
    title: Text('task_one'),
  );
}
