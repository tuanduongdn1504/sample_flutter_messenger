import 'package:flutter/material.dart';
import 'package:sample_flutter_messenger/di/module_container.dart';
import 'package:sample_flutter_messenger/helper/app_navigator.dart';
import 'package:sample_flutter_messenger/widgets/bottom_bar.dart';

class HomeRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  static const List<Widget> _screens = <Widget>[
    Text(
      'Chats',
    ),
    Text(
      'Calls',
    ),
    Text(
      'Contacts',
    ),
    Text(
      'Settings',
    ),
  ];
  int _activeIndex = 0;

  void _handleTabChanged(newIndex) {
    if (newIndex == _screens.length) {
      ModuleContainer()
          .get<AppNavigator>(param1: context)
          .navigateToNewActionRoute();
    } else {
      setState(() {
        _activeIndex = newIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: _screens.elementAt(_activeIndex),
        ),
        bottomNavigationBar: BottomBar(
          activeIndex: _activeIndex,
          onClicked: _handleTabChanged,
        ),
      );
}
