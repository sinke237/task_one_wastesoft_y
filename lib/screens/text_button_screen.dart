import 'package:flutter/material.dart';

// In this class we define our functions to be called inside
//our stfull widget
//we also define the button to used to toggle through the colors
//the state of this class is managed inside the stfull widget
//this way of managing is called #lifting state up and callbacks

class TextButtonScreen extends StatelessWidget {
  //here we declare the functions we'll need to call inside
  //the stfull widget in order to change the color of our
  //appbar and menu buttons
  final Function changeAppBarColor;
  final Function changeMenuColor;
  //this is our constructor
  const TextButtonScreen({
    required this.changeAppBarColor,
    required this.changeMenuColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      //this is our button, that will implement our functions
      child: ElevatedButton(
        onPressed: () {
          changeAppBarColor();
          changeMenuColor();
        },
        child: const Text('Text Button'),
      ),
    );
  }
}
