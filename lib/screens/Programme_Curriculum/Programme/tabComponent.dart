import 'package:flutter/material.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    table = widget.data?['table'];
    column1 = table?['column1'];
    column2 = table?['column2'];
    rows = table?['rows'];
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
          columnSpacing: 10.0,
          columns: [
            //DataColumns to lay columns of the table
            DataColumn(
                label: Text('Month',
                    style:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Year',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
          ],
          //This method will get lay all the rows
          rows: tabRowList(),
          // rows: [],
        ),
      ),
    );
  }

  List<DataRow> tabRowList() {
    //Get the list of json and map through, to select each json and lay row to the table..

    List<DataRow> data = [];
    data = rows
        .map(
          (el) {
            print(el);
            return DataRow(
              cells: el
                  .map((e) => DataCell(Container(
                      width: 40, //SET width
                      child: Text(e))))
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
