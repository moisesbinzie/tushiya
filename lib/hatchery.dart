import 'package:flutter/material.dart';
import 'package:tushiya/constants.dart';

import 'homePage.dart';

//TODO: Optimise this section

class Hatchery extends StatefulWidget {
  static const routeName = '/hatchery';

  @override
  _HatcheryState createState() => _HatcheryState();
}

class _HatcheryState extends State<Hatchery> {
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
                    courseName: 'Hatchery',
                    courseImage: 'assets/hatch250.png',
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
          title: Text('Preparations'),
          content: Column(
            children: [
              // Placeholder(
              //   fallbackHeight: 250,
              //   color: Colors.amber,
              // ),

              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1 / 5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage('assets/sprayer.jpg'),
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
                        '''Sanitize the incubator and run it for 2 to 3 days before setting the eggs. This will ensure that the incubator is maintaining the proper temperature and relative humidity before the eggs are set.
                        ''',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          isActive: _currentStep >= 0),
      Step(
          // subtitle: Text('data'),
          title: Text('Features of Hatching Eggs'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Placeholder(
              //   color: Colors.amber,
              //   fallbackHeight: 250,
              // ),
              Text(
                '''Egg Selection
                ''',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              PlacedHolder(context: context),
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   height: 250,
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       fit: BoxFit.cover,
              //       image: AssetImage('assets/logoo.png'),
              //     ),
              //   ),
              // ),
              Text(
                '''Select eggs of equal weight if possible, small eggs contain insufficient nutrients because of a small yolk. Very large eggs are likely to be infertile and may produce deformed chicks.
Select fertile eggs from healthy hens because diseases can be passed through the eggs.
                ''',
                textAlign: TextAlign.justify,
              ),
              Text(
                '''DisInfection of Eggs
                ''',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              // Placeholder(
              //   color: Colors.amber,
              //   fallbackHeight: 250,
              // ),
              PlacedHolder(context: context),
              Container(
                padding: EdgeInsets.all(2),
                child: ListBody(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'It is very important to disinfect eggs before hatching to kill micro-organisms. An egg can be become contaminated as soon after they are laid. The following are two ways of disinfecting eggs before incubation.',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                      child: Text('Spraying',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Text(
                      'Spraying disinfectants is an effective way to reduce risks of bacterial contamination.',
                    ),
                    Text(
                      'This method is especially useful when hatching eggs are collected directly onto the incubator trays because it is possible to spray disinfectant onto the top of the egg.',
                    ),
                    Text(
                      'Disinfectant that are most commonly used are those with a quaternary ammonium base.',
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                      child: Text('Fumigating',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Text(
                      'This is the most widespread method used. It is most effective against shell contamination. The process can be done by using pounded tobacco leaves.',
                    ),
                  ],
                ),
              ),
            ],
          ),
          isActive: _currentStep >= 1),
      Step(
          title: Text('Storing Eggs'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    fit: BoxFit.contain,
                    image: AssetImage('assets/eggs.jpg'),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(2),
                child: ListBody(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                      child: Text('Storage Conditions',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Text(
                      'The hatching rate decreases the longer the the eggs  are stored. Eggs should be stored in a room temperature of 18 degrees celsius.',
                      style: TextStyle(
                          fontSize: 16, fontFamily: 'Source Sans Pro'),
                      softWrap: true,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                      child: Text('Effect storage on incubation time.',
                          softWrap: true,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Text(
                      '''It is best to incubate eggs within 7 to 10 days from the day they are laid. Hatch rate decreases rapidly when eggs are stored for more than 10 days. After 7 days, hatch rate decreases 0.5 to 1.5 % per day, and it adds one hour to the incubation time in order to get such eggs to hatch.
                      ''',
                    ),
                  ],
                ),
              ),
            ],
          ),
          isActive: _currentStep >= 2),

      //? step 4
      Step(
          title: Text('Incubation'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Placeholder(
              //   color: Colors.amber,
              //   fallbackHeight: 250,
              // ),
              Text('''
1. Temperature
              ''', style: TextStyle(fontWeight: FontWeight.bold)),

              PlacedHolder(context: context),
              Container(
                padding: EdgeInsets.all(2),
                child: ListBody(
                  children: <Widget>[
                    Text(
                      'An incubator should be operated in a location free from drafts and direct sunlight. An incubator should be operated for several hours with water placed in a pan to stabilize its internal atmosphere before fertile egg are set.',
                    ),
                    Text(
                      'Do not adjust the heat upward during the first 48 hours after egg are set, this practice cooks many eggs. The eggs will take time to warm to incubator temperature and many times.',
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                      child: Text(' Factoring Power outages',
                          softWrap: true,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Text(
                      'Embryos can survive at the temperature below 90 F for up to 18 hours. If you experience a power failure don’t panic, the secret is to keep the incubator warm.',
                    ),
                    Text(
                      'This can be done by placing a large cardboard or blanket over the top of an incubator for additional insulation to warm the eggs.',
                    ),
                  ],
                ),
              ),
              Text('''

2. Humidity
              ''', style: TextStyle(fontWeight: FontWeight.bold)),
              PlacedHolder(context: context),
              Text(
                'The relative humidity in the incubator can also be varied by changing the size of the water pan or by putting a sponge in the pan to increase the evaporative surface.',
              ),
              Text(
                'The pan should be checked regularly while the incubator is in use to be sure that there is always an adequate amount of water.',
              ),
              Text(
                'Too much moisture in the incubator prevents normal evaporation and results in a decreased hatch but excessive moisture is seldom a problem in small incubators.',
              ),
              Text(
                '''Too little moisture results in excessive evaporation, causing chicks to stick the shell.
                ''',
              ),

              Text('''

3. Ventilation
              ''', style: TextStyle(fontWeight: FontWeight.bold)),
              PlacedHolder(context: context),
              Text(
                '''Ventilation is more critical on homemade incubator, it is possible to suffocate the eggs and chicks in an air-tight container. However, excessive ventilation removes humidity and makes it difficult to heat incubator properly.
The best hatching results are obtained with normal atmospheric air, which usually contains 20 – 21 % oxygen. It is difficult to provide too much oxygen, but a deficiency is possible, make sure that the ventilation holes are adjusted to allow a normal exchange of air.''',
              ),

              Text('''

4. Egg Turning
              ''', style: TextStyle(fontWeight: FontWeight.bold)),
              PlacedHolder(context: context),

              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'Eggs set on their sides must be rotated ½ turn at least 3 times daily. For proper turning, mark each side of the egg with a pencil.',
                ),
              ),
              Text(
                'Stop turning the eggs for the last 3 days of the incubation cycle (at 18 days for chickens, 25 days for guinea fowl).',
              ),
              Text(
                'During this final stage do not open the incubator until the hatch is completed to ensure that a desirable hatching humidity is maintained.',
              ),

              Text('''

2. Candling
              ''', style: TextStyle(fontWeight: FontWeight.bold)),
              PlacedHolder(context: context),

              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'Shining a light through the eggs to observe embryo development is called candling. White or pale are easier to candle than dark or speckled eggs.',
                ),
              ),
              Text(
                'Keep in mind candling is done after 7 to 10 days and exactly within 20 – 30 minutes so you need to be fast as possible but care to prevent breaking the eggs.',
              ),
              Text(
                'The process is done in a dark room, hold the egg to the light of the Candler to observe the contents of the egg.',
              ),
              Text(
                'The living embryo will appears with veins and blood vessels and the egg will be getting darker at the bird grows and take up more space.',
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 8.0,
                ),
                child: Text('Signs of a bad egg',
                    softWrap: true,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Text(
                'There is a vague ring inside the egg and few or no veins appearing.',
              ),
              Text(
                'Contact us  to learn more signs of bad eggs in an incubator.',
              ),
            ],
          ),
          isActive: _currentStep >= 3),
      Step(
          title: Text('Hatching'),
          content: Column(
            children: [
              PlacedHolder(context: context),

              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                child: Text('Total Incubation',
                    softWrap: true,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Text(
                'Different species have different incubation periods. Incubating different poultry species together in the same incubator is not recommended.',
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                child: Text('Environment in the incubator room',
                    softWrap: true,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Text(
                'The incubator should be away from the window or door where temperatures are easily fluctuating.',
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                child: Text('Calculating for Hatching rate',
                    softWrap: true,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Text(
                'Many believe that a 200 capacity incubator will hatch 200 chicks, in fact this is not quit true not all eggs placed in the incubator will hatch.\nJoin our community to learn more factors that affect the hatching rates and also learn how to calculate the functions listed below',
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                child: Text('Fertility percentage',
                    softWrap: true,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                child: Text('Hatching percentage',
                    softWrap: true,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                child: Text('Total eggs hatched percentage',
                    softWrap: true,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                child: Text('''Layer chicks hatching percentage
                ''',
                    softWrap: true,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),

              // Placeholder(
              //   fallbackHeight: 250,
              //   color: Colors.amber,
              // ),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          isActive: _currentStep >= 4),
      Step(
          title: Text('BioSecurity'),
          content: Column(
            children: [
              PlacedHolder(context: context),
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

              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'Take biosecurity measures to ensure the incubator area is not contaminated by older chicks. The incubator should be away from the growing facilities.',
                ),
              ),
              Text(
                '''Wear gloves all the time when handling eggs in the incubator to prevent contamination or transfer of bacteria from your hands to the eggs.
                ''',
              ),
            ],
          ),
          isActive: _currentStep >= 5),
    ];
    return _steps;
  }
}
