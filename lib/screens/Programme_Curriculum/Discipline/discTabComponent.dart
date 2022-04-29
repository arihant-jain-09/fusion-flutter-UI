import 'package:flutter/material.dart';

class DiscTabComponent extends StatefulWidget {
  final data;
  const DiscTabComponent({Key? key, this.data}) : super(key: key);

  @override
  _DiscTabComponentState createState() => _DiscTabComponentState();
}

class _DiscTabComponentState extends State<DiscTabComponent> {
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
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: DataTable(
              // headingRowColor:
              //     MaterialStateColor.resolveWith((states) => Colors.blue),
              dataRowHeight: 80.0,
              columnSpacing: 25.0,
              columns: tabColumnList(),
              rows: tabRowList(),
              // rows: [],
            ),
          )),
    );
  }

  List<DataColumn> tabColumnList() {
    //Get the list of json and map through, to select each json and lay row to the table..

    List<DataColumn> data = [];
    data = columns
        .map(
          (el) {
            return DataColumn(
                label: Text(el.toString().toUpperCase(),
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
                          // Navigator.pushNamed(context,
                          //     '/programme_curriculum_home/programme_info',
                          //     arguments: {'e': e})
                        },
                        child: Container(
                            //SET width
                            constraints: BoxConstraints(maxWidth: 180),
                            child: Text(e.toString())),
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
