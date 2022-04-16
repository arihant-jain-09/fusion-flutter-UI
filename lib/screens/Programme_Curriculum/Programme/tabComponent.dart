import 'package:flutter/material.dart';

class TabComponent extends StatefulWidget {
  final data;
  const TabComponent({Key? key, this.data}) : super(key: key);

  @override
  _TabComponentState createState() => _TabComponentState();
}

class _TabComponentState extends State<TabComponent> {
  @override
  Widget build(BuildContext context) {
    Map? table = widget.data?['table'];
    String? column1 = table?['column1'];
    String? column2 = table?['column2'];
    Object? rows = table?['rows'];
    print(rows);
    // rows.forEach(
    //   (element) => {
    //     print(element.toList()),
    //   },
    // );
    return Container(
      child: Column(
        children: [
          SizedBox(height: 20),
          Text('test'),
          Expanded(
            child: Center(
              child: Text(
                "Component to be reused",
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// List<DataRow> complaintList() {
//   //Get the list of json and map through, to select each json and lay row to the table..
//   return rows
//       .map(
//         ((element) => DataRow(
//               cells: <DataCell>[
//                 DataCell(Container(
//                     width: 40, //SET width
//                     child: Text(element[
//                         "Month"]!))), //Extracting from Map element the value
//                 DataCell(Container(
//                     width: 50, //SET width
//                     child: Text(
//                       element["Year"]!,
//                     ))),
//                 DataCell(Container(
//                     width: 57, //SET width
//                     child: Text(element["Amount"]!))),
//                 DataCell(Container(
//                     width: 57, //SET width
//                     child: Text(element["Description"]!))),
//                 DataCell(Container(
//                     width: 57, //SET width
//                     child: Text(element["Rebate count"]!))),
//                 DataCell(Container(
//                     width: 57, //SET width
//                     child: Text(element["Rebate Amount"]!))),
//                 DataCell(Container(
//                     width: 57, //SET width
//                     child: Text(element["Total Bill"]!))),
//               ],
//             )),
//       )
//       .toList();
// }
