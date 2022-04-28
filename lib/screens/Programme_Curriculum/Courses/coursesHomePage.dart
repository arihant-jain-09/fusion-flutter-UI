import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../Components/side_drawer.dart';
import '../Programme/tabComponent.dart';

class coursesHomePage extends StatefulWidget {
  const coursesHomePage({Key? key}) : super(key: key);

  @override
  State<coursesHomePage> createState() => _coursesHomePageState();
}

class _coursesHomePageState extends State<coursesHomePage> {

    List<List<dynamic>> _courseData = [];

    void _loadCSV() async
    {
      final _courses = await rootBundle.loadString("db/courses.csv");

      List<List<dynamic>> _list =  const CsvToListConverter().convert(_courses);

      setState(() {
        _courseData = _list;
      });
    }

    @override
    void initState() {
      // TODO: implement initState
      _loadCSV();
    }

    @override
    Widget build(BuildContext context)
    {
      final _data = {
        "table": <String, dynamic>{
          "columns": _courseData[0],
          "rows": _courseData.skip(1).map((e) => e)
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
                      'UG: Under Graduate',
                    ),
                  ),
                ),

              ],
            ),
          ),
          drawer: SideDrawer(),
          body: TabBarView(
            children: [
              TabComponent(data: _data),
            ],
          ),
        ),
      );
    }





}
