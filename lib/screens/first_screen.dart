import 'package:flutter/material.dart';
import 'package:medical_app/screens/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Stack(
          children: [
            createBody(),
            gridViewWidget(),
          ],
        ),
      ),
    );
  }

//create body
  Widget createBody() {
    return Column(
      children: [
        firstSection(),
      ],
    );
  }

//first section
  Widget firstSection() {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 167, 76, 175),
            Color.fromARGB(255, 149, 33, 243),
          ],
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Row(
            children: const [
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              Spacer(),
              Icon(
                Icons.search,
                color: Colors.white,
              ),
              SizedBox(
                width: 5,
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Welcome',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 35),
            child: Text(
              'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

//Gridview builder
  List<Color> colorList = [
    Colors.red,
    Colors.green,
    Colors.teal,
    Colors.blue,
    Colors.green,
    Colors.orange,
  ];

  List<IconData> icons = [
    Icons.shopping_bag,
    Icons.calendar_month,
    Icons.star,
    Icons.medical_information,
    Icons.mode,
    Icons.mail,
  ];

  List<String> firstList = [
    'Health Care',
    'Appoinments',
    'Diagnosis',
    'Medicines',
    'Insurance',
    'Analytics',
  ];

  Widget gridViewWidget() {
    return Positioned(
      top: 180,
      left: 0,
      right: 0,
      bottom: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 180,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20),
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SecondScreen(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.5),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorList[index],
                      ),
                      child: Icon(
                        icons[index],
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      firstList[index],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Cardiac Specialist',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
