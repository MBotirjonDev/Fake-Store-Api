import 'package:flutter/material.dart';

List<BottomNavigationBarItem> bottomNavItems = const <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    backgroundColor: Colors.greenAccent,
    icon: Icon(Icons.home_outlined),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    backgroundColor: Colors.amberAccent,
    icon: Icon(Icons.search_outlined),
    label: 'Search',
  ),

  BottomNavigationBarItem(
    backgroundColor: Colors.pinkAccent,
    icon: Icon(Icons.shopping_basket_outlined),
    label: 'Basket',
  ),
  BottomNavigationBarItem(
    backgroundColor: Colors.redAccent,
    icon: Icon(Icons.admin_panel_settings_outlined),
    label: 'Admin',
  ),
];
