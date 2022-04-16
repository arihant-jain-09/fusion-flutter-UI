import 'package:flutter/material.dart';
// import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/Programme_Curriculum/Programme/tabComponent.dart';
// import 'package:fusion/models/academic.dart';

class Programme extends StatefulWidget {
  @override
  _ProgrammeState createState() => _ProgrammeState();
}

class _ProgrammeState extends State<Programme> {
  final data1 = {
    "table": {
      "column1": "Programmes",
      "column2": "Discipline",
      "rows": [
        {"B.Tech ME", "Mechanical Engineering"},
        {"B.Design", "Design"},
        {"B.Tech CSE", "Computer Science and Engineering"},
        {"B.Tech ECE", "Electronics and Communication Engineering"},
        {"B.Tech SM", "Smart Manufacturing"},
      ]
    }
  };
  final data2 = {
    "table": {
      "column1": "Programmes",
      "column2": "Discipline",
      "rows": [
        {"M.Tech CSE", "Computer Science and Engineering"},
        {"M.Tech ECE", "Electronics and Communication Engineering"},
        {"M.Tech ME", "Mechanical Engineering"},
        {"M.Tech Mechatronics", "Mechatronics"},
        {"M.Des Design", "Design"},
      ]
    }
  };
  final data3 = {
    "table": {
      "column1": "Programmes",
      "column2": "Discipline",
      "rows": [
        {"Phd in CSE", "Computer Science and Engineering"},
        {"Phd in ECE", "Electronics and Communication Engineering"},
        {"Phd in ME", "Mechanical Engineering"},
        {"Phd in Physics", "Natural Sciences-Physics"},
        {"Phd in Maths", "Natural Sciences-Mathematics"},
      ]
    }
  };
  @override
  Widget build(BuildContext context) {
    // final AcademicData data =
    //     ModalRoute.of(context)?.settings.arguments as AcademicData;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "FUSION",
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.notifications),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.more_vert),
            ),
          ],
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            indicatorWeight: 6.0,
            tabs: [
              Tab(
                child: Container(
                  child: Text(
                    'UG: Under Graduate',
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Text(
                    'PG: Post Graduate',
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Text(
                    'PHD:Doctor of Philosopy',
                  ),
                ),
              ),
            ],
          ),
        ),
        drawer: SideDrawer(),
        body: TabBarView(
          children: [
            TabComponent(data: data1),
            TabComponent(data: data2),
            TabComponent(data: data3)
          ],
        ),
      ),
    );
  }
}
