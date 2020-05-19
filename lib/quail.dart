import 'package:flutter/material.dart';

import 'homePage.dart';

class Quail extends StatefulWidget {
  static const routeName = '/quail';

  @override
  _QuailState createState() => _QuailState();
}

class _QuailState extends State<Quail> {
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
                    courseName: 'Quials',
                    courseImage: 'assets/quail.png',
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
                      steps: _mySteps(),
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
                        if (this._currentStep < this._mySteps().length - 1) {
                          goTo(1, 100 / 6);
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

  List<Step> _mySteps() {
    List<Step> _steps = [
      //? STEP ONE
      Step(
          title: Text('Brooding and Housing'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Placeholder(
              //   color: Colors.amber,
              //   fallbackHeight: 250,
              // ),

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
                '''A good Brooding house protects quails from adverse weather and predators.
Day old chicks are raised for 21 days in this house.
This brooding house should be properly ventilated.
First week of life require temperatures between 25 degrees census to 35 degrees census.
Temperatures need to be reduced by 5 degrees census/week.
Join our community to get expert designs and Temperature control systems.''',
              ),
            ],
          ),
          isActive: _currentStep >= 0),

      //? STEP TWO
      Step(
          // subtitle: Text('data'),
          title: Text('Growers Housing'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text('Floor Rearing',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Placeholder(
                color: Colors.amber,
                fallbackHeight: MediaQuery.of(context).size.height * 1 / 5,
              ),
              // Container(
              //   margin: EdgeInsets.only(bottom: 8),
              //   width: MediaQuery.of(context).size.width,
              //   height: MediaQuery.of(context).size.height * 1 / 5,
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       fit: BoxFit.cover,
              //       image: AssetImage('assets/chickbrooder.jpg'),
              //     ),
              //   ),
              // ),
              Text(
                '''Quails are reared directly on the floor.
Good ventilation and a large concrete floor for easy cleaning.
Beddings are spread about 5-10cm high.
Cages and bird houses 60 to 150cm high are the most dangerous and should be avoided to prevent birds from injuring themselves as they are fond of flying around.
The recommended dimensins are 2m in length x 1m in width x 50 cm in height. These dimensions can contend 160 quails for brooding.
''',
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text('Cage Rearing',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Placeholder(
                color: Colors.amber,
                fallbackHeight: MediaQuery.of(context).size.height * 1 / 5,
              ),
              // Container(
              //   margin: EdgeInsets.only(bottom: 8),
              //   width: MediaQuery.of(context).size.width,
              //   height: MediaQuery.of(context).size.height * 1 / 5,
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       fit: BoxFit.cover,
              //       image: AssetImage('assets/chickbrooder.jpg'),
              //     ),
              //   ),
              // ),
              Text(
                '''Cage rearing does not require a little of space as the cage can have extra floors.
Air circulation is restricted when the cage has many floors.
Cages can be made of wood and/or chicken wire.
Chicken wire is easy to clean and disinfect compared to wood.
The recommended dimensins are 2m in length x 1m in width x 50 cm in height. These dimensions can contend 160 quails for brooding.
''',
              ),
            ],
          ),
          isActive: _currentStep >= 1),

      //? STEP THREE
      Step(
          title: Text('Feed Program and Nutrition'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Placeholder(
              //   color: Colors.amber,
              //   fallbackHeight: 250,
              // ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text('Feeding',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 8),
                // width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1 / 5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/feed.jpg'),
                  ),
                ),
              ),
              Text(
                '''There is one regime system of feeding quails.

> Starter (Protein level 25-28%) from 0-6 weeks.
> Finisher (Protein level 19-23%) from 6 weeks - Market.

You can Add insects such as termites and mealworms to increase the protein and energy levels of feed.
Adult quail comsume around 14-18g a day

Join our community to learn to make your our feeds and save up to 50% of the feeding costs.''',
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8, top: 30),
                child: Text('Vitamins and Minerals',
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
              //   //  width: MediaQuery.of(context).size.width,
              //   height: MediaQuery.of(context).size.height * 1 / 5,
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       fit: BoxFit.cover,
              //       image: AssetImage('assets/feeding.jpg'),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8, top: 30),
                child: Text('Vitamins',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Text(
                  '''A bird needs plenty of vitamins for proper health and performance.
Vitamins can be added in drinking water until stressing conditions are corrected.'''),

              Padding(
                padding: const EdgeInsets.only(bottom: 8, top: 30),
                child: Text('Minerals',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),

              Text(
                  '''Laying quails requires higher levels of minerals for egg shell production.
Minerals are essential for bone formation and development.
Many minerals are included in vitamin premix.
'''),
            ],
          ),
          isActive: _currentStep >= 2),

      //? step 4
      Step(
          title: Text('Vaccination and Diseases'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Placeholder(
              //   color: Colors.amber,
              //   fallbackHeight: 250,
              // ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text('Vaccine and Medication',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),

              // Padding(
              //   padding: const EdgeInsets.only(bottom: 8.0),
              //   child: Placeholder(
              //     color: Colors.amber,
              //     fallbackHeight: MediaQuery.of(context).size.height * 1 / 5,
              //   ),
              // ),

              Container(
                margin: EdgeInsets.only(bottom: 8),
                // width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1 / 5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage('assets/meds.jpg'),
                  ),
                ),
              ),
              Text(
                '''Withdrawal medication when period for slaughter approaches or saving eggs for human consumption.
For new farmers it is recommended to use shop feed because most of the feed is medicated with coccidiostats and antibiotics.
When using homemade feed aspergillosis becomes a real problem because it is caused by a fungi contained in the grain.
''',
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 8,
                ),
                child: Text('Diseases',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Text(
                '''There are two major diseases in quail production even though quails can contract most chicken diseases like Newcastle, Gumboro, avian flu and avian cholera.
                ''',
              ),
              Text(
                '1. Infectious Coryza',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '''This can be treated by administering tetracycline.
Isolate the sick bird to prevent the disease from spraiding.
''',
              ),

              Text(
                '2. Ascaridiosis',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '''Administer piperazine or wormazine.
                ''',
              ),
            ],
          ),
          isActive: _currentStep >= 3),

      //? STEP FOUR
      Step(
          title: Text('Feed and Water Management'),
          content: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 8),
                // width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1 / 5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/feeding.jpg'),
                  ),
                ),
              ),
              Text(
                '''To avoid water and food soiling the bedding, drinking troughs and feeders should not be placed on the ground.
Vinegar is a very good disinfectant that kill germs, use it when cleaning feeders and drinkers.
Water should not be too hot or cold.
Replace water troughs with fresh water at least once daily.
Feed stored for more than 2 or 3 months is subject to vitamin loss and can become rancid.''',
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          isActive: _currentStep >= 4),

      //? STEP FIVE
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
