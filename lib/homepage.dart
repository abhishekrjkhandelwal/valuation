import 'package:flutter/material.dart';
//import 'package:imovalue/services/crud.dart';
//import 'dart:async';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:imovaluer/ValuationList/list.dart';
import 'package:imovaluer/login/loginpage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  final List<List<double>> charts =
  [
    [0.0, 0.3, 0.7, 0.6, 0.55, 0.8, 1.2, 1.3, 1.35, 0.9, 1.5, 1.7, 1.8, 1.7, 1.2, 0.8, 1.9, 2.0, 2.2, 1.9, 2.2, 2.1, 2.0, 2.3, 2.4, 2.45, 2.6, 3.6, 2.6, 2.7, 2.9, 2.8, 3.4],
    [0.0, 0.3, 0.7, 0.6, 0.55, 0.8, 1.2, 1.3, 1.35, 0.9, 1.5, 1.7, 1.8, 1.7, 1.2, 0.8, 1.9, 2.0, 2.2, 1.9, 2.2, 2.1, 2.0, 2.3, 2.4, 2.45, 2.6, 3.6, 2.6, 2.7, 2.9, 2.8, 3.4, 0.0, 0.3, 0.7, 0.6, 0.55, 0.8, 1.2, 1.3, 1.35, 0.9, 1.5, 1.7, 1.8, 1.7, 1.2, 0.8, 1.9, 2.0, 2.2, 1.9, 2.2, 2.1, 2.0, 2.3, 2.4, 2.45, 2.6, 3.6, 2.6, 2.7, 2.9, 2.8, 3.4,],
    [0.0, 0.3, 0.7, 0.6, 0.55, 0.8, 1.2, 1.3, 1.35, 0.9, 1.5, 1.7, 1.8, 1.7, 1.2, 0.8, 1.9, 2.0, 2.2, 1.9, 2.2, 2.1, 2.0, 2.3, 2.4, 2.45, 2.6, 3.6, 2.6, 2.7, 2.9, 2.8, 3.4, 0.0, 0.3, 0.7, 0.6, 0.55, 0.8, 1.2, 1.3, 1.35, 0.9, 1.5, 1.7, 1.8, 1.7, 1.2, 0.8, 1.9, 2.0, 2.2, 1.9, 2.2, 2.1, 2.0, 2.3, 2.4, 2.45, 2.6, 3.6, 2.6, 2.7, 2.9, 2.8, 3.4, 0.0, 0.3, 0.7, 0.6, 0.55, 0.8, 1.2, 1.3, 1.35, 0.9, 1.5, 1.7, 1.8, 1.7, 1.2, 0.8, 1.9, 2.0, 2.2, 1.9, 2.2, 2.1, 2.0, 2.3, 2.4, 2.45, 2.6, 3.6, 2.6, 2.7, 2.9, 2.8, 3.4]
  ];

  static final List<String> chartDropdownItems = [ 'Last 7 days', 'Last month', 'Last year' ];


  String actualDropdown = chartDropdownItems[0];
  int actualChart = 0;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar
          (
          elevation: 4.0,
          backgroundColor: Colors.white,
          title: Text('Dashboard', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20.0)),
          actions: <Widget>
          [
            Container
              (
              margin: EdgeInsets.only(right: 8.0),
              child: Row
                (
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>
                [
                  new OutlineButton(
                    borderSide: BorderSide(
                    color: Colors.blue, style: BorderStyle.solid, width: 3.0),
                    child: Text('Logout',),
                    onPressed: () {
                      FirebaseAuth.instance.signOut().then((value) {
                      Navigator.of(context).pushReplacementNamed('/landingpage');

                      }).catchError((e) {
                        print(e);
                      });


                      },
                  ),
                ],
              ),
            )
          ],
        ),
        body: StaggeredGridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          children: <Widget>[
            _buildTile(
              Padding
                (
                padding: const EdgeInsets.all(12.0),
                child: Row
                  (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>
                    [
                Container(
                width: 50,
                    height: 100,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                                "https://i.imgur.com/BoN9kdC.png")
                        )
                    ),
                ),
                 Text(
                   'Test User_name',
                 ),
               ]
                ),
              ),
            ),


            _buildTile(
              Padding
                (
                  padding: const EdgeInsets.all(12.0),
                  child: Column
                    (
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>
                    [
                      Row
                        (
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>
                        [
                          Column
                            (
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>
                            [
                              Text('Performance', style: TextStyle(color: Colors.green)),
                            ],
                          ),
                          DropdownButton
                            (
                              isDense: true,
                              value: actualDropdown,
                              onChanged: (String value) => setState(()
                              {
                                actualDropdown = value;
                                actualChart = chartDropdownItems.indexOf(value); // Refresh the chart
                              }),
                              items: chartDropdownItems.map((String title)
                              {
                                return DropdownMenuItem
                                  (
                                  value: title,
                                  child: Text(title, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w400, fontSize: 14.0)),
                                );
                              }).toList()
                          )
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 4.0)),
                      Sparkline
                        (
                        data: charts[actualChart],
                        lineWidth: 5.0,
                        lineColor: Colors.greenAccent,
                      )
                    ],
                  )
              ),
            ),
            _buildTile(
              Padding
                (
                padding: const EdgeInsets.all(24.0),
                child: Row
                  (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>
                    [
                      Column
                        (
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>
                        [
                          Text('2/3', style: TextStyle(color: Colors.redAccent)),
                        ],
                      ),
                      Column
                        (
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>
                        [
                          Text('100/100', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20.0)),
                        ],
                      ),
                      Column
                        (
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>
                        [
                          Text('Working Days', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20.0))
                        ],
                      ),
                    ]
                ),
              ),
            ),
             _buildTile(
               Padding(
                   padding: const EdgeInsets.all(8.0),
                      child: Column
                        (
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: <Widget>
                           [
                              Padding(padding: EdgeInsets.only(bottom: 8.0)),
                              Text('', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 24.0)),
                              Text('', style: TextStyle(color: Colors.black45)),
                           ]
                         ),
                        ),
                       ),
                 _buildTile(
                   Padding
                      (
                        padding: const EdgeInsets.all(8.0),
                        child: Column
                        (
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>
                          [
                           Padding(padding: EdgeInsets.only(bottom: 8.0)),
                           Text('', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 24.0)),
                           Text('', style: TextStyle(color: Colors.black45)),
                          ]
                         ),
                        ),
                       ),
                      ],
          staggeredTiles: [
            StaggeredTile.extent(2, 60.0),
            StaggeredTile.extent(2, 220.0),
            StaggeredTile.extent(2, 110.0),
            StaggeredTile.extent(1, 180.0),
            StaggeredTile.extent(1, 180.0),
          ],
        )
    );
  }

  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
        elevation: 14.0,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Color(0x802196F3),
        child: InkWell
          (
          // Do onTap() if it isn't null, otherwise do print()
            onTap: onTap != null ? () => onTap() : () { print('Not set yet'); },
            child: child
        )
    );
  }

}
