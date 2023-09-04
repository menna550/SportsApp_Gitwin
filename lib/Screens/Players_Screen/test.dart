import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text('App Bar'),
              floating: true,
              pinned: true,
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 100,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    'Fixed Container',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Item $index'),
                  );
                },
                childCount: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
