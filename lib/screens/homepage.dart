import 'package:flutter/material.dart';
import 'package:task_1_mon_28th_feb22/custom_widgets/app_bar.dart';
import 'package:task_1_mon_28th_feb22/custom_widgets/bottom_nav_bar_item_widget.dart';
import 'package:task_1_mon_28th_feb22/custom_widgets/list_tile_widget.dart';
import 'package:task_1_mon_28th_feb22/screens/fab.dart';
import 'package:task_1_mon_28th_feb22/screens/text_button_screen.dart';

import 'button_screen.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //the bool variables are used to toggle the colors of
  //the screen and appbar & menu buttons

  bool selectedButtonApp = true;
  bool selectedButtonAppScreen = true;
  bool selectedMenuButton = true;
  int i = 0;
  late int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    //these are the various pages in the project
    List<Widget> _pages = <Widget>[
      //the homepage
      const Center(
        child: Text(
          'This is the Homepage',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      //FAB is suppose to be a stless, //
      // with all stful implementations here
      // because we want just one stful widget

      //implementation of the floatingActionButton
      FAB(
        callCounter: () {
          counterFAB(i);
        },
        value: Text("$i"),
      ),
      //implementation of the ButtonScreen
      ButtonScreen(
        colorChangeFunction: () {
          screenChange();
        },
      ),
      //implementation of the TextButtonScreen
      TextButtonScreen(
        changeAppBarColor: () {
          appBarChange();
        },
        changeMenuColor: () {
          changeMenuBar();
        },
      ),
    ];
    return Scaffold(
      backgroundColor: selectedButtonAppScreen ? Colors.grey : Colors.green,
      //this project, requires that when you press the button
      //at Button page, the color of the appbar should change
      //so we shall implement this app bar as follows
      appBar:
          //this is simply mean we have two appbars;
          //the default and edited app bars, that we can toggle from
          //the default appbar is the one you see just when
          //you open the app. the edited one is seen after button is pressed
          selectedButtonApp ? defaultAppBar(context) : editedAppBar(context),
      //this is the drawer which appears only if you have an app bar
      //it is to the left on the app bar and has the contents below.
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                children: const [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.task),
                  ),
                  Divider(),
                  Text(
                    "Task_One Menu",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            //these are the contents on the drawer.
            //you can add more functionalities here later.
            listTileWidget(
              'Homepage',
              const Icon(Icons.home),
            ),
            listTileWidget('FAB', const Icon(Icons.add)),
            listTileWidget(
              'Button',
              const Icon(Icons.radio_button_checked_outlined),
            ),
            listTileWidget(
              'TextButton',
              const Icon(Icons.text_fields_sharp),
            ),
          ],
        ),
      ),
      body: IndexedStack(
        //this preserves the state of each page
        index: _selectedIndex,
        children: _pages,
      ),

      //this is the bottom NavBar
      bottomNavigationBar: BottomNavigationBar(
        //this bg color is implemented this way in other
        //to be able to toggle through two colors
        backgroundColor: selectedMenuButton ? Colors.green : Colors.red,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        iconSize: 28.0,
        unselectedFontSize: 18.0,
        selectedFontSize: 20.0,
        unselectedItemColor: Colors.yellow,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          bottomNavBarItemWidget(
            'Homepage',
            const Icon(Icons.home),
          ),
          bottomNavBarItemWidget(
            'FAB',
            const Icon(Icons.filter_9_plus),
          ),
          bottomNavBarItemWidget(
            'Button',
            const Icon(Icons.radio_button_checked_outlined),
          ),
          bottomNavBarItemWidget(
            'Text Button',
            const Icon(Icons.text_fields_sharp),
          ),
        ],
      ),
    );
  }
//here are the various state management code for this project

  //this is to preserve the state of each page and
  // to move from one page to another using the bottom NavBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //this is for the floating action button, to count upwards
  counterFAB(int counter) {
    setState(() {
      counter = i++;
      //the print funtion prints the value of the counter
      //in the console. so i will comment it out as i know it works
      //print(i);
    });
  }

  //this is to toggle the color of the appBar
  // using the boolean variable selectedButtonApp
  appBarChange() {
    setState(() {
      selectedButtonApp = !selectedButtonApp;
    });
  }

  //this is to toggle the color of the MenuBar
  // using the boolean variable selectedMenuButton
  changeMenuBar() {
    setState(() {
      selectedMenuButton = !selectedMenuButton;
    });
  }

  //this is to toggle the color of the screen/bg color
  // using the boolean variable selectedButtonAppScreen
  screenChange() {
    setState(() {
      selectedButtonAppScreen = !selectedButtonAppScreen;
    });
  }
}
