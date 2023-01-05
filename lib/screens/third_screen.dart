import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/map image.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color:
                      const Color.fromARGB(255, 169, 30, 233).withOpacity(0.2)),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  appbarWidget(),
                ],
              ),
            ),
            createBody(
              context,
            )
          ],
        ),
      ),
    );
  }

//appbar widget
  Widget appbarWidget() {
    return Row(
      children: const [
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        Spacer(),
        Icon(
          Icons.search,
          color: Colors.black,
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }

//create body
  Widget createBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, top: 250),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        height: 600,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                          image: AssetImage('assets/images/img2.webp'),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 40,
                    width: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(255, 167, 76, 175),
                          Color.fromARGB(255, 149, 33, 243),
                        ],
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Set Appoinment',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text(
                    'Dr. Andrew Smith',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  starIconWidget(Colors.amber),
                  starIconWidget(Colors.amber),
                  starIconWidget(Colors.amber),
                  starIconWidget(Colors.amber),
                  starIconWidget(Colors.grey),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              Row(
                children: const [
                  Text(
                    'Cardiac Specialist',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '4.0(7.5k Reviews)',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  rowText('365', 'Cardiac'),
                  rowText('255', 'Specialist'),
                  rowText('108', 'Appoinment'),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: const [
                  Text(
                    'Career History',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    'Learning History',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              listviewWidget(),
            ],
          ),
        ),
      ),
    );
  }

  //list view builder
  List<Color> color = [
    Colors.red,
    Colors.blue,
    Colors.amber,
  ];

  List<String> text = [
    'UC',
    'SL',
    'IM',
  ];
  Widget listviewWidget() {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 3,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 20,
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: color[index],
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  text[index],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Cardiac Specialist',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 5,),
                Text(
                  'School of Medicine Technology',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  //row text
  Widget rowText(String text1, String text2) {
    return Column(
      children: [
        Text(
          text1,
          style: const TextStyle(
            color: Colors.pink,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text2,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  //star icon widget
  Widget starIconWidget(Color color) {
    return Icon(
      Icons.star,
      size: 12,
      color: color,
    );
  }
}
