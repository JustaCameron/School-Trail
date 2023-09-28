import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

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
    
    // Phonics
    Container phonics = Container(
                          height: 36,
                          width: 36,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/phonics.png")
                              )
                          ),
                        );

    // Math Basics
    Container mathBasics = Container(
                          height: 36,
                          width: 36,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/math.png")
                              )
                          ),
                        );

    var studentsCount = 0;
    var classesCount = 0;
    var staffMembersCount = 0;
    var assignmentsCount = 0;

    var accountName = "Shakira Lee";
    var accountType = "Administrator";
    
    // Temporary time variables to fill schedule/activities with variables it should be able to support
    String formattedTimeFrom = DateFormat.jm().format(DateTime.now()); // Get current time as just hours and minutes
    DateTime? now = DateTime.now();
    String formattedTimeTo = DateFormat.jm().format(DateTime(now.year, now.month, now.day, now.hour+1, now.minute+30)); // Get current time as just hours and minutes but it's the next hour + 30 minutes
    print(formattedTimeFrom);
    print(formattedTimeTo);

    // More temporary time variables
    var timeMap = {"Pre-K Math": (formattedTimeFrom, formattedTimeTo), "Phonics": (formattedTimeFrom, formattedTimeTo)};
    print(timeMap.entries.elementAt(0));
    print(timeMap.entries.elementAt(0).value.$1);

    // Temporary activities
    var activeClasses = {"Phonics": (15, 8), "Math Basics": (15, 8)};

    var selectedIndex = 0;
    
    // For bottom navigation bar
    void onItemTapped(int index) {
      setState(() {
        selectedIndex = index; // 0 = Student, 1 = Terms, 2 = Contacts, 3 = Account

        switch(selectedIndex){
          case 0: // Students
            Navigator.of(context).pushNamed("/Students"); // Goes to page on click
            break;
          case 1: // Terms
            Navigator.of(context).pushNamed("/Home"); // Goes to page on click
            break;
          case 2: // Contacts
            Navigator.of(context).pushNamed("/Home"); // Goes to page on click
            break;
          case 3: // Account
            Navigator.of(context).pushNamed("/Home"); // Goes to page on click
            break;
        }
      });
    }


    return SafeArea(
      child: Scaffold(
        body: Container(
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
                    const Padding( // NTS
                      padding: EdgeInsets.only(top: 23, left: 40, right: 0), // NTS
                      child: Text(
                        "STEP BY STEP PRESCHOOL &\nKINDERGARTEN -\nADMINISTRATOR DASHBOARD",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14,
                          color: Color.fromRGBO(45, 62, 74, 1),
                          fontWeight: FontWeight.bold,
                        )
                        ),
                    ),
                    const Expanded(child: Text("")), // Indent for aligning widgets below
                    Container(
                      width: 40, // NTS: adjust for device size
                      height: 40,
                      decoration: const BoxDecoration( // Set logo image
                        image: DecorationImage(
                          image: AssetImage("assets/images/account.png"),
                          fit: BoxFit.cover,
                          )
                      ),
                    ),
                    const SizedBox(width: 10,) // Bit of space for aligning
                  ],
                ),
                const SizedBox(height: 15,), // Bit of space for aligning
          
                // OVERVIEW TEXT
                const Padding(
                  padding: EdgeInsets.only(left: 10, bottom: 5), // NTS
                  child: Text(
                    "Overview",
                    style: TextStyle(
                      fontFamily: "Calistoga",
                      fontSize: 18,
                      color: Color.fromRGBO(146, 115, 87, 1)
                    )
                  ),
                ),
          
                Row(
                  children: [
          
                    // STUDENTS & STAFF MEMBERS
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column( // Column with everything in overview in it
                        children: [
                          Container( // STUDENTS
                            height: 40,
                            width: 180,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(66, 137, 148, 1),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Row(
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
                          ),
                          const SizedBox(height: 10,), // Bit of space for aligning
          
                          Container( // STAFF MEMBERS
                            height: 40,
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
          
                    // CLASSES & ASSIGNMENTS
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column( // Column with everything in overview in it
                        children: [
                          Container( // CLASSES
                            height: 40,
                            width: 180,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(155, 196, 131, 1),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center, // Center text within container
                              children: [
                                Text(classesCount.toString(), // The number - converted to text
                                  style: const TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                  ),
                                ),
                                const SizedBox(width: 10,), // Bit of space for aligning
                                const Text(
                                  "Classes", // The text
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
                          const SizedBox(height: 10,), // Bit of space for aligning
          
                          Container( // ASSIGNMENTS
                            height: 40,
                            width: 180,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(42, 101, 109, 1),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center, // Center text within container
                              children: [
                                Text(assignmentsCount.toString(), // The number - converted to text
                                  style: const TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                  ),
                                ),
                                const SizedBox(width: 10,), // Bit of space for aligning
                                const Text(
                                  "Assignemnts", // The text
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
          
                  ],
                ),
          
                // SCHEDULE/ACTIVITIES TEXT
                Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 5, top: 15), // NTS
                  child: Row(
                    children: [
                      const Text(
                        "Schedule/Activities",
                        style: TextStyle(
                          fontFamily: "Calistoga",
                          fontSize: 18,
                          color: Color.fromRGBO(146, 115, 87, 1)
                        )
                      ),
                      const Expanded(child: Text("")), // Left indent for aligning widgets below
          
                      // View All Schedule/Activities Button
                      TextButton(
                        onPressed: (){}, 
                        child: const Text(
                          "View All",
                          style: TextStyle(
                            color: Colors.transparent,
                            shadows: [ // I make the original text transparent and use a shadow instead to position it better above the underline
                              Shadow(
                                color: Color.fromRGBO(45, 62, 74, 1),
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
                      )
                    ],
                  ),
                ),
          
                // SHOW SCHEDULE/ACTIVITIES
                // If there is only one entry
                if (timeMap.isNotEmpty) // Check if there are activities
                  if (timeMap.length < 2)
                    for (var i=0;i<1;i++) // Shows first two activities
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          height: 40,
                          width: 370,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color.fromRGBO(231, 212, 195, 1), Colors.white], // Colors for gradient
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              stops: [0.5, 0.5], // Cut off point for gradient of each color
                              ),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // TIME AND ACTIVITY
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text("${timeMap.entries.elementAt(i).value.$1} - ${timeMap.entries.elementAt(i).value.$2}", // The times - converted to text
                                  style: const TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(80, 57, 0, 1)
                                  ),
                                ),
                              ),
                              const SizedBox(width: 60,), // Bit of space for aligning NTS
                              Text(
                                timeMap.entries.elementAt(i).key, // The text
                                style: const TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(80, 57, 0, 1)
                                ),
                              ),
                              const Expanded(child: Text("")), // Indent for aligning widgets
                            ],
                          ),
                        ),
                      ),
                // If there is more than 1 entry
                if (timeMap.isNotEmpty) // Check if there are activities
                  if (timeMap.length > 1) 
                    for (var i=0;i<=1;i++) // Shows first two activities
                      Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 10),
                        child: Container(
                          height: 40,
                          width: 370,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color.fromRGBO(231, 212, 195, 1), Colors.white], // Colors for gradient
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              stops: [0.5, 0.5], // Cut off point for gradient of each color
                              ),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // TIME AND ACTIVITY
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text("${timeMap.entries.elementAt(i).value.$1} - ${timeMap.entries.elementAt(i).value.$2}", // The times - converted to text
                                  style: const TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(80, 57, 0, 1)
                                  ),
                                ),
                              ),
                              const SizedBox(width: 70,), // Bit of space for aligning NTS
                              // const Expanded(child: Text("")), // Indent for aligning widgets
                              Text(
                                timeMap.entries.elementAt(i).key, // The text
                                style: const TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(80, 57, 0, 1)
                                ),
                              ),
                              const Expanded(child: Text("")), // Indent for aligning widgets
                            ],
                          ),
                        ),
                      ),
              
                // BREAK BUTTON
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SizedBox(
                    height: 50, // NTS: adjust for device size
                    width: 370,
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.of(context).pushNamed("/Home"); // Goes to page on click
                      }, 
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0, // Removes shadow
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.transparent,
                        surfaceTintColor: Colors.transparent,
                        side: BorderSide.none, // Removes border line
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "BREAK",
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
          
                // ACTIVE CLASSES TEXT
                Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 5, top: 15), // NTS
                  child: Row(
                    children: [
                      const Text(
                        "Active Classes",
                        style: TextStyle(
                          fontFamily: "Calistoga",
                          fontSize: 18,
                          color: Color.fromRGBO(146, 115, 87, 1)
                        )
                      ),
                      const Expanded(child: Text("")), // Left indent for aligning widgets below
          
                      // View All Active Classes Button
                      TextButton(
                        onPressed: (){}, 
                        child: const Text(
                          "View All",
                          style: TextStyle(
                            color: Colors.transparent,
                            shadows: [ // I make the original text transparent and use a shadow instead to position it better above the underline
                              Shadow(
                                color: Color.fromRGBO(45, 62, 74, 1),
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
                      )
                    ],
                  ),
                ),
                // SHOW ACTIVE CLASSES
                if (activeClasses.isNotEmpty)
                  for (var temp=0; temp <= 2; temp++) // Simulate having a lot of classes, remove later
                    for (var i=0; i < activeClasses.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 10),
                        child: SizedBox(
                          height: 75, // NTS: adjust for device size
                          width: 370,
                          child: ElevatedButton(
                            onPressed: (){
                              Navigator.of(context).pushNamed("/Home"); // Goes to activity page on click
                            }, 
                            style: ElevatedButton.styleFrom(
                              alignment: Alignment.centerLeft, // Align text
                              elevation: 0.0, // Removes shadow
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.transparent,
                              surfaceTintColor: Colors.transparent,
                              side: BorderSide.none, // Removes border line
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Row(
                              children: [
                                if (activeClasses.entries.elementAt(i).key == "Phonics")
                                  phonics, // Show phonics icon
                                if (activeClasses.entries.elementAt(i).key == "Math Basics")
                                  mathBasics, // Show math basics icon
                                
                                const SizedBox(width: 15,), // Bit of space
            
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
            
                                    // Class Name
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15), // NTS
                                      child: Text(
                                        activeClasses.entries.elementAt(i).key,
                                        style: const TextStyle(
                                          fontFamily: "Calistoga",
                                          fontSize: 20, // NTS: adjust for device size
                                          color: Color.fromRGBO(80, 57, 0, 1)
                                          ),
                                        ),
                                    ),
                                    Row(
                                      children: [
                                        // Number of Students
                                        Text(
                                          "${activeClasses.entries.elementAt(i).value.$1.toString()} Students",
                                          style: const TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 12, // NTS: adjust for device size
                                            color: Color.fromRGBO(147, 141, 131, 1)
                                            ),
                                        ),
                                        const SizedBox(width: 40,), // Bit of space
                                        // Number of Assignments
                                        Text(
                                          "${activeClasses.entries.elementAt(i).value.$2.toString()} Assignments",
                                          style: const TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 12, // NTS: adjust for device size
                                            color: Color.fromRGBO(147, 141, 131, 1)
                                            ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            ),
                        ),
                      ),

              ],
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