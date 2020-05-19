import 'package:flutter/material.dart';

import 'constants.dart';
import 'homePage.dart';

//TODO: Optimise this section

class Turkey extends StatefulWidget {
  static const routeName = '/turkey';

  @override
  _TurkeyState createState() => _TurkeyState();
}

class _TurkeyState extends State<Turkey> {
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
                    courseName: 'Turkey',
                    courseImage: 'assets/turkey.png',
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
                            this.broilerSteps().length - 1) {
                          goTo(1, 100 / 8);
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

  List<Step> broilerSteps() {
    List<Step> _steps = [
      Step(
          title: Text('Preparations Before Starting a Flock'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Although turkey are more disease resistant in comparison to other poultry species like chicken ,duck and quails this does not give a farmer a comfort zone not to practice good health management like routine vaccination, balanced diet, good sanitation and avoiding overcrowding.',
              ),
              Text(
                '1.1 Housing',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              PlacedHolder(context: context),
              Text(
                'Although they are left to fend for themselves, turkey are best to be provided shelter.\nA good house protect the birds from extreme weather, predators, reduce spread of diseases and provide protection from theft.\nTurkey production can be raised under intensive conditions similar to broiler production. For more information refer to broiler production course.',
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  '1.2 Nutrition',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1 / 5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/feeds.jpg'),
                  ),
                ),
              ),
              Text(
                'Naturally turkey are foragers, they can meet most of their nutrition requirement through eating earthworm, insects, snails, kitchen waste and termites and grain.\nIt is not recommended to feed chicken diet to turkey because turkey needs high vitamin and mineral level and also have a different calcium to phosphorus ratio in diet compared to chickens.\nApart from nutrition differences between turkey and chicken, chicken starter is a poor substitute as the protozoa that causes Coccidiosis in chickens is not the same species that cause Coccidiosis in turkeys.',
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  '1.3 Sourcing Poults',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                '''Poults should be purchased from a source where breeders has a good health status. Don’t buy poults because they are cheap and available.
                ''',
              ),
            ],
          ),
          isActive: _currentStep >= 0),
      Step(
          // subtitle: Text('data'),
          title: Text('Brooding'),
          content: Column(
            children: [
              Container(
                padding: EdgeInsets.all(2),
                child: ListBody(
                  children: <Widget>[
                    Text(
                      'In turkey production brooding period supersede all other poultry species, it reaches to 6 weeks.',
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        '2.1 Brooder House',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
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
                          image: AssetImage('assets/brooder.jpg'),
                        ),
                      ),
                    ),
                    Text(
                      'The brooder house for broiler chickens are the same as for poults (day old turkeys)',
                      style: TextStyle(

                          // fontWeight: FontWeight.bold
                          ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        '2.2 Litter',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),

                    Text(
                      'The common litter materials used for brooding are rice husk.\nUse clean, dry and dust free rice husk to avoid respiratory problems.\nLitter should be spread evenly throughout the brooding house to avoid elevation position of drinkers and feeders.',
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        '2.3 Water',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),

                    Text(
                      'Cover the whole area with at least 5cm deep of rice husk to avoid water spillages.\nTurkey are very sensitive to taste so drinkers should be refilled at least 3 times a day.',
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        '2.4 Lighting',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),

                    Text(
                      'The light level should be uniform across the entire brooding house.\nPoults have poor vision and they take several days before their vision is complete so avoid using different lights in one house for example it is not recommended to use florescent tube and energy saver.\nThe 100 watts bulb should be hanged 1 meter above litter level.',
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        '2.5 Temperature',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),

                    Text(
                      'Temperature in the brooder house is very important, 32 degrees celsius that the recommended and reduce by 2 degrees celsius each week until at 6th weeks.',
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        '2.6 Brooder Rings',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),

                    Text(
                      '''It is very important to confine poults to a smaller space to keep them close to the source of heat, feed and water.\nBrooders are designed by our company, contact us for more information.
                      ''',
                    ),
                  ],
                ),
              ),
            ],
          ),
          isActive: _currentStep >= 1),
      Step(
          title: Text('Breeding'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PlacedHolder(context: context),
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   height: 250,
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       fit: BoxFit.cover,
              //       image: AssetImage('assets/chickbrooder.jpg'),
              //     ),
              //   ),
              // ),
              Container(
                padding: EdgeInsets.all(2),
                child: ListBody(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        '3.1 Size of Breeding Stock',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      'The recommended mating ratio is one tom and five hens.\nIf the ratio of male to female is not correct the number of fertile eggs will be low and male birds may die because of fighting.',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        '3.2 Prevention of Inbreeding',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      'Inbreeding results in weak and deform poults which are likely to die soon after hatching.\nIn order to have a healthy breeding stock, you should have 3 toms at reserve to replace the weak and unhealthy ones.\nTurkey breed when they are about 1 year old and can lay about 20 eggs before going broody.',
                    ),
                  ],
                ),
              ),
            ],
          ),
          isActive: _currentStep >= 2),

      //? step 4
      Step(
          title: Text('Rearing Systems'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   height: 250,
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       fit: BoxFit.cover,
              //       image: AssetImage('assets/brooder.jpg'),
              //     ),
              //   ),
              // ),
              Container(
                padding: EdgeInsets.all(2),
                child: ListBody(
                  children: <Widget>[
                    PlacedHolder(context: context),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        '4.1   Free Range System',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      'Free range in turkey production is very important because it reduces feed cost by 50 percent.\nUnder free range system turkeys are not confined and can scavenge for food around the areas.\nIn this system most of times turkeys live outside, usually in boxes and shelters.\nSupplementary feeding is also practiced, usually calcium should be supplemented to avoid leg weakness and lameness.',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        '4.2   Semi-Intensive',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      'In this system turkeys are kept inside to a certain area with access to shelter.\nFeed and water are available in the house to avoid wastage, wind and predators.',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        '4.3   Intensive System',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      'These system turkeys are confined fully in houses or cages like broiler chickens.',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        '4.3.1 Deep litter system',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      '''Deep litter system guineas are fully confined within the house but they can move around freely.
The floor is covered with deep litter about 5 cm thickness deep layer.
The distance between two houses should be at least 20 meters and young stock house should be at least 50 to 100 meters away from the adult house.
                      ''',
                    ),
                  ],
                ),
              ),
            ],
          ),
          isActive: _currentStep >= 3),
      Step(
          title: Text('Housing'),
          content: Column(
            children: [
              // Placeholder(
              //   color: Colors.amber,
              //   fallbackHeight: 250,
              // ),

              Container(
                padding: EdgeInsets.all(2),
                child: ListBody(
                  children: <Widget>[
                    Container(
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
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'House Design',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      'When keeping turkeys under free range system, two houses are recommended to be constructed, one for brooding because mortality rate may increase due to stamping. And another for growing or finishing.',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Width',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      'The house should not be more than 10 meters wide. Width above that have difficulties with ventilation.',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Height',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      '''In terms of house length, any length can be used but the house should be at a reasonable distance from other houses to minimize the spread of diseases.
                      ''',
                    ),
                  ],
                ),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          isActive: _currentStep >= 4),
      Step(
          title: Text('Feeding'),
          content: Column(
            children: [
              // Placeholder(
              //   color: Colors.amber,
              //   fallbackHeight: 250,
              // ),

              Container(
                padding: EdgeInsets.all(2),
                child: ListBody(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/feeding.jpg'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Feeding',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontFamily: 'Source Sans Pro'),
                        softWrap: true,
                      ),
                    ),
                    Text(
                      'Turkey are very sensitive to coccidiostats feed than chickens so it is not recommended to feed them layers or broilers feed.\nThey need to be able to consume the required amount of feed efficiently on a regular basis to achieve their body mass.\nIt is very important to take note that during the first 4 weeks there is development in skeleton, immune system and cardiovascular system takes place so any slit change in crude protein level will have a major impact on the mentioned factors\nIt’s a big mistake to add grain to manufactured feed because this dilutes the nutrient concentration of diet and can negatively affect turkey performance.',
                      style: TextStyle(
                          fontSize: 16, fontFamily: 'Source Sans Pro'),
                      softWrap: true,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Recommended Feeding',
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
                              'Age(weeks)',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Crude Protein',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Feed Type',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                        rows: <DataRow>[
                          DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Text('0-4'),
                              ),
                              DataCell(
                                Text('27 - 28 %'),
                              ),
                              DataCell(
                                Text('Turkey crumble'),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Text('5-7'),
                              ),
                              DataCell(
                                Text('27 - 28 %'),
                              ),
                              DataCell(
                                Text('Turkey Rearer'),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Text('7-16'),
                              ),
                              DataCell(
                                Text('20 - 24 %'),
                              ),
                              DataCell(
                                Text('Turkey Grower'),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Text('7-16'),
                              ),
                              DataCell(
                                Text('20 - 24'),
                              ),
                              DataCell(
                                Text('Turkey Finisher'),
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
          isActive: _currentStep >= 5),

      Step(
          title: Text('Vaccination and Diseases'),
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
                        'Diseases ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      'The major common diseases of turkey are Blackhead and Newcastle but we also have fowl cholera, fowl pox and haemorrhagic enteritis which can also cause heavy losses.',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 30),
                      child: Text(
                        '1  Blackhead',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Source Sans Pro'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text(
                        'This disease attacks turkeys of all ages, and it shows few symptoms. It is very difficult to diagnose this disease because it may wrongly interpreted as Coccidiosis. Some signs may be dropping wings.',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 30),
                      child: Text(
                        '2  Newcastle',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text(
                        '''Although Newcastle is the major problem in turkey, it is always wise to vaccinate against it because it lead to serious disruption of eggs production. Turkeys should be revaccinated after 3 to 4 months.
                        ''',
                      ),
                    ),
                    Text(
                      'Vaccination Program',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'There is common mistake among farmers to keep different bird species together, like chickens and turkey this practice is not recommended because chickens are the most deadly carriers of several diseases that can be transmitted to turkeys.\nIn order to maintain a good health flock routine, the vaccination program has be to observed strictly.',
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: <DataColumn>[
                          DataColumn(
                            label: Text(
                              'Age(weeks)',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Disease',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Admnistration',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                        rows: <DataRow>[
                          DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Text('1'),
                              ),
                              DataCell(
                                Text('Lasota'),
                              ),
                              DataCell(
                                Text('Drinking Water'),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Text('8'),
                              ),
                              DataCell(
                                Text('Fowl Typhiod'),
                              ),
                              DataCell(
                                Text('Drinking Water'),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Text('8'),
                              ),
                              DataCell(
                                Text('Coccidiostats'),
                              ),
                              DataCell(
                                Text('Drinking Water'),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Text('12'),
                              ),
                              DataCell(
                                Text('Fowl Pox'),
                              ),
                              DataCell(
                                Text('Wing Web'),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Text('12'),
                              ),
                              DataCell(
                                Text('Lasota'),
                              ),
                              DataCell(
                                Text('Drinking Water'),
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
              PlacedHolder(context: context),
              Container(
                padding: EdgeInsets.all(2),
                child: ListBody(
                  children: <Widget>[
                    Text(
                      'Managing people, equipment’s and animal’s movement is one of best security measure in any poultry farm because of their potential in carrying diseases.',
                    ),
                    Text(
                      'Another way of reducing disease exposure is separately locating brooding house from growing and reproductive houses.',
                    ),
                    Text(
                      'Do not allow scavenging birds to move in the farm/khola to prevent transmission of diseases.',
                    ),
                    Text(
                      '''Have special shoes/boots to use in the farm (houses). Place a foot bath with disinfectans such as viral kill or industrial lime at the entrace of the farm.
                      ''',
                    ),
                  ],
                ),
              ),
            ],
          ),
          isActive: _currentStep >= 7),
    ];
    return _steps;
  }
}
