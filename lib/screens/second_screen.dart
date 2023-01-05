import 'package:flutter/material.dart';
import 'package:medical_app/screens/third_screen.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int selectedIndex = 0;
  void changeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Stack(
          children: [
            createBody(),
            listViewWidget(),
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
    return Stack(
      children: [
        Container(
          height: 250,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/images.jpeg',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 250,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 169, 30, 233).withOpacity(0.5)),
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
                'Specialist',
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
        )
      ],
    );
  }

//listview builder
  List<String> imageList = [
    'assets/images/img1.jpg',
    'assets/images/img2.webp',
    'assets/images/img3.webp',
    'assets/images/imge4.webp',
  ];

  List<String> nameList = [
    'Dr. Andrew Smith',
    'Dr. James',
    'Dr. Kenedy Johnson',
    'Dr. Havana Richard',
  ];

  Widget listViewWidget() {
    return Positioned(
      top: 200,
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
            height: 20,
          ),
          shrinkWrap: true,
          itemCount: imageList.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
                onTap: () {
                  changeIndex(index);
                },
                child: selectedIndex == index
                    ? selectedContainer(imageList[index], nameList[index])
                    : unselectedContainer(imageList[index], nameList[index]));
          },
        ),
      ),
    );
  }

//selected Container
  Widget selectedContainer(String image, String names) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 167, 76, 175),
            Color.fromARGB(255, 149, 33, 243),
          ],
        ),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                names,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              const Text(
                'Cardiac Specialist',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  starIconWidget(Colors.amber),
                  starIconWidget(Colors.amber),
                  starIconWidget(Colors.amber),
                  starIconWidget(Colors.amber),
                  starIconWidget(Colors.grey),
                  const SizedBox(
                    width: 30,
                  ),
                  const Text(
                    '4.0(7.5k Reviews)',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>  ThirdScreen(),
                ),
              );
            },
            child: Container(
              height: 90,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: const Center(
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    "View more",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

//unselected container
  Widget unselectedContainer(String image, String name) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              const Text(
                'Cardiac Specialist',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  starIconWidget(Colors.amber),
                  starIconWidget(Colors.amber),
                  starIconWidget(Colors.amber),
                  starIconWidget(Colors.amber),
                  starIconWidget(Colors.grey),
                  const SizedBox(
                    width: 30,
                  ),
                  const Text(
                    '4.0(7.5k Reviews)',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>  ThirdScreen(),
                ),
              );
            },
            child: Container(
              height: 90,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
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
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    "View more",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
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
