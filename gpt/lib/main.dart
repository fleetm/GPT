import 'package:flutter/material.dart';
import 'package:gpt/features/Home-GPT/home_view.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomeView(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    ),
  );
}
