import 'package:flutter/material.dart';

class FAB extends StatelessWidget {
  final Function callCounter;
  final Widget value;
  const FAB({required this.callCounter, required this.value, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FloatingActionButton(
        child: value,
        onPressed: () => callCounter(),
      ),
    );
  }
}
