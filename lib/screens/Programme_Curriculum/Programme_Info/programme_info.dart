import 'package:flutter/material.dart';
// import 'package:fusion/Components/appBar.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:fusion/Components/side_drawer.dart';
// import 'package:fusion/models/academic.dart';
import 'package:csv/csv.dart';
import 'package:fusion/screens/Programme_Curriculum/Programme/tabComponent.dart';

class ProgrammeInfo extends StatefulWidget {
  @override
  _ProgrammeInfoState createState() => _ProgrammeInfoState();
}

class _ProgrammeInfoState extends State<ProgrammeInfo> {
  List<List<dynamic>> _ugProgrammes = [];
  void _loadCSV() async {
    final _underGraduate = await rootBundle.loadString("db/UG_programmes.csv");
    List<List<dynamic>> _listUG =
        const CsvToListConverter().convert(_underGraduate);
    _ugProgrammes = _listUG;
  }

  @override
  void initState() {
    // TODO: implement initState
    _loadCSV();
  }

  @override
  Widget build(BuildContext context) {
    // final AcademicData data =
    //     ModalRoute.of(context)?.settings.arguments as AcademicData;
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    var dat = _ugProgrammes.skip(1).map((e) => e.skip(1).take(1).toList());

    // final data_UGProgrammes = {
    //   "table": <String, dynamic>{
    //     "columns": _ugProgrammes[0],
    //     "rows": _ugProgrammes.skip(1).map((e) => e)
    //   }
    // };
    // final data_PG = {
    //   "table": <String, dynamic>{
    //     "columns": _pg[0],
    //     "rows": _pg.skip(1).map((e) => e)
    //   }
    // };
    // final data_PHD = {
    //   "table": <String, dynamic>{
    //     "columns": _phd[0],
    //     "rows": _phd.skip(1).map((e) => e)
    //   }
    // };
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
            TabComponent(data: ''),
            TabComponent(data: ''),
            TabComponent(data: '')
          ],
        ),
      ),
    );
  }
}
