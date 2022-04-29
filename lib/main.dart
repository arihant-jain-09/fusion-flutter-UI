import 'package:flutter/material.dart';
import 'package:fusion/screens/Programme_Curriculum/Curriculums/curriculums.dart';
import 'package:fusion/screens/Programme_Curriculum/Programme_Info/programme_info.dart';
import 'dart:async';
import 'package:fusion/screens/landing_page.dart';
//Academic
import 'package:fusion/screens/NewAcademic/academic_home_page.dart';
//Programme
import 'package:fusion/screens/Programme_Curriculum/programme_curriculum_home.dart';
import 'package:fusion/screens/Programme_Curriculum/Programme/programme_home_page.dart';
import 'package:fusion/screens/Programme_Curriculum/Discipline/discipline.dart';
import 'package:fusion/screens/Programme_Curriculum/Batches/batches.dart';
import 'package:fusion/screens/Programme_Curriculum/Courses/courses.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // setupLocator();
  //runApp(MyApp());
  runZonedGuarded(() {
    runApp(MyApp());
  }, (Object error, StackTrace stack) {
    print("---caught error in zoned---\n");
    print(error);
    print(stack);
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fusion',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey, fontFamily: 'Nunito'),
      initialRoute: '/landing',
      routes: {
        '/landing': (context) => LandingPage(),
        '/academic_home_page': (context) => AcademicHomePage(),
        '/programme_curriculum_home': (context) => ProgrammeCurriculumHome(),
        '/programme_curriculum_home/programme': (context) => Programme(),
        '/programme_curriculum_home/batches': (context) => Batches(),
        '/programme_curriculum_home/discipline': (context) => Discipline(),
        '/programme_curriculum_home/curriculum': (context) => Curriculum(),
        '/programme_curriculum_home/programme_info': (context) =>
            ProgrammeInfo(),
        '/programme_curriculum_home/courses': (context) => Courses(),
      },
    );
  }
}
