import 'package:flutter/material.dart';

Widget counter2(int index, int count, Function onTap) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text("Counter $index"),
      SizedBox(height: 20),
      Text("Count $count"),
      SizedBox(height: 20),
      InkWell(onTap: onTap, child: Text("Increment me!")),
    ],
  );
}
