import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TermsPage extends StatefulWidget {
  const TermsPage({super.key});
  static DateTime selectedDate = DateTime.now();

  @override
  State<TermsPage> createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {

  @override
  Widget build(BuildContext context) {
    double width = double.parse(MediaQuery.of(context).size.width.toStringAsFixed(0)); // Get screen Width
    double height = double.parse(MediaQuery.of(context).size.height.toStringAsFixed(0)); // Get screen Height
    print(width);
    print(height);

    // So I'm not typing the same thing over and over
    TextStyle drawerTextStyle = const TextStyle(
                          fontFamily: "Poppins-SemiBold",
                          fontSize: 16,
                          color: Color.fromRGBO(90, 109, 124, 1)
                        );

    var studentsCount = 0;
    var contactsCount = 0;
    var staffMembersCount = 0;
    var termsCount = 0;

    var accountName = "Shakira Lee";
    var accountType = "Administrator";
    
    // Current year (Temporary variable)
    String currentYear = DateFormat.y().format(DateTime.now());


   
    // Temporary Terms
    var activeTerms = {"Autumn Quarter": (71, 2024), "Summer Camp": (62, 2024), "Winter Quarter": (55, 2024)};

    var selectedIndex = 1;

    // List for dropdown
    List<String> items = <String>['Christmas Term', 'Spring Term', 'Fall Term', 'Summer Term'];


    // For bottom navigation bar
    void onItemTapped(int index) {
      setState(() {
        selectedIndex = index; // 0 = Student, 1 = Terms, 2 = Contacts, 3 = Account

        switch(selectedIndex){
          case 0: // Students
            Navigator.of(context).pushNamed("/Students"); // Goes to page on click
            break;
          case 1: // Terms
            Navigator.of(context).pushNamed("/Terms"); // Goes to page on click
            break;
          case 2: // Contacts
            Navigator.of(context).pushNamed("/Home"); // Goes to page on click
            break;
          case 3: // Account
            Navigator.of(context).pushNamed("/Account"); // Goes to page on click
            break;
        }
      });
    }

    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: (){ // Tapping outside of any widget will close it
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            constraints: const BoxConstraints.expand(), // Expand image to entire screen
            decoration: BoxDecoration( // Set background image
              color: const Color.fromRGBO(243, 245, 249, 1).withOpacity(0.8),
              image: const DecorationImage(
                image: AssetImage("assets/images/fullbackground_imgv2.png"),
                fit: BoxFit.cover,
              )
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // New widgets are aligned to the left
                children: [
                  // HEADING TEXT & PROFILE PICTURE ROW
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Expanded(child: Text("")), // Left indent for aligning widgets below
                      // SCHOOL TRAIL LOGO AND TEXT
                      Padding(
                        padding: const EdgeInsets.only(top: 23, left: 40), // NTS: adjust for device size
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // const Expanded(child: Text("")), // Left indent for aligning widgets below
                            Container(
                              alignment: Alignment.centerLeft,
                              width: 34, // NTS: adjust for device size
                              height: 34,
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
                                fontSize: 24, // NTS: adjust for device size
                              ),
                              ),
                              // const Expanded(child: Text("")), // Right indent for aligning widgets above
                          ],
                        ),
                      ),
                      const Expanded(child: Text("")), // Indent for aligning widgets below
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          width: 40, // NTS: adjust for device size
                          height: 40,
                          decoration: const BoxDecoration( // Set logo image
                            image: DecorationImage(
                              image: AssetImage("assets/images/account.png"),
                              fit: BoxFit.cover,
                              )
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,) // Bit of space for aligning
                    ],
                  ),
                  const SizedBox(height: 15,), // Bit of space for aligning
            
                  // TERMS TEXT
                  const Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 5), // NTS
                    child: Text(
                      "Terms",
                      style: TextStyle(
                        fontFamily: "Calistoga",
                        fontSize: 18,
                        color: Color.fromRGBO(146, 115, 87, 1)
                      )
                    ),
                  ),

                  // TERMS SECTION
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Container( // Terms Container
                      height: 180,
                      width: width/1.05,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container( // Green placeholder container
                              height: 150,
                              width: width/2.5,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(155, 196, 131, 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding( 
                                padding: const EdgeInsets.only(top: 15, left: 20), // NTS
                                child: Container( // Container with Approved or not Text
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(155, 196, 131, 1),
                                    borderRadius: BorderRadius.circular(15)
                                  ),
                                  child: const Row(
                                    children: [
                                      SizedBox(width: 10,), // Spacing
                                      Icon(Icons.check, size: 15,),
                                      SizedBox(width: 5,), // Spacing
                                      Text( // Approved or not Text (Constant for now)
                                        "Approved",
                                        style: TextStyle(
                                          fontFamily: 'Poppins-SemiBold',
                                          fontSize: 11,
                                        ),
                                      ),
                                      SizedBox(width: 10,), // Spacing
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10,),
                              const Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text( // Address
                                      "Address",
                                      style: TextStyle(
                                        fontFamily: 'Poppins-SemiBold',
                                        fontSize: 11,
                                        color: Color.fromRGBO(124, 141, 153, 1)
                                      ),
                                    ),
                                    Text( // Address Line 1 (Constant for now)
                                      "21 Dream Ave,",
                                      style: TextStyle(
                                        fontFamily: 'Poppins-SemiBold',
                                        fontSize: 12,
                                        color: Color.fromRGBO(45, 62, 74, 1)
                                      ),
                                    ),
                                    Text( // Address Line 2 (Constant for now)
                                      "Fort Lauderdale, Florida",
                                      style: TextStyle(
                                        fontFamily: 'Poppins-SemiBold',
                                        fontSize: 12,
                                        color: Color.fromRGBO(45, 62, 74, 1)
                                      ),
                                    ),
                                    Text( // Address Line 3 (Constant for now)
                                      "33253, USA",
                                      style: TextStyle(
                                        fontFamily: 'Poppins-SemiBold',
                                        fontSize: 12,
                                        color: Color.fromRGBO(45, 62, 74, 1)
                                      ),
                                    ),

                                    SizedBox(height: 10,), // Spacing

                                    Row(
                                      children: [
                                        Text( // Registered On Text
                                          "Registered On",
                                          style: TextStyle(
                                            fontFamily: 'Poppins-SemiBold',
                                            fontSize: 11,
                                            color: Color.fromRGBO(124, 141, 153, 1)
                                          ),
                                        ),
                                        SizedBox(width: 10,), // Spacing
                                        Text( // Access Code Text
                                          "Access Code",
                                          style: TextStyle(
                                            fontFamily: 'Poppins-SemiBold',
                                            fontSize: 11,
                                            color: Color.fromRGBO(124, 141, 153, 1)
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text( // Registered Date (Constant for now)
                                          "5/15/2023",
                                          style: TextStyle(
                                            fontFamily: 'Poppins-SemiBold',
                                            fontSize: 12,
                                            color: Color.fromRGBO(45, 62, 74, 1)
                                          ),
                                        ),
                                        SizedBox(width: 30,), // Spacing
                                        Text( // Access Code (Constant for now)
                                          "89j0928",
                                          style: TextStyle(
                                            fontFamily: 'Poppins-SemiBold',
                                            fontSize: 12,
                                            color: Color.fromRGBO(45, 62, 74, 1)
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),

                // SUMMARY TEXT
                const Padding(
                  padding: EdgeInsets.only(left: 10, bottom: 5), // NTS
                  child: Text(
                    "Summary",
                    style: TextStyle(
                      fontFamily: "Calistoga",
                      fontSize: 18,
                      color: Color.fromRGBO(146, 115, 87, 1)
                    )
                  ),
                ),
          
                Row( // SUMMARY SECTION
                  children: [
          
                    // STUDENTS & STAFF MEMBERS
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column( // Column with everything in term in it
                        children: [
                          Container( // STUDENTS
                            height: 70,
                            width: 180,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(66, 137, 148, 1),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center, // Center text within container
                                  children: [
                                    Text(studentsCount.toString(), // The number - converted to text
                                      style: const TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                      ),
                                    ),
                                    const SizedBox(width: 10,), // Bit of space for aligning
                                    const Text(
                                      "Students", // The text
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                      ),
                                      ),
                                  ],
                                ),

                                // ADD NEW STUDENT BUTTON
                                SizedBox(
                                  height: 30,
                                  width: 80,
                                  child: OutlinedButton(
                                    onPressed:() {
                                      // Nothing yet
                                    }, 
                                    style: OutlinedButton.styleFrom( // Button config
                                      side: const BorderSide(color: Colors.white),
                                      padding: const EdgeInsets.all(5)
                                    ),
                                    child: const Text(
                                      "Add New",
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 11,
                                        color: Colors.white,
                                      )
                                    )
                                    ),
                                ),
                                const SizedBox(height: 5), // Spacing
                              ],
                            ),
                          ),
                          const SizedBox(height: 10,), // Bit of space for aligning
          
                          Container( // STAFF MEMBERS
                            height: 70,
                            width: 180,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(112, 161, 83, 1),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center, // Center text within container
                              children: [
                                Text(staffMembersCount.toString(), // The number - converted to text
                                  style: const TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                  ),
                                ),
                                const SizedBox(width: 10,), // Bit of space for aligning
                                const Text(
                                  "Staff Members", // The text
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                  ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
          
                    // CONTACTS & TERMS
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column( // Column with everything in term in it
                        children: [
                          Container( // CONTACTS
                            height: 70,
                            width: 180,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(155, 196, 131, 1),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center, // Center text within container
                                  children: [
                                    Text(contactsCount.toString(), // The number - converted to text
                                      style: const TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                      ),
                                    ),
                                    const SizedBox(width: 10,), // Bit of space for aligning
                                    const Text(
                                      "Contacts", // The text
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                      ),
                                      ),
                                  ],
                                ),
                                // ADD CONTACT BUTTON
                                SizedBox(
                                  height: 30,
                                  width: 80,
                                  child: OutlinedButton(
                                    onPressed:() {
                                      // Nothing yet
                                    }, 
                                    style: OutlinedButton.styleFrom( // Button config
                                      side: const BorderSide(color: Colors.white),
                                      padding: const EdgeInsets.all(5)
                                    ),
                                    child: const Text(
                                      "Add New",
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 11,
                                        color: Colors.white,
                                      )
                                    )
                                    ),
                                ),
                                const SizedBox(height: 5), // Spacing
                              ],
                            ),
                          ),
                          const SizedBox(height: 10,), // Bit of space for aligning
          
                          Container( // TERMS
                            height: 70,
                            width: 180,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(42, 101, 109, 1),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center, // Center text within container
                                  children: [
                                    Text(termsCount.toString(), // The number - converted to text
                                      style: const TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                      ),
                                    ),
                                    const SizedBox(width: 10,), // Bit of space for aligning
                                    const Text(
                                      "Terms", // The text
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                      ),
                                      ),
                                  ],
                                ),
                                // ADD NEW TERM BUTTON
                                SizedBox(
                                  height: 30,
                                  width: 100,
                                  child: OutlinedButton(
                                    onPressed:() {
                                      // Nothing yet
                                    }, 
                                    style: OutlinedButton.styleFrom( // Button config
                                      side: const BorderSide(color: Colors.white),
                                      padding: const EdgeInsets.all(5)
                                    ),
                                    child: const Text(
                                      "Add New Term",
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 11,
                                        color: Colors.white,
                                      )
                                    )
                                    ),
                                ),
                                const SizedBox(height: 5), // Spacing
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
          
                  ],
                ),

                  const SizedBox(height: 10,),

                  // NUMBER OF TERMS TEXT
                  Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 5), // NTS
                    child: Text(
                      "${activeTerms.length} Terms",
                      style: const TextStyle(
                        fontFamily: "Calistoga",
                        fontSize: 18,
                        color: Color.fromRGBO(146, 115, 87, 1)
                      )
                    ),
                  ),

                // SHOW TERMS
                if (activeTerms.isNotEmpty)
                  for (var i=0; i < activeTerms.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 10),
                      child: SizedBox(
                        height: 90, // NTS: adjust for device size
                        width: 370,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                    
                                Row(
                                  // crossAxisAlignment: CrossAxisAlignment.end,
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Term name
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10,), // NTS
                                      child: Text(
                                        activeTerms.entries.elementAt(i).key,
                                        style: const TextStyle(
                                          fontFamily: "Calistoga",
                                          fontSize: 20, // NTS: adjust for device size
                                          color: Color.fromRGBO(80, 57, 0, 1)
                                          ),
                                        ),
                                    ),

                                    const Expanded(child: Text("")), // Spacing
                                    
                                    // Edit Button
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10, right: 10),
                                      child: SizedBox(
                                        height: 30,
                                        width: 50,
                                        child: OutlinedButton(
                                          onPressed:() {
                                            // Nothing yet
                                          }, 
                                          style: OutlinedButton.styleFrom( // Button config
                                            side: const BorderSide(color: Color.fromRGBO(80, 57, 0, 1)),
                                            padding: const EdgeInsets.all(5)
                                          ),
                                          child: const Text(
                                            "Edit",
                                            style: TextStyle(
                                              fontFamily: 'Poppins-SemiBold',
                                              fontSize: 11,
                                              color: Color.fromRGBO(80, 57, 0, 1),
                                            )
                                          )
                                          ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    // Number of Days
                                    Text(
                                      "${activeTerms.entries.elementAt(i).value.$1.toString()} days in term",
                                      style: const TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 13, // NTS: adjust for device size
                                        color: Color.fromRGBO(80, 57, 0, 1)
                                        ),
                                    ),
                                  ],
                                ),
                              // Term ending year
                              Text(
                                "School Year $currentYear-${activeTerms.entries.elementAt(i).value.$2.toString()}",
                                style: const TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 13, // NTS: adjust for device size
                                  color: Color.fromRGBO(80, 57, 0, 1)
                                  ),
                              ),
                              ],
                            ),
                          ),
                          ),
                      ),
                    ),
        
                ],
              ),
            ),
          ),
        ),

        // HAMBURGER MENU IN APPBAR
        extendBodyBehindAppBar: true, // Prevents appbar from affecting padding of other widgets and background
        appBar: AppBar(
          backgroundColor: Colors.transparent, // removes background color
          elevation: 0.0, // removes shadows
          leading: Builder(
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.only(top: 5),
                child: IconButton(
                  icon: const Icon( // Icon for drawer
                    Icons.menu,
                    size: 40,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer(); // Opens drawer
                  },
                  tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                ),
              );
            },
          ),
        ),
        drawer: Drawer( // NOT DONE YET
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Change padding for the ListView.
            padding: const EdgeInsets.only(left: 10), // NTS
            children: [
              // DrawerHeader(
              //   margin: const EdgeInsets.all(0),
              //   decoration: BoxDecoration( // Set background image
              //     color: const Color.fromRGBO(243, 245, 249, 1).withOpacity(0.8),
              //     image: const DecorationImage(
              //       image: AssetImage("assets/images/fullbackground_imgv2.png"),
              //       fit: BoxFit.cover,
              //     )
              //   ),
              //   child: const Text("School Trail")
              // ),

              // SCHOOL TRAIL LOGO AND TEXT
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20), // NTS: adjust for device size
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const Expanded(child: Text("")), // Left indent for aligning widgets below
                    Container(
                      alignment: Alignment.centerLeft,
                      width: 34, // NTS: adjust for device size
                      height: 34,
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
                        fontSize: 24, // NTS: adjust for device size
                      ),
                      ),
                      // const Expanded(child: Text("")), // Right indent for aligning widgets above
                  ],
                ),
              ),
              // PROFILE
              Container(
                height: 40,
                width: 50,
                margin: const EdgeInsets.only(left: 20, right: 60, top: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  children: [

                    // Avatar Image
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        width: 38, // NTS: adjust for device size
                        height: 38,
                        decoration: const BoxDecoration( // Set avatar image
                          image: DecorationImage(
                            image: AssetImage("assets/images/avatar.png"),
                            fit: BoxFit.cover,
                            )
                        ),
                      ),
                    ),
                    
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        // ACCOUNT NAME
                        Text(
                          accountName,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(45, 62, 74, 1)
                          ),
                          ),

                        // ACCOUNT TYPE 
                        Text(
                          accountType,
                          style: const TextStyle(
                            color: Colors.transparent,
                            shadows: [ // I make the original text transparent and use a shadow instead to position it better above the underline
                              Shadow(
                                color: Color.fromRGBO(22, 40, 54, 1),
                                offset: Offset(0, -1))
                              ],
                            fontFamily: "Poppins-SemiBold",
                            fontSize: 14, // NTS: adjust for device size
                            decoration: // Add Underline
                              TextDecoration.underline,
                              decorationColor: Colors.black,
                              decorationThickness: 1,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),

              ListTile(
                title: Text(
                  'Home',
                  style: drawerTextStyle,
                ),
                dense: true, // Reduce padding
                // selected: _selectedIndex == 0,
                onTap: () {
                  // Update the state of the app
                  // _onItemTapped(0);
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  'Dashboard',
                  style: drawerTextStyle,
                ),
                dense: true, // Reduce padding
                // selected: _selectedIndex == 1,
                onTap: () {
                  // Update the state of the app
                  // _onItemTapped(1);
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  'My Account',
                  style: drawerTextStyle,
                ),
                dense: true, // Reduce padding
                // selected: _selectedIndex == 2,
                onTap: () {
                  // Update the state of the app
                  // _onItemTapped(2);
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  'Sign Out',
                  style: drawerTextStyle,
                ),
                dense: true, // Reduce padding
                // selected: _selectedIndex == 2,
                onTap: () {
                  // Update the state of the app
                  // _onItemTapped(2);
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),

        // BOTTOM NAVIGATION BAR
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.school_outlined),
              label: 'Students',
              ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book),
              label: 'Terms',
              ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contacts_outlined),
              label: 'Contacts',
              ),  
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Account',
              ),  
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Colors.green,
          onTap: onItemTapped,
          ),

      ),
    );
  }
}