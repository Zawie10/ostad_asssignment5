import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tab View App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabViewScreen(),
    );
  }
}

class TabViewScreen extends StatefulWidget {
  @override
  _TabViewScreenState createState() => _TabViewScreenState();
}

class _TabViewScreenState extends State<TabViewScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab View App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Page 1'),
              onTap: () {
                _tabController.animateTo(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Page 2'),
              onTap: () {
                _tabController.animateTo(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Page 3'),
              onTap: () {
                _tabController.animateTo(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(child: Text('Page 1', style: TextStyle(fontSize: 24))),
          Center(child: Text('Page 2', style: TextStyle(fontSize: 24))),
          Center(child: Text('Page 3', style: TextStyle(fontSize: 24))),
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: _tabController,
        tabs: [
          Tab(icon: Icon(Icons.home), text: 'Page 1'),
          Tab(icon: Icon(Icons.favorite), text: 'Page 2'),
          Tab(icon: Icon(Icons.settings), text: 'Page 3'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          int currentPageIndex = _tabController.index + 1;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Floating Action Button pressed on Page $currentPageIndex'),
          ));
        },
        child: Icon(Icons.add),
        backgroundColor: _getFloatingActionButtonColor(),
      ),
    );
  }

  Color _getFloatingActionButtonColor() {
    switch (_tabController.index) {
      case 0:
        return Colors.red;
      case 1:
        return Colors.green;
      case 2:
        return Colors.blue;
      default:
        return Colors.blue;
    }
  }
}
