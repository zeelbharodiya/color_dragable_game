



import 'package:flutter/material.dart';

// List color = [
//   {
//     'data' : 'RED',
//     'text' : 'RED',
//     'color' : Colors.red,
//     'colorbox' : Colors.blue,
//   },
//   {
//     'data' : 'GREEN',
//     'text' : 'GREEN',
//     'color' : Colors.green,
//     'colorbox' : Colors.red,
//   },
//   {
//     'data' : 'ORANGE',
//     'text' : 'ORANGE',
//     'color' : Colors.orange,
//     'colorbox' : Colors.purple,
//   },
//   {
//     'data' : 'BLUE',
//     'text' : 'BLUE',
//     'color' : Colors.blue,
//     'colorbox' : Colors.green,
//   },
//   {
//     'data' : 'PURPLE',
//     'text' : 'PURPLE',
//     'color' : Colors.purple,
//     'colorbox' : Colors.orange,
//   },
// ];


// List <Map<String , dynamic>> color1 = [
//   {'c' : Colors.blue},
//   {'c' :Colors.red},
//   {'c' :Colors.purple},
//   {'c' :Colors.green},
//   {'c' :Colors.orange},
// ];

class allData {
  final String name;
  final String value;
  final Color color;
  bool accepting;


  allData({required this.name, required this.value, required this.color, this.accepting= false});}


//
// class ItemModel {
//   final String name;
//   final String value;
//   final IconData icon;
//   bool accepting;
//
//
//   ItemModel({required this.name, required this.value, required this.icon, this.accepting= false});}