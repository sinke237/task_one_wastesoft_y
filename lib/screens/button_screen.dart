import 'package:flutter/material.dart';

//In this class
class ButtonScreen extends StatelessWidget {
  final Function colorChangeFunction;
  //final Color color;
  const ButtonScreen({required this.colorChangeFunction, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: 100,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.white,
            shadowColor: Colors.green,
            textStyle:
                const TextStyle(fontSize: 18.0, backgroundColor: Colors.green)),
        onPressed: () => colorChangeFunction(),
        child: const Text('Button'),
      ),
    ));
  }
}
