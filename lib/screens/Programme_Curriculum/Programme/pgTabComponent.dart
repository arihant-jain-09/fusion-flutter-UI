import 'package:flutter/material.dart';

class pgTabComponent extends StatefulWidget {
  const pgTabComponent({Key? key}) : super(key: key);

  @override
  State<pgTabComponent> createState() => _pgTabComponentState();
}

class _pgTabComponentState extends State<pgTabComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DataTable(
        headingRowColor:
        MaterialStateColor.resolveWith((states) => Colors.grey),
        columns: [
          DataColumn(label: Text('Programmes')),
          DataColumn(label: Text('Discipline')),
        ],
        rows: [
          DataRow(
            cells: [
              DataCell(new Text("M.Tech CSE", style: new TextStyle(color: Colors.blueAccent, decoration: TextDecoration.underline),)),
              DataCell(Text('Computer Science and Engineering'))
            ],
          ),

          DataRow(
              cells: [
                DataCell(new Text('M.Tech ECE', style: new TextStyle(color: Colors.blueAccent, decoration: TextDecoration.underline))),
                DataCell(Text('Electronics and Communication Engineering'))
              ]),

          DataRow(
              cells: [
                DataCell(Text('M.Tech ME', style: new TextStyle(color: Colors.blueAccent, decoration: TextDecoration.underline))),
                DataCell(Text('Mechanical Engineering'))
              ]),

          DataRow(
              cells: [
                DataCell(Text('M. Tech Mechatronics', style: new TextStyle(color: Colors.blueAccent, decoration: TextDecoration.underline))),
                DataCell(Text('Mechatronics'))
              ]),

          DataRow(
              cells: [
                DataCell(Text('M.Des Design', style: new TextStyle(color: Colors.blueAccent, decoration: TextDecoration.underline))),
                DataCell(Text('Design'))
              ]),

          DataRow(
              cells: [
                DataCell(Text('M.Tech SM', style: new TextStyle(color: Colors.blueAccent, decoration: TextDecoration.underline))),
                DataCell(Text('Smart Manufacturing'))
              ]),



        ],
      ),
    );
  }
}
