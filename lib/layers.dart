import 'package:flutter/material.dart';
import 'package:tushiya/constants.dart';

import 'homePage.dart';

class Layers extends StatefulWidget {
  static const routeName = '/layers';

  @override
  _LayersState createState() => _LayersState();
}

class _LayersState extends State<Layers> {
  int _currentStep = 0;
  double progress = 100 / 8;
  double maxSlide = 100;

  // progressBar(int progress) {
  //   setState(() {
  //     progress += progress;
  //   });
  // }

  goTo(int step, double progressed) {
    setState(() {
      _currentStep += step;
      progress += progressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Row(
                children: <Widget>[
                  Courses(
                    courseName: 'Layers',
                    courseImage: 'assets/eggs.png',
                    // coursePath: '/quail',
                  ),
                  Slider(
                      activeColor: Colors.teal,
                      inactiveColor: Colors.brown,
                      min: 0,
                      max: maxSlide,
                      value: progress.toDouble(),
                      onChanged: (double newV) {}),
                  Text('${progress.toStringAsFixed(0)}%')
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  // Courses(
                  //   courseName: 'Broiler',
                  //   courseImage: 'assets/broiler.png',
                  //   coursePath: '/broiler',
                  // ),
                  // Courses(
                  //   courseName: 'Broiler',
                  //   courseImage: 'assets/broiler.png',
                  //   coursePath: '/broiler',
                  // ),
                  Expanded(
                    child: Stepper(
                      steps: mikolongweSteps(),
                      currentStep: this._currentStep,
                      onStepTapped: (step) {
                        setState(() {
                          this._currentStep = step;
                        });

                        switch (this._currentStep) {
                          case 0:
                            progress = 100 / 8;
                            break;
                          case 1:
                            progress = 100 / 8 * 2;
                            break;
                          case 2:
                            progress = 100 / 8 * 3;
                            break;
                          case 3:
                            progress = 100 / 8 * 4;
                            break;
                          case 4:
                            progress = 100 / 8 * 5;
                            break;
                          case 5:
                            progress = 100 / 8 * 6;
                            break;
                          case 6:
                            progress = 100 / 8 * 7;
                            break;
                          case 7:
                            progress = 100 / 8 * 8;
                            break;
                          default:
                        }
                      },
                      onStepContinue: () {
                        if (this._currentStep <
                            this.mikolongweSteps().length - 1) {
                          goTo(1, 100 / 8);
                          //  progressBar(10);

                        } else {
//TODO: Action here, open a dialogue box that says "take quiz or shop, or home"
                          print('completed stepping');
                        }
                      },
                      onStepCancel: () {
                        if (this._currentStep != 0) {
                          goTo(-1, -100 / 8);
                          // progressBar(-10);
                        } else if (this._currentStep == 0) {
                          Navigator.pop(context);
                        } else {
                          this._currentStep = 0;
                        }
                      },
                      controlsBuilder: (BuildContext context,
                          {VoidCallback onStepContinue,
                          VoidCallback onStepCancel}) {
                        return Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 60),
                              child: FlatButton(
                                onPressed: onStepContinue,
                                child: Text('Next'),
                                color: Colors.teal,
                              ),
                            ),
                            FlatButton(
                              onPressed: onStepCancel,
                              child: Text('Back'),
                              // color: Colors.teal,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Step> mikolongweSteps() {
    List<Step> _steps = [
      //? STEP ONE
      Step(
          title: Text('Housing'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Placeholder(
              //   fallbackHeight: 250,
              //   color: Colors.amber,
              // ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Batterycage System',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Placeholder(
                  color: Colors.amber,
                  fallbackHeight: MediaQuery.of(context).size.height * 1 / 5,
                ),
              ),

              // Container(
              //   margin: EdgeInsets.only(bottom: 8),
              //   width: MediaQuery.of(context).size.width,
              //   height: MediaQuery.of(context).size.height * 1 / 5,
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       fit: BoxFit.scaleDown,
              //       image: AssetImage('assets/sprayer.jpg'),
              //     ),
              //   ),
              // ),
              Text(
                '''A cage can hold 1-5 pullets and the recommended space is 50 x 40 cm x 45 cm high per pullet.
In this system pullets lay more eggs than any housing system.
The disadvantage being very expensive.
''',
                //  textAlign: TextAlign.left,
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Deep Litter System',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Placeholder(
                  color: Colors.amber,
                  fallbackHeight: MediaQuery.of(context).size.height * 1 / 5,
                ),
              ),

              // Container(
              //   margin: EdgeInsets.only(bottom: 8),
              //   width: MediaQuery.of(context).size.width,
              //   height: MediaQuery.of(context).size.height * 1 / 5,
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       fit: BoxFit.scaleDown,
              //       image: AssetImage('assets/sprayer.jpg'),
              //     ),
              //   ),
              // ),
              Text(
                '''In this system the whole floor is covered with litters.
Birds are free to move around.
It is cheap but it requires a lot of space compared to battery cage.
''',
                //  textAlign: TextAlign.left,
              ),
            ],
          ),
          isActive: _currentStep >= 0),
      //? STEP TWO
      Step(
          // subtitle: Text('data'),
          title: Text('Preparations before Chick Arrival'),
          content: Column(
            children: [
              // Placeholder(
              //   color: Colors.amber,
              //   fallbackHeight: 250,
              // ),
              Container(
                margin: EdgeInsets.only(bottom: 8),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1 / 5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/chickbrooder.jpg'),
                  ),
                ),
              ),
              Text(
                '''Clean the walls, ceilings, floors and equipment’s thoroughly with disinfectants.
Remove all old feed from troughs.
Disinfest the troughs and allow them to dry.
Set heating system at 35-37 degrees.
Litter materials should be about 2-4 inches deep.
''',
              ),
            ],
          ),
          isActive: _currentStep >= 1),

      //? STEP THREE
      Step(
          title: Text('Chick Management (0-8 weeks)'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Placeholder(
              //   color: Colors.amber,
              //   fallbackHeight: 250,
              // ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text('Cage Brooding',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 8),
                // width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1 / 5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/brooder.jpg'),
                  ),
                ),
              ),
              Text(
                '''In this system, the whole room is heated at a temperature of 25 to 35 degrees.
Under this system, heat requires to be checked and controlled regularly because chicks cannot find a comfort zone when they too hot or cold.
''',
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text('Floor Brooding',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),

              PlacedHolder(context: context),
              // Container(
              //   margin: EdgeInsets.only(bottom: 8),
              //   // width: MediaQuery.of(context).size.width,
              //   height: MediaQuery.of(context).size.height * 1 / 5,
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       fit: BoxFit.fill,
              //       image: AssetImage('assets/brooder.jpg'),
              //     ),
              //   ),
              // ),
              Text(
                '''In this system, several brooder rings are hanged in the house facing the floor.
This is the most comfortable system compared to cage brooding because each unit has its own source of heat.
''',
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8, top: 30),
                child: Text('Chick Management (0-8 weeks)',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 8),
                //  width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1 / 5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/feeding.jpg'),
                  ),
                ),
              ),
              Text('''Provide clean flesh water every day.
Provide continuous light during brooding period.
Temperatures need to be reduced by 5 degrees census every week.
Inspect the condition of chicks for abnormalities every day.
De-beaking is normally done in this stage.
Height of the feeder should be adjusted to the convenience of the chicks.
'''),

              Padding(
                padding: const EdgeInsets.only(bottom: 8, top: 30),
                child: Text('Beak Trimming',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              PlacedHolder(context: context),

              // Container(
              //   margin: EdgeInsets.only(bottom: 8),
              //   //  width: MediaQuery.of(context).size.width,
              //   height: MediaQuery.of(context).size.height * 1 / 5,
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       fit: BoxFit.cover,
              //       image: AssetImage('assets/feeding.jpg'),
              //     ),
              //   ),
              // ),
              Text(
                  '''Usually layers are beak trimmed at between 7 and 10 days of age using a precision cam.
'''),

              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'General Recommendations before beak trimming;',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text('''Do not beak trim sick birds.
Use electrolytes and vitamins in the water at beak trimming time.
Provide deeper feed for several days after beak trimming.
'''),
            ],
          ),
          isActive: _currentStep >= 2),

      //? STEP FOUR
      Step(
          title: Text('Growers Management (9-20 weeks)'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Placeholder(
              //   color: Colors.amber,
              //   fallbackHeight: 250,
              // ),

              PlacedHolder(context: context),

              // Container(
              //   margin: EdgeInsets.only(bottom: 8),
              //   // width: MediaQuery.of(context).size.width,
              //   height: MediaQuery.of(context).size.height * 1 / 5,
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       fit: BoxFit.fill,
              //       image: AssetImage('assets/brooder.jpg'),
              //     ),
              //   ),
              // ),
              Text(
                '''Vaccinate birds as per schedule.
De-beaking may be done if missed at the early stage.
Feed the birds with Growers mash in this stage.
Check feed intake and body weight at regular interval.
Provide light 12 hours a day.
After 6 weeks, check feed consumption and body weight against the recommended standard.
''',
              ),
            ],
          ),
          isActive: _currentStep >= 3),

      //? STEP FIVE
      Step(
          title: Text('Layers Manangement (21-72 weeks)'),
          content: Column(
            children: [
              // Placeholder(
              //   color: Colors.amber,
              //   fallbackHeight: 250,
              // ),
              // Container(
              //   margin: const EdgeInsets.only(bottom: 8.0),
              //   width: MediaQuery.of(context).size.width,
              //   height: MediaQuery.of(context).size.height * 1 / 5,
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       fit: BoxFit.cover,
              //       image: AssetImage('assets/layerhouse.png'),
              //     ),
              //   ),
              // ),

              PlacedHolder(context: context),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: Text(
                  '''Ventilation in layer house should be adequate.
Provide layers mash under this stage to enhance the chicken to start laying.
Provide laying nest/box to the birds for they start laying in this stage.
''',
                ),
              ),
            ],
          ),
          isActive: _currentStep >= 4),

      //? STEP SIX
      Step(
          title: Text('Feeds and Feeding'),
          content: Column(
            children: [
              PlacedHolder(context: context),

              // Container(
              //   margin: EdgeInsets.only(bottom: 8),
              //   width: MediaQuery.of(context).size.width,
              //   height: MediaQuery.of(context).size.height * 1 / 5,
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       fit: BoxFit.scaleDown,
              //       image: AssetImage('assets/medication.jpg'),
              //     ),
              //   ),
              // ),
              Text(
                '''Feed and feeding is the most important consideration for efficient poultry farming. There three strict feed programs in layers.''',
                //  textAlign: TextAlign.left,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  'Feeding Program',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: <DataColumn>[
                    DataColumn(
                      label: Text(
                        'Mash Type',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Crude Protein',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    // DataColumn(
                    //   label: Text(
                    //     'Age (weeks)',
                    //     style: TextStyle(fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                  ],
                  rows: <DataRow>[
                    DataRow(
                      cells: <DataCell>[
                        DataCell(
                          Text('Chick (0-8 weeks)'),
                        ),
                        DataCell(
                          Text('20%'),
                        ),
                        // DataCell(
                        //   Text('1-8 weeks'),
                        // ),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(
                          Text('Growers (9-18 weeks)'),
                        ),
                        DataCell(
                          Text('16%'),
                        ),
                        // DataCell(
                        //   Text('Drinking Water'),
                        // ),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(
                          Text('Layers (19 - ...)'),
                        ),
                        DataCell(
                          Text('17%'),
                        ),
                        // DataCell(
                        //   Text('Drinking Water'),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 8),
                child: Text(
                  '''
Join our community to learn feed making and formulation''',
                ),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          isActive: _currentStep >= 5),
      //? STEP SEVEN
      Step(
          title: Text('Vaccination'),
          content: Column(
            children: [
              // Placeholder(
              //   color: Colors.amber,
              //   fallbackHeight: 250,
              // ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1 / 5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/vaccine.jpg'),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(2),
                child: ListBody(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Some of the common diseases affecting layers are Newcastle, Marek Disease, Coccidios, Helminthic Disease and Colybacillos.',
                        style: TextStyle(
                            fontSize: 16, fontFamily: 'Source Sans Pro'),
                        softWrap: true,
                      ),
                    ),
                    Text(
                      'Some vaccines are administered when the immune system is fully matured.',
                      style: TextStyle(
                          fontSize: 16, fontFamily: 'Source Sans Pro'),
                      softWrap: true,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Vaccination Program',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontFamily: 'Source Sans Pro'),
                        softWrap: true,
                      ),
                    ),
                    Divider(),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: <DataColumn>[
                          DataColumn(
                            label: Text(
                              'Age',
                              style: TextStyle(
                                  fontFamily: 'Source Sans Pro',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Disease',
                              style: TextStyle(
                                  fontFamily: 'Source Sans Pro',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Admnistration',
                              style: TextStyle(
                                  fontFamily: 'Source Sans Pro',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                        rows: <DataRow>[
                          DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Text('7 Days'),
                              ),
                              DataCell(
                                Text('Gumboro'),
                              ),
                              DataCell(
                                Text('Drinking Water'),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Text('14 Days'),
                              ),
                              DataCell(
                                Text('Newcastle hitchner'),
                              ),
                              DataCell(
                                Text('Drinking Water/eye drop'),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Text('21 Days'),
                              ),
                              DataCell(
                                Text('Gumboro'),
                              ),
                              DataCell(
                                Text('Drinking Water'),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Text('28 Days'),
                              ),
                              DataCell(
                                Text('Newcastle Lasota'),
                              ),
                              DataCell(
                                Text('Drinking Water/eye drop'),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Text('5 Weeks'),
                              ),
                              DataCell(
                                Text('Fowlpox'),
                              ),
                              DataCell(
                                Text('Wing Web'),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Text('16 Weeks'),
                              ),
                              DataCell(
                                Text('Newcastle Lasota'),
                              ),
                              DataCell(
                                Text('Eye drop/injection'),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Text('19 Weeks'),
                              ),
                              DataCell(
                                Text('Deworm'),
                              ),
                              DataCell(
                                Text('Drinking Water'),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Text('Every 3 Months'),
                              ),
                              DataCell(
                                Text('Newcastle Lasota'),
                              ),
                              DataCell(
                                Text('Drinking Water/eye drop'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          isActive: _currentStep >= 6),

      Step(
          title: Text('BioSecurity'),
          content: Column(
            children: [
              // Placeholder(
              //   color: Colors.amber,
              //   fallbackHeight: 250,
              // ),
              Container(
                margin: const EdgeInsets.only(bottom: 8.0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1 / 5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/layerhouse.png'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: Text(
                  '''You can prevent many diseases by keeping the house clean.
Overcrowding of birds can cause disease.
Do not allow scavenging birds to move in the farm/khola to prevent transmission of diseases.
Have special shoes/boots to use in the farm (houses). Place a foot bath with disinfectans such as viral kill or industrial lime at the entrace of the farm.
Restrict other poutry farmers from entering into your farm without being disinfected.''',
                ),
              ),
            ],
          ),
          isActive: _currentStep >= 7),
    ];
    return _steps;
  }
}
