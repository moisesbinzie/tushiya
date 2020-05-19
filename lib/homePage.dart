import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Text('''
          
          Step by Step Guide Course
          '''),

          GridView.count(
            //crossAxisSpacing: 5,
            // mainAxisSpacing: 50,
            // childAspectRatio: 2.5 / 3,
            // scrollDirection: Axis.horizontal,
            crossAxisCount: 3,
            physics: ScrollPhysics(), // to disable GridView's scrolling
            shrinkWrap: true,
            children: <Widget>[
              Courses(
                courseName: 'Hatchery',
                courseImage: 'assets/hatch250.png',
                coursePath: '/hatchery',
              ),
              Courses(
                courseName: 'Broilers',
                courseImage: 'assets/broiler.png',
                coursePath: '/broiler',
              ),
              Courses(
                courseName: 'Quials',
                courseImage: 'assets/quail.png',
                coursePath: '/quail',
              ),
              Courses(
                courseName: 'Layers',
                courseImage: 'assets/eggs.png',
                coursePath: '/layers',
              ),
              Courses(
                courseName: 'Mikolongwe',
                courseImage: 'assets/mikolongwe.png',
                coursePath: '/mikolongwe',
              ),
              Courses(
                courseName: 'Turkey',
                courseImage: 'assets/turkey.png',
                coursePath: '/turkey',
              ),
            ],
          ),

          //Broiler(),
          //   Container(child: Step(title: Text('haha'), content: Text('haha'))),
        ],
      ),
    );
  }
}

class Courses extends StatelessWidget {
  final courseName;
  final coursePath;
  final courseImage;

  Courses({
    this.courseName,
    this.coursePath,
    this.courseImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.225,
            height: MediaQuery.of(context).size.width * 0.225,
            // height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: Colors.teal,
                  //color: Colors.black.withOpacity(0.2),
                  style: BorderStyle.solid,
                  width: 2),
            ),
            child: Image.asset(courseImage),
          ),
          onTap: () {
            Navigator.pushNamed(context, coursePath);
          },
        ),
        Text(
          courseName,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
