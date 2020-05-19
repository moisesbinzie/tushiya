import 'package:flutter/material.dart';

import 'homePage.dart';

class Mikolongwe extends StatefulWidget {
  static const routeName = '/mikolongwe';

  @override
  _MikolongweState createState() => _MikolongweState();
}

class _MikolongweState extends State<Mikolongwe> {
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
                    courseName: 'Mikolongwe',
                    courseImage: 'assets/mikolongwe.png',
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
                            this.mikolongweSteps().length - 1) {
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

  List<Step> mikolongweSteps() {
    List<Step> _steps = [
      //? STEP ONE
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
                '''Make sure the houses are properly cleaned and disinfected.
Add new litter'.
Brooding heaters or Charcoal burners should be ready 2hours before chicks’ arrival.
Count chicks as you put them in the brooder house.
During brooding period, it is very important to start giving chicks water with vitamins when they have arrived.
Introduce chicks to feed.
''',
              ),
            ],
          ),
          isActive: _currentStep >= 1),

      //? STEP THREE
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
                '''A good Brooding house protects Mikolongwe from adverse weather and predators.
Two houses are recommended to be constructed, one for brooding and other for finishing.
This house should be properly ventilated.
Critical period for Mikolongwe brooding is 9-12 days.
First days of life need temperature between 32 degrees census to 33 degrees census.
Temperatures need to be reduced by 2 degrees’ census/week.

Ideally there is need for a brooder house to set about 90-100m away from the finishing house.
Be expanding the ground as chicks grow, when using a section to separate part of the house.
join our community to get expert designs and Temperature control systems.
''',
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
                  '''Feeds takes 80% of the cost for raising Mikolongwe chickens. One can save up to 50% of the production cost by producing one\'s own feeds.
You can feed your birds with three types of feeds; crumble, pellets or mash.
During the Brooding period, feed the chicks with Starter Mash for the first two weeks.
Join our community to learn economic feed making and more.
'''),
            ],
          ),
          isActive: _currentStep >= 2),

      //? STEP FOUR
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
                '''A good Brooding house protects Mikolongwe from adverse weather and predators.
After brooding stage the chicks are raised in this house.
This house should be well ventilated because as the chicks grow, they tend to eat alot and build a lot of heat.
The recommended space/bird in this house is 10 birds/square meter.
The Walls should be painted white on the inside to reduce high temperatures.
It should be noted that raged walls become hiding place for parasites like mice and rice.
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
                  '''Feeds takes 80% of the cost for raising Mikolongwe chickens. One can save up to 50% of the production cost by producing one\'s own feeds.

Join our community to learn feed making and formulation.

You can feed your birds with three types of feeds; crumble, pellets or mash.

From (week 3) to (week 4), feed the chicks with Growers Mash.
From (week 4) to (week 6), feed the chickens with Finisher Mash.

In this phase, a bird can feed about 160g of feeds a day and weigh up to 3.5 kgs.
'''),
            ],
          ),
          isActive: _currentStep >= 3),

      //? STEP FIVE
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
                '''Diseases that are important to be prevented in Mikolongwe are Newcastle, gumboro, coccidios and avian influenza.
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
                          '''There two groups of vitamins that a Mikolongwe needs;
> Stress pack
> Multi-Vitamine

Join our community to learn about vitamins''',
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
                          'Mikolongwe are very fragile and can get sick easy, there are two major sources of disease in Mikolongwe production.',
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
                            '''> If feed is not correctly formulated can result into sickness
> If macronutrients are not properly ministered, Mikolongwe can contract diseases.
Discover more about this topic from our community''',
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
                            '''> This is a very dangerous disease, it can wipe out a batch within seconds.
> Mikolongwe should be treated at time interval or before expected disease seasons.
Discover more about Vewcastle from our community.''',
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
                            '''> This is the most dangerous virus strain because it can also kill humans.
> The virus can be spread by eating infected birds.
> The vaccine is administered in the eyes.
Discover more about Avian Influenza from our community.''',
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
      //? STEP SIX
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
