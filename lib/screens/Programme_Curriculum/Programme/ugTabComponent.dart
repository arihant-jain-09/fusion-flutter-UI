import 'package:flutter/material.dart';

class ugTabComponent extends StatefulWidget {
  const ugTabComponent({Key? key}) : super(key: key);

  @override
  State<ugTabComponent> createState() => _ugTabComponentState();
}

class _ugTabComponentState extends State<ugTabComponent> {
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
                DataCell(new Text("B.Tech ME", style: new TextStyle(color: Colors.blueAccent, decoration: TextDecoration.underline),)),
                DataCell(Text('Mechanical Engineering'))
              ],
          ),

          DataRow(
              cells: [
                DataCell(new Text('B.Design', style: new TextStyle(color: Colors.blueAccent, decoration: TextDecoration.underline))),
                DataCell(Text('Design'))
              ]),

          DataRow(
              cells: [
                DataCell(Text('B.Tech CSE', style: new TextStyle(color: Colors.blueAccent, decoration: TextDecoration.underline))),
                DataCell(Text('Computer Science and Engineering'))
              ]),

          DataRow(
              cells: [
                DataCell(Text('B.Tech ECE', style: new TextStyle(color: Colors.blueAccent, decoration: TextDecoration.underline))),
                DataCell(Text('Electronics and Communication Engineering'))
              ]),

          DataRow(
              cells: [
                DataCell(Text('B.Tech SM', style: new TextStyle(color: Colors.blueAccent, decoration: TextDecoration.underline))),
                DataCell(Text('Smart Manufacturing'))
              ]),



        ],
      ),
    );
  }
}
