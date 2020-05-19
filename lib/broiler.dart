import 'package:flutter/material.dart';

import 'homePage.dart';

class Broiler extends StatefulWidget {
  static const routeName = '/broiler';

  @override
  _BroilerState createState() => _BroilerState();
}

class _BroilerState extends State<Broiler> {
  int _currentStep = 0;
  double progress = 100 / 6;
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
                    courseName: 'Broilers',
                    courseImage: 'assets/broiler.png',
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
                      steps: broilerSteps(),
                      currentStep: this._currentStep,
                      onStepTapped: (step) {
                        setState(() {
                          this._currentStep = step;
                        });

                        switch (this._currentStep) {
                          case 0:
                            progress = 100 / 6;
                            break;
                          case 1:
                            progress = 100 / 6 * 2;
                            break;
                          case 2:
                            progress = 100 / 6 * 3;
                            break;
                          case 3:
                            progress = 100 / 6 * 4;
                            break;
                          case 4:
                            progress = 100 / 6 * 5;
                            break;
                          case 5:
                            progress = 100 / 6 * 6;
                            break;
                          default:
                        }
                      },
                      onStepContinue: () {
                        if (this._currentStep <
                            this.broilerSteps().length - 1) {
                          goTo(1, 100 / 6);
                          //  progressBar(10);

                        } else {
//TODO: Action here, open a dialogue box that says "take quiz or shop, or home"
                          print('completed stepping');
                        }
                      },
                      onStepCancel: () {
                        if (this._currentStep != 0) {
                          goTo(-1, -100 / 6);
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

  List<Step> broilerSteps() {
    List<Step> _steps = [
      Step(
          title: Text('Cleaning and Disinfection'),
          content: Column(
            children: [
              // Placeholder(
              //   fallbackHeight: 250,
              //   color: Colors.amber,
              // ),

              Container(
                margin: EdgeInsets.only(bottom: 8),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1 / 5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.scaleDown,
                    image: AssetImage('assets/sprayer.jpg'),
                  ),
                ),
              ),
              Text(
                '''Clean the whole house with soap and soda using a broom.
Mix 10ml of undiluted viral kill with 10litres of water.
Spray in all corners of the house using a sprayer from top to bottom.
Wait at least five days.
Add 2kg of industrial lime on the floor before litter using a sieve.''',
                //  textAlign: TextAlign.left,
              ),
            ],
          ),
          isActive: _currentStep >= 0),
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
                '''Make sure the houses are properly cleaned and disinfected.
Spread newspaper on top of the litter'.
Brooding heaters or Charcoal burners should be ready 2hours before chicks’ arrival.
''',
              ),
            ],
          ),
          isActive: _currentStep >= 1),
      Step(
          title: Text('Chick Brooding and Feeding'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Placeholder(
              //   color: Colors.amber,
              //   fallbackHeight: 250,
              // ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text('Brooding',
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
                '''A good Brooding house protects broilers from adverse weather and predators.
Day old chicks are raised for 21 days in this house.
This house should be properly ventilated.
First week of life require temperatures between 25 degrees census to 35 degrees census.
Temperatures need to be reduced by 5 degrees census/week.
Join our community to get expert designs and Temperature control systems.''',
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8, top: 30),
                child: Text('Chick Feeding',
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
              Text(
                  '''Feeds takes 80% of the cost for raising broiler chickens. One can save up to 50% of the production cost by producing one\'s own feeds.
You can feed your birds with three types of feeds; crumble, pellets or mash.
During the Brooding period, from Day 1 to Day 21, feed the chicks with Broiler Starter Mash.
Join our community to learn feed making and more.'''),
            ],
          ),
          isActive: _currentStep >= 2),

      //? step 4
      Step(
          title: Text('Finishing House and Feeding'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Placeholder(
              //   color: Colors.amber,
              //   fallbackHeight: 250,
              // ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text('Growers Housing',
                    style: TextStyle(fontWeight: FontWeight.bold)),
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
                '''A good Brooding house protects broilers from adverse weather and predators.
After brooding stage the chicks are raised in this house.
This house should be well ventilated because as the chicks grow, they tend to eat alot and build a lot of heat.
The recommended space/bird in this house is 10 birds/square meter.
The House should have a Flat, smooth and easy to clean floor. And also have a good depth of litter (about one inch).
Litter should be raked or turned weekly. Turned litter makes excellent manure for other purposes
Join our community to get expert advice''',
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8, top: 30),
                child: Text('Growers-Finishers Feeding',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 8),
                //  width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1 / 5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/feeds.jpg'),
                  ),
                ),
              ),
              Text(
                  '''Feeds takes 80% of the cost for raising broiler chickens. One can save up to 50% of the production cost by producing one\'s own feeds.

Join our community to learn feed making and formulation.

You can feed your birds with three types of feeds; crumble, pellets or mash.
From Day 22 to Day 42, feed the chicks with Broiler Grower Mash.
From Day 43 to Day 56, feed the chickens with Broiler Finisher Mash.
Broilers are matured and ready for Market after 8 weeks or 56 days.
'''),
            ],
          ),
          isActive: _currentStep >= 3),
      Step(
          title: Text('Vaccination and Medication'),
          content: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Vaccination',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Source Sans Pro',
                  ),
                ),
              ),
              // Placeholder(
              //   fallbackHeight: 250,
              //   color: Colors.amber,
              // ),

              Container(
                margin: EdgeInsets.only(bottom: 8),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1 / 5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.scaleDown,
                    image: AssetImage('assets/medication.jpg'),
                  ),
                ),
              ),
              Text(
                '''Diseases that are important to be prevented in broilers are Newcastle, gumboro, coccidios and avian influenza.
Some vaccine are administered hen the immune system is fully developed.
Vaccines are delivered via spraying or drinking water.''',
                //  textAlign: TextAlign.left,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Text(
                  'Vaccination Program',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Source Sans Pro',
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: <DataColumn>[
                    DataColumn(
                      label: Text(
                        'Age',
                        style: TextStyle(
                            fontFamily: 'Source Sans Pro',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Disease',
                        style: TextStyle(
                            fontFamily: 'Source Sans Pro',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Admnistration',
                        style: TextStyle(
                            fontFamily: 'Source Sans Pro',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                  rows: <DataRow>[
                    DataRow(
                      cells: <DataCell>[
                        DataCell(
                          Text('10 Days'),
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
                          Text('Newcastle'),
                        ),
                        DataCell(
                          Text('Drinking Water'),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(
                          Text('18 Days'),
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
                          Text('21 Days'),
                        ),
                        DataCell(
                          Text('Newcastle'),
                        ),
                        DataCell(
                          Text('Drinking Water'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 8),
                child: Text(
                  '''Avoid storing Vaccine in direct sunlight.
Never vaccine a sick bird.
Join our community for more tips''',
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Text(
                  'Medication and Vitamins',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Source Sans Pro',
                  ),
                ),
              ),

              Column(
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
                        fit: BoxFit.scaleDown,
                        image: AssetImage('assets/meds.jpg'),
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
                            'Vitamins',
                            style: TextStyle(
                              fontFamily: 'Source Sans Pro',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          'There two groups of vitamins that a broiler needs;\n> Stress pack\n> Multi-Vitamine\nJoin our community to learn about vitamins',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Health and Diseases',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          'Broilers are very fragile and can get sick easy, there are two major sources of disease in broiler production.',
                          style: TextStyle(

                              // fontWeight: FontWeight.bold,
                              ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 8, 0, 0),
                          child: Text(
                            '1. Diet Caused Diseases',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Text(
                            '> If feed is not correctly formulated can result into sickness\n> If macronutrients are not properly ministered broilers can get diseases.\nDiscover more about this topic from our community',
                            style: TextStyle(

                                // fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 8, 0, 0),
                          child: Text(
                            '2. Bacteria and Viral Caused Diseases',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Text(
                            '> It’s necessary to treat the birds as soon as hatchery to allow them resist diseases.\n> Other vaccinations are done for more than once.\nDiscover more about this topic from our community, but some of the diseases are;',
                            style: TextStyle(

                                // fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(40, 8, 0, 0),
                          child: Text(
                            'i. Newcastle',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                          child: Text(
                            '> Very dangerous disease can wipe out a batch within seconds.\n> Broilers should be treated at time interval or before expected disease seasons.\nDiscover more about Vewcastle from our community.',
                            style: TextStyle(

                                // fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(40, 8, 0, 0),
                          child: Text(
                            'ii. Avian Influenza',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                          child: Text(
                            '> This is the most dangerous virus strain because it can also kill humans.\n> The virus can be spread by eating infected birds.\n> The vaccine is administered in the eyes.\nDiscover more about Avian Influenza from our community.',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          isActive: _currentStep >= 4),
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
          isActive: _currentStep >= 5),
    ];
    return _steps;
  }
}
