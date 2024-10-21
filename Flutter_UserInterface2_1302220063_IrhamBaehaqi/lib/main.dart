import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '1302220063_IrhamBaehaqi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '1302220063_IrhamBaehaqi'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0; 
  late PageController _pageController; 

  @override
  void initState() {
    super.initState();
    _pageController = PageController(); 
  }

  final List<Widget> pages = [ 
    const SafeArea(
      child: Card(
        shadowColor: Colors.transparent,
        margin: EdgeInsets.all(8.0),
        child: SizedBox.expand(
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Home Page',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      ),
    ),
    const SafeArea(
      child: Card(
        shadowColor: Colors.transparent,
        margin: EdgeInsets.all(8.0),
        child: SizedBox.expand(
          child: Center(
            child: Text(
              'Email Page',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      ),
    ),
    const SafeArea(
      child: Card(
        shadowColor: Colors.transparent,
        margin: EdgeInsets.all(8.0),
        child: SizedBox.expand(
          child: Center(
            child: Text(
              'Profile Page',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      ),
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index; 
            _pageController.jumpToPage(index);
          });
        },
        indicatorColor: Colors.blue,
        backgroundColor: Colors.amber, 
        selectedIndex: currentPageIndex, 
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.email),
            icon: Icon(Icons.email_outlined),
            label: 'Email',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outline),
            label: 'Profile', 
          ),
        ],
      ),
      body: PageView(
        controller: _pageController, 
        onPageChanged: (int index) {
          setState(() {
            currentPageIndex = index; 
          });
        },
        children: pages,
      ),
    );
  }
}
