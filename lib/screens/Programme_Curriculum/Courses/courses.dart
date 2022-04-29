import 'package:flutter/material.dart';
// import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'courseTabComponent.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:csv/csv.dart';

class Courses extends StatefulWidget {
  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  List<List<dynamic>> _courseList = [];

  void _loadCSV() async {
    final _courseData = await rootBundle.loadString('db/courses.csv');
    List<List<dynamic>> _list = const CsvToListConverter().convert(_courseData);

    setState(() {
      _courseList = _list;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _loadCSV();
  }

  @override
  Widget build(BuildContext context) {
    final data_Courses = {
      "table": <String, dynamic>{
        "columns": _courseList[0],
        "rows": _courseList.skip(1).map((e) => e)
      }
    };
    return DefaultTabController(
        length: 1,
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
                      'Courses',
                    ),
                  ),
                ),
              ],
            ),
          ),
          drawer: SideDrawer(),
          body: TabBarView(
            children: [
              CourseTabComponent(data: data_Courses),
            ],
          ),
        ));
  }
}
