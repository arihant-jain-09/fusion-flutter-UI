import 'package:flutter/material.dart';
// import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'discTabComponent.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:csv/csv.dart';

class Discipline extends StatefulWidget {
  @override
  State<Discipline> createState() => _DisciplineState();
}

class _DisciplineState extends State<Discipline> {
  List<List<dynamic>> _disciplineList = [];
  void _loadCSV() async {
    final _disciplineProg = await rootBundle.loadString("db/Disciplines.csv");
    List<List<dynamic>> _list =
        const CsvToListConverter().convert(_disciplineProg);

    // final data = {
    //         "table": <String, dynamic>{
    //           [data[0]]:List<String>[]
    //         }
    //       };

    // vector<string> temp;
    // map<string, vector<string>> mp;
    // for(int i=0; i<list.size(); i++)
    // {
    //     if(mp.find(list[i][0]) == mp.end())
    //       {
    //         mp[list[i][0]] = temp;
    //         mp[list[i][0]].push_back(list[i][1]);
    //       }
    //     else mp[list[i][0]].push_back(list[i][1]);
    // }
    // vector<string> list_for_column;
    // first coulmn -
    // for( auto it: mp)
    // {
    //   list_for_column.push_back(it.first);
    // }
    // CSE;
    // ME;
    // ECE;

    setState(() {
      _disciplineList = _list;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _loadCSV();
  }

  @override
  Widget build(BuildContext context) {
    final data_Discipline = {
      "table": <String, dynamic>{
        "columns": _disciplineList[0],
        "rows": _disciplineList.skip(1).map((e) => e)
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
                    'Disciplines',
                  ),
                ),
              ),
            ],
          ),
        ),
        drawer: SideDrawer(),
        body: TabBarView(
          children: [
            DiscTabComponent(data: data_Discipline),
          ],
        ),
      ),
    );
  }
}
