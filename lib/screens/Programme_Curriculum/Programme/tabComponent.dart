import 'package:flutter/material.dart';
import 'package:fusion/screens/Programme_Curriculum/Programme_Info/programme_info.dart';

class TabComponent extends StatefulWidget {
  final data;
  const TabComponent({Key? key, this.data}) : super(key: key);

  @override
  _TabComponentState createState() => _TabComponentState();
}

class _TabComponentState extends State<TabComponent> {
  late Map? table;
  late String? column1;
  late String? column2;
  var rows;
  var columns;

  @override
  void initState() {
    super.initState();
    table = widget.data?['table'];
    rows = table?['rows'];
    columns = table?['columns'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        //Component to lay table on the page
        child: DataTable(
          // headingRowColor:
          //     MaterialStateColor.resolveWith((states) => Colors.blue),
          dataRowHeight: 80.0,
          columnSpacing: 25.0,
          columns: tabColumnList(),
          rows: tabRowList(),
          // rows: [],
        ),
      ),
    );
  }

  List<DataColumn> tabColumnList() {
    //Get the list of json and map through, to select each json and lay row to the table..

    List<DataColumn> data = [];
    data = columns
        .map(
          (el) {
            return DataColumn(
                label: Text(el,
                    style:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.bold)));
          },
        )
        .toList()
        .cast<DataColumn>();
    return data;
  }

  List<DataRow> tabRowList() {
    //Get the list of json and map through, to select each json and lay row to the table..
    List<DataRow> data = [];
    data = rows
        .map(
          (el) {
            return DataRow(
              cells: el
                  .map((e) => DataCell(GestureDetector(
                        onTap: () => {
                          Navigator.pushNamed(context,
                              '/programme_curriculum_home/programme_info',
                              arguments: {'e': e})
                        },
                        child: Container(
                            //SET width
                            child: Text(e != null ? '$e' : "Empty")),
                      )))
                  .toList()
                  .cast<DataCell>(),
            );
          },
        )
        .toList()
        .cast<DataRow>();
    return data;
  }
}
