import 'package:flutter/material.dart';
import '../ui-widgets/widgets.dart';

/*
There are two ways to create a TabController, We can either use the controller: parameter of the 
TabBar widget or we can make use of 
DefaultTabController which contains almost all required functionalities to use a Tab.

The only constraint with DefaultTabController is that we need to wrap the complete Scaffold 
widget inside it because it will not work as a parameter of TabBar widget


*/

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new DefaultTabController(
      length: 2,
      child: Scaffold(

        drawer: new DrawerOnly(),   // New Line

        appBar: new AppBar(
          title: new Text("Multi Page Application Page-1"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.android)),
              Tab(icon: Icon(Icons.cloud_download)),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Android tab selected:',
                  ),
                  Checkbox(
                      value: false,
                      onChanged: (bool newValue) {
                        /*
            telling the flutter to push a new route onto the current stack 
            and new route tell which particular page to load with this route
            */
                        Navigator.push(
                          ctxt,
                          new MaterialPageRoute(
                              builder: (ctxt) => new SecondScreen()),
                        );
                      }),
                ],
              ),
            ),
            Text("Cloud Tab selected"),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(

      drawer: new DrawerOnly(),   // New Line
      
      appBar: new AppBar(
        title: new Text("Multi Page Application Page-2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'This page demos navigation and tabs:',
            ),
            Checkbox(
                value: false,
                onChanged: (bool newValue) {
                  /*
            telling the flutter to push a new route onto the current stack 
            and new route tell which particular page to load with this route
            */
                  Navigator.push(
                    ctxt,
                    new MaterialPageRoute(
                        builder: (ctxt) => new FirstScreen()),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
