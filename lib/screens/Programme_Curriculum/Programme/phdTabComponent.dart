import 'package:flutter/material.dart';

class phdTabComponent extends StatefulWidget {
  const phdTabComponent({Key? key}) : super(key: key);

  @override
  State<phdTabComponent> createState() => _phdTabComponentState();
}

class _phdTabComponentState extends State<phdTabComponent> {
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
              DataCell(new Text("Phd in CSE", style: new TextStyle(color: Colors.blueAccent, decoration: TextDecoration.underline),)),
              DataCell(Text('Computer Science and Engineering'))
            ],
          ),

          DataRow(
              cells: [
                DataCell(new Text('Phd in ECE', style: new TextStyle(color: Colors.blueAccent, decoration: TextDecoration.underline))),
                DataCell(Text('Electronics and Communication Engineering'))
              ]),

          DataRow(
              cells: [
                DataCell(Text('Phd in ME', style: new TextStyle(color: Colors.blueAccent, decoration: TextDecoration.underline))),
                DataCell(Text('Mechanical Engineering'))
              ]),

          DataRow(
              cells: [
                DataCell(Text('PhD in Physics', style: new TextStyle(color: Colors.blueAccent, decoration: TextDecoration.underline))),
                DataCell(Text('Natural Sciences-Physics'))
              ]),

          DataRow(
              cells: [
                DataCell(Text('PhD in Maths', style: new TextStyle(color: Colors.blueAccent, decoration: TextDecoration.underline))),
                DataCell(Text('Natural Sciences-Mathematics'))
              ]),

          DataRow(
              cells: [
                DataCell(Text('PhD in English', style: new TextStyle(color: Colors.blueAccent, decoration: TextDecoration.underline))),
                DataCell(Text('Humanities - English'))
              ]),

          DataRow(
              cells: [
                DataCell(Text('PhD in Design', style: new TextStyle(color: Colors.blueAccent, decoration: TextDecoration.underline))),
                DataCell(Text('Design'))
              ]),




        ],
      ),
    );
  }
}
