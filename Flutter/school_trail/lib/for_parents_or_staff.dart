import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_trail/signup.dart';

// FOR STAFF PAGE

class ForStaffPage extends StatefulWidget {
  const ForStaffPage({super.key});

  @override
  State<ForStaffPage> createState() => _ForStaffPageState();
}

class _ForStaffPageState extends State<ForStaffPage> {
  @override
  Widget build(BuildContext context) {
    double width = double.parse(MediaQuery.of(context).size.width.toStringAsFixed(0)); // Get screen Width
    double height = double.parse(MediaQuery.of(context).size.height.toStringAsFixed(0)); // Get screen Height
    print(width);
    print(height);


    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(), // Expand image to entire screen
        decoration: BoxDecoration( // Set background image and colour
          color: const Color.fromRGBO(243, 245, 249, 1).withOpacity(0.8),
          image: const DecorationImage(
            image: AssetImage("assets/images/fullbackground_imgv2.png"),
            fit: BoxFit.cover,
          )
        ),
        child: Column(
          children: [
            // SCHOOL TRAIL LOGO AND TEXT
            Padding(
              padding: const EdgeInsets.only(top: 50), // NTS: adjust for device size
              child: Row(
                children: [
                  const Expanded(child: Text("")), // Left indent for aligning widgets below
                  Container(
                    width: 53, // NTS: adjust for device size
                    height: 54,
                    decoration: const BoxDecoration( // Set logo image
                      image: DecorationImage(
                        image: AssetImage("assets/images/logo.png"),
                        fit: BoxFit.cover,
                        )
                    ),
                  ),
                  const Text(
                    "SCHOOL TRAIL",
                    style: TextStyle(
                      fontFamily: "Rajdhani",
                      fontSize: 30, // NTS: adjust for device size
                    ),
                    ),
                    const Expanded(child: Text("")), // Right indent for aligning widgets above
                ],
              ),
            ),
            // CONTAINER WITH EVERYTHING INSIDE
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                width: 350, // NTS: adjust for device size
                height: 560,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)), // Make container borders more rounded
                  boxShadow: [ // Container shadow settings
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Colour of shadow
                      offset: const Offset(0, 3), // Offset of shadow from container
                      spreadRadius: 3, // Size of shadow
                      blurRadius: 7, // Blur effect
                    )
                  ]
                ),
                child: Column( // Column with everything inside container
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15), // NTS: adjust for device size
                      child: Container( // Container with staff image
                        width: 210, //NTS: adjust for device size
                        height: 200,
                        alignment: Alignment.topCenter,
                        decoration: const BoxDecoration( // Set staff image
                        image: DecorationImage(
                          image: AssetImage("assets/images/staff.png"),
                          alignment: Alignment.topCenter,
                        )
                      ),
                      ),
                    ),

                    // SCHOOL STAFF TEXT
                    const Padding(
                      padding: EdgeInsets.only(top: 10), // NTS: adjust for device size
                      child: Text(
                        "For School Staff",
                        style: TextStyle(
                          fontFamily: "Calistoga",
                          fontSize: 26, // NTS: adjust for device size
                          color: Color.fromRGBO(146, 115, 87, 1)
                        ),
                        ),
                    ),

                    // REGISTER YOUR SCHOOL TEXT
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "Register your school",
                        style: TextStyle(
                          fontFamily: "Calistoga",
                          fontSize: 14, // NTS: adjust for device size
                          color: Color.fromRGBO(70, 59, 49, 1),
                        ),
                        ),
                    ),

                    // PARAGRAPH TEXT
                    const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        "Start managing your day-to-day\nadministrative tasks, from enrolling\nstudents and tracking their progress to\ncreating courses and handling payments.\nAdd instructors and other staff to help the\nteam stay on track.",
                        textAlign: TextAlign.center, // Align text to be centered
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14, //NTS: adjust for device size
                        ),
                        ),
                    ),

                    // REGISTER SCHOOL BUTTON
                    Padding(
                      padding: const EdgeInsets.only(top: 15), // NTS: adjust for device size
                      child: SizedBox(
                        height: 50, // NTS: adjust for device size
                        width: 320,
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.of(context).pushNamed("/Home"); // Goes to page on click
                          }, 
                          style: ElevatedButton.styleFrom(
                            elevation: 2.0, // Makes shadow more pronounced
                            backgroundColor: const Color.fromRGBO(255, 221, 133, 1),
                            shadowColor: const Color.fromRGBO(173, 159, 125, 1),
                            foregroundColor: Colors.transparent,
                            surfaceTintColor: Colors.transparent,
                            side: BorderSide.none,
                          ),
                          child: const Text(
                            "Register Your School",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 16, // NTS: adjust for device size
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(80, 57, 0, 1)
                              ),
                            ),
                          ),
                      ),
                    ),

                    // OR TEXT
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "or",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14,
                        ),
                        ),
                    ),

                    // LOGIN BUTTON
                    TextButton(
                      onPressed: (){
                        Navigator.of(context).pushNamed("/Login"); // Goes to page on click
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => 
                    // ChangeNotifierProvider.value(value: MyAppState(), child: MyHomePage(),),
                    // maintainState: true)); // Goes to page on click
                      }, 
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.transparent,
                          shadows: [ // I make the original text transparent and use a shadow instead to position it better above the underline
                            Shadow(
                              color: Color.fromRGBO(45, 62, 74, 1),
                              offset: Offset(0, -1))
                            ],
                          fontFamily: "Poppins-SemiBold",
                          fontSize: 16, // NTS: adjust for device size
                          decoration: // Add Underline
                            TextDecoration.underline,
                            decorationColor: Colors.black,
                            decorationThickness: 1,
                        ),
                      )
                    )

                  ],
                ),
              ),
            ),

          ],
        ),
      )
    );
  }
}

// FOR PARENTS PAGE

class ForParentsPage extends StatefulWidget {
  const ForParentsPage({super.key});

  @override
  State<ForParentsPage> createState() => _ForParentsPageState();
}

class _ForParentsPageState extends State<ForParentsPage> {
  @override
  Widget build(BuildContext context) {
    double width = double.parse(MediaQuery.of(context).size.width.toStringAsFixed(0)); // Get screen Width
    double height = double.parse(MediaQuery.of(context).size.height.toStringAsFixed(0)); // Get screen Height
    print(width);
    print(height);


    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(), // Expand image to entire screen
        decoration: BoxDecoration( // Set background image and colour
          color: const Color.fromRGBO(243, 245, 249, 1).withOpacity(0.8),
          image: const DecorationImage(
            image: AssetImage("assets/images/fullbackground_imgv2.png"),
            fit: BoxFit.cover,
          )
        ),
        child: Column(
          children: [
            // SCHOOL TRAIL LOGO AND TEXT
            Padding(
              padding: const EdgeInsets.only(top: 50), // NTS: adjust for device size
              child: Row(
                children: [
                  const Expanded(child: Text("")), // Left indent for aligning widgets below
                  Container(
                    width: 53, // NTS: adjust for device size
                    height: 54,
                    decoration: const BoxDecoration( // Set logo image
                      image: DecorationImage(
                        image: AssetImage("assets/images/logo.png"),
                        fit: BoxFit.cover,
                        )
                    ),
                  ),
                  const Text(
                    "SCHOOL TRAIL",
                    style: TextStyle(
                      fontFamily: "Rajdhani",
                      fontSize: 30, // NTS: adjust for device size
                    ),
                    ),
                    const Expanded(child: Text("")), // Right indent for aligning widgets above
                ],
              ),
            ),
            // CONTAINER WITH EVERYTHING INSIDE
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                width: 350, // NTS: adjust for device size
                height: 560,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)), // Make container borders more rounded
                  boxShadow: [ // Container shadow settings
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Colour of shadow
                      offset: const Offset(0, 3), // Offset of shadow from container
                      spreadRadius: 3, // Size of shadow
                      blurRadius: 7, // Blur effect
                    )
                  ]
                ),
                child: Column( // Column with everything inside container
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15), // NTS: adjust for device size
                      child: Container( // Container with parents image
                        width: 188, //NTS: adjust for device size
                        height: 200,
                        alignment: Alignment.topCenter,
                        decoration: const BoxDecoration( // Set parents image
                        image: DecorationImage(
                          image: AssetImage("assets/images/parents.png"),
                          alignment: Alignment.topCenter,
                        )
                      ),
                      ),
                    ),

                    // FOR PARENTS TEXT
                    const Padding(
                      padding: EdgeInsets.only(top: 10), // NTS: adjust for device size
                      child: Text(
                        "For Parents",
                        style: TextStyle(
                          fontFamily: "Calistoga",
                          fontSize: 26, // NTS: adjust for device size
                          color: Color.fromRGBO(146, 115, 87, 1)
                        ),
                        ),
                    ),

                    // TRACK YOUR CHILDREN'S PROGRESS TEXT
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "Track your children's progress",
                        style: TextStyle(
                          fontFamily: "Calistoga",
                          fontSize: 14, // NTS: adjust for device size
                          color: Color.fromRGBO(70, 59, 49, 1),
                        ),
                        ),
                    ),

                    // PARAGRAPH TEXT
                    const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        "See what your children are learning and\nhow they are developing via course\nsummaries, grades and daily reports.\nCommunicate with their teachers and\nschool administrators for the latest\nupdates.",
                        textAlign: TextAlign.center, // Align text to be centered
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14, //NTS: adjust for device size
                        ),
                        ),
                    ),

                    // SIGN UP BUTTON
                    Padding(
                      padding: const EdgeInsets.only(top: 15), // NTS: adjust for device size
                      child: SizedBox(
                        height: 50, // NTS: adjust for device size
                        width: 320,
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => 
                            ChangeNotifierProvider.value(value: MyAppState(), child: const SignUpPage(),),
                            maintainState: false)); // Goes to page on click
                          }, 
                          style: ElevatedButton.styleFrom(
                            elevation: 2.0, // Makes shadow more pronounced
                            backgroundColor: const Color.fromRGBO(255, 221, 133, 1),
                            shadowColor: const Color.fromRGBO(173, 159, 125, 1),
                            foregroundColor: Colors.transparent,
                            surfaceTintColor: Colors.transparent,
                            side: BorderSide.none,
                          ),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 16, // NTS: adjust for device size
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(80, 57, 0, 1)
                              ),
                            ),
                          ),
                      ),
                    ),

                    // OR TEXT
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "or",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14,
                        ),
                        ),
                    ),

                    // LOGIN BUTTON
                    TextButton(
                      onPressed: (){
                        Navigator.of(context).pushNamed("/Login"); // Goes to page on click
                      }, 
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.transparent,
                          shadows: [ // I make the original text transparent and use a shadow instead to position it better above the underline
                            Shadow(
                              color: Color.fromRGBO(45, 62, 74, 1),
                              offset: Offset(0, -1))
                            ],
                          fontFamily: "Poppins-SemiBold",
                          fontSize: 16, // NTS: adjust for device size
                          decoration: // Add Underline
                            TextDecoration.underline,
                            decorationColor: Colors.black,
                            decorationThickness: 1,
                        ),
                      )
                    )

                  ],
                ),
              ),
            ),

          ],
        ),
      )
    );
  }
}