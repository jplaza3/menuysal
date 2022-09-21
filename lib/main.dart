import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menuysal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AppScaffold()
    );
  }
}

class AppScaffold extends StatefulWidget {
  const AppScaffold({Key? key}) : super(key: key);

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  final _tabs = {
    0: { 'widget': const BottomNavigationBarItem(icon: Icon(Icons.schedule), label: 'Planificador'), 'title': 'Planificador'},
    1: { 'widget': const BottomNavigationBarItem(icon: Icon(Icons.today), label: 'Hoy'), 'title': 'Hoy' },
    2: { 'widget': const BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Menú'), 'title': 'Menú'},
  };
  var _selectedTab = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(_tabs[_selectedTab]!['title'] as String),
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _tabs.values.map((e) => e['widget'] as BottomNavigationBarItem).toList(),
        currentIndex: _selectedTab,
        onTap: (selected) => setState(() {
          _selectedTab = selected;
        }),
      ),
    );
  }
}

