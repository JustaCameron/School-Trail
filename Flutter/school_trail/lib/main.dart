import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:developer';
import 'dart:math';
import 'dart:ui';
import 'package:collection/collection.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:school_trail/for_parents_or_staff.dart';
import 'package:school_trail/signup.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false, //removes the debug tag
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          fontFamily: 'Open Sans',
        ),
        home: const MyHomePage(), // Sets home page

        // ROUTES FOR GOING TO DIFFERENT PAGES
        routes: <String, WidgetBuilder>{
          "/Home": (BuildContext context) => const MyHomePage(),
          "/ForStaff": (BuildContext context) => const ForStaffPage(),
          "/ForParents": (BuildContext context) => const ForParentsPage(),
          "/SignUp": (BuildContext context) => const SignUpPage(),
        }
      ),
    );
  }
}

// Controls state of app
class MyAppState extends ChangeNotifier {
  
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Home Screen
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
            // LOGO & SUBTEXT
            if (height == 783 && width == 393) // For 1080x2220 resolution
              Padding(
                padding: const EdgeInsets.only(top: 50), // NTS: adjust for device size
                child: Container(
                  width: 89, // NTS: adjust for device size
                  height: 89,
                  decoration: const BoxDecoration( // Set logo image
                    image: DecorationImage(
                      image: AssetImage("assets/images/logo.png"),
                      fit: BoxFit.cover,
                      )
                  ),
                ),
              ),
            if (height == 759 && width == 393) // For 1080x2220 resolution Android 10<
              Padding(
                padding: const EdgeInsets.only(top: 40), // NTS: adjust for device size
                child: Container(
                  width: 89, // NTS: adjust for device size
                  height: 89,
                  decoration: const BoxDecoration( // Set logo image
                    image: DecorationImage(
                      image: AssetImage("assets/images/logo.png"),
                      fit: BoxFit.cover,
                      )
                  ),
                ),
              ),
            const Text( // Text under logo
              "SCHOOL TRAIL",
              style: TextStyle(
                fontFamily: "Rajdhani",
                fontSize: 38, // NTS: adjust for device size
              ),
            ),

            // TEXT UNDER LOGO & SUBTEXT
            const Padding(
              padding: EdgeInsets.only(top: 40, left: 20, right: 20), // NTS: adjust for device size
              child: Text(
                "A simple way to keep track \nof classes and students",
                textAlign: TextAlign.center, // Keeps text centered
                style: TextStyle(
                  fontFamily: "Calistoga",
                  fontSize: 38, // NTS: adjust for device size
                  letterSpacing: 0.0,
                  height: 1.1,
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20), // NTS: adjust for device size
              child: Text(
                "Whether you're a school staff member or\nparent, there's a place for you at School\nTrail. Track student progress from daycare\nthrough high school in our centralised,\neasy-to-use system.",
                textAlign: TextAlign.center, // Keeps text centered
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 14, // NTS: adjust for device size
                  color: Color.fromRGBO(90, 109, 124, 1)
                ),
              ),
            ),

            // FOR SCHOOL STAFF BUTTON
            Padding(
              padding: const EdgeInsets.only(top: 15), // NTS: adjust for device size
              child: SizedBox(
                height: 50, // NTS: adjust for device size
                width: 320,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).pushNamed("/ForStaff"); // Goes to page on click
                  }, 
                  style: ElevatedButton.styleFrom(
                    elevation: 2.0, // Makes shadow more pronounced
                    backgroundColor: const Color.fromRGBO(255, 221, 133, 1),
                    shadowColor: const Color.fromRGBO(173, 159, 125, 1),
                    foregroundColor: Colors.transparent,
                    surfaceTintColor: Colors.transparent,
                    side: BorderSide.none, // Removes border line
                  ),
                  child: const Text(
                    "For School Staff",
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

            // FOR PARENTS BUTTON
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 5), // NTS: adjust for device size
              child: SizedBox(
                height: 50, // NTS: adjust for device size
                width: 320,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).pushNamed("/ForParents"); // Goes to page on click
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
                    "For Parents",
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

            // SEE SCHOOL PRICING PLANS BUTTON
            TextButton(
              onPressed: (){}, 
              child: const Text(
                "See School Pricing Plans",
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
      )
    );
  }
}
