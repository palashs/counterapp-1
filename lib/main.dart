import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:counterapp/Pages/counter1.dart';
import 'package:counterapp/Pages/counter2.dart';
import 'package:counterapp/Pages/counter3.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex;
  List<Widget> pages;
  List<int> counts;
  Widget currentPage;
  PageStorageBucket bucket;
  @override
  void initState() {
    counts = [0, 0, 0];
    _currentIndex = 0;
    bucket = PageStorageBucket();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pages = [
      counter1(_currentIndex + 1, counts[_currentIndex], () {
        setState(() {
          ++counts[_currentIndex];
        });
      }),
      counter2(_currentIndex + 1, counts[_currentIndex], () {
        setState(() {
          ++counts[_currentIndex];
        });
      }),
      counter3(_currentIndex + 1, counts[_currentIndex], () {
        setState(() {
          ++counts[_currentIndex];
        });
      }),
    ];
    return Scaffold(
      appBar: AppBar(title: Text("Counter App")),
      body: Center(
        child: PageStorage(
          child: pages[_currentIndex],
          bucket: bucket,
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (int index) async {
          setState(() {
            _currentIndex = index;
          });
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Counter 1'),
            activeColor: Colors.red,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Counter 2'),
            activeColor: Colors.purpleAccent,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text(
              'Counter 3',
            ),
            activeColor: Colors.pink,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
