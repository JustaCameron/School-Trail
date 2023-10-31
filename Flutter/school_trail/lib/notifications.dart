import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});
  static DateTime selectedDate = DateTime.now();

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  // For Roster & Attendance Tab
  final List<bool> selectedTab = <bool>[true, false];

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

    var accountName = "Shakira Lee";
    var accountType = "Administrator";
    

    // Current time (Temporary variable)
    String currentTime = DateFormat.Hm().format(DateTime.now());

    // Temporary Notifications (have it show latest notification when it's actually implemented)
    var unreadNotifs = {1: ("You dropped off your child today at 8:09am", const AssetImage("assets/images/notif.png")), 
                            2: ("You picked up your child at 3:16pm", const AssetImage("assets/images/notif.png")), 
                            3: ("Your child has 6 unfinished assignments", const AssetImage("assets/images/notif.png")), 
                            };

    // Temporary Notifications (have it show latest notification when it's actually implemented)
    var readNotifs = {1: ("Welcome to the Winter Quarter! Make sure to bundle up!", const AssetImage("assets/images/notif.png")), 
                            2: ("How has your experience with the app been so far? Feel free to leave a review!", const AssetImage("assets/images/notif.png")), 
                            3: ("Welcome! Pleasure to meet you, please take a look around and view all the features we have for you to use.", const AssetImage("assets/images/notif.png")), 
                            };

    // For bottom nav bar
    var selectedIndex = 3;


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

    // For All Notifications & TITLE Tab
    bool vertical = false;
    const List<Widget> tabs = <Widget>[
      Text(
        ' All Notifications ',
        style: TextStyle(
          fontFamily: 'Poppins-SemiBold',
          fontSize: 14,
          color: Color.fromRGBO(45, 62, 74, 1),
        ),
      ),
      Text(
        ' TITLE ',
        style: TextStyle(
          fontFamily: 'Poppins-SemiBold',
          fontSize: 14,
          color: Color.fromRGBO(45, 62, 74, 1),
        ),
      ),
    ];
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(child: Text("")), // Left indent for aligning widgets below
                      // SCHOOL TRAIL LOGO AND TEXT
                      Padding(
                        padding: EdgeInsets.only(top: 23, left: 40), // NTS: adjust for device size
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // const Expanded(child: Text("")), // Left indent for aligning widgets below
                            Text(
                              "Notifications",
                              style: TextStyle(
                                fontFamily: "Calistoga",
                                fontSize: 22, // NTS: adjust for device size
                                color: Color.fromRGBO(146, 115, 87, 1)
                              ),
                              ),
                              // const Expanded(child: Text("")), // Right indent for aligning widgets above
                          ],
                        ),
                      ),
                      Expanded(child: Text("")), // Spacing
                      SizedBox(width: 10,) // Bit of space for aligning
                    ],
                  ),
                  const SizedBox(height: 15,), // Bit of space for aligning
            
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 0, right: 15),
                    child: SizedBox( // Size of safe area
                      width: width,
                      height: 55,
                      child: SafeArea( // Prevents collision
                        top: false,
                            // SEARCH TEXTFIELD
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 10.0, top: 15.0, bottom: 15.0), // Change size of field
                                filled: true, // Allow colour filling
                                fillColor: Colors.white, // Fill background with colour
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1.5,
                                    color: Colors.grey.withOpacity(0.3),
                                  ),
                                  borderRadius: const BorderRadius.all(Radius.circular(10))
                                ),
                                floatingLabelBehavior: FloatingLabelBehavior.never, // Removes annoying floating label text on click
                                labelText: 'Search...', // Text shown in box
                                labelStyle: const TextStyle(
                                  fontFamily: "Poppins-SemiBold",
                                  fontSize: 14,
                                  color: Color.fromRGBO(147, 141, 131, 1)
                                ),
                                hintText: '...', // Text shown when selected
                                hintStyle: const TextStyle(
                                  fontFamily: "Poppins-SemiBold",
                                  fontSize: 14,
                                  color: Color.fromRGBO(147, 141, 131, 1)
                                ),
                                suffixIcon: const Icon(Icons.search), // Search Icon
                              ),
                            ),
                      ),
                    ),
                  ),

                  // ALL NOTIFICATIONS OR X TABS
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Center(
                      child: Container(
                        width: width/1.66,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black),
                        ),
                        child: Center(
                          child: ToggleButtons(
                            onPressed: (int index) {
                              setState(() {
                                // The button that is tapped is set to true, and the others to false.
                                for (int i = 0; i < selectedTab.length; i++) {
                                  selectedTab[i] = i == index;
                                }
                                // Index 0 = All Notifications, 1 = Title
                                
                              });
                            },
                            borderRadius: const BorderRadius.all(Radius.circular(8)),
                            selectedBorderColor: Colors.transparent,
                            disabledBorderColor: Colors.transparent,
                            renderBorder: false,
                            selectedColor: Colors.black,
                            fillColor: const Color.fromRGBO(155, 196, 131, 1),
                            color: Colors.black,
                            constraints: const BoxConstraints(
                              minHeight: 30.0,
                              minWidth: 105.0,
                            ),
                            isSelected: selectedTab,
                            children: tabs,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // UNREAD TEXT
                  const Padding(
                    padding: EdgeInsets.only(left: 15, top: 10),
                    child: Text(
                      "Unread",
                      style: TextStyle(
                        fontFamily: 'Poppins-SemiBold',
                        fontSize: 14,
                        color: Color.fromRGBO(17, 20, 50, 1)
                      ),
                    ),
                  ),
                  
                  // UNREAD NOTIFICATIONS SECTION
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 5),
                    child: Container( // Messages Container
                      // height: 550,
                      width: width/1.08,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.withOpacity(0.3), width: 1.5)
                      ),
                      child: Column(
                        children: [

                          // SHOW NOTIFICATIONS
                          if (unreadNotifs.isNotEmpty)
                            for (var i=0; i < unreadNotifs.length; i++)
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5, bottom: 0, top: 5,),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: SizedBox(
                                        height: 60, // NTS: adjust for device size
                                        width: 350,
                                        child: ElevatedButton(
                                            onPressed: () {
                                              // Nothing yet
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
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 0),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(right: 5),
                                                    child: Container( // Container with notification image
                                                      height: 60,
                                                      width: 60,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(10),
                                                        image: DecorationImage( // Make this into an Icon Button eventually
                                                          image: unreadNotifs.entries.elementAt(i).value.$2, // Not interactable yet
                                                          fit: BoxFit.cover,
                                                          )
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                // Notification Text
                                                Flexible(
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(top: 12),
                                                    child: RichText(
                                                      overflow: TextOverflow.ellipsis,
                                                      maxLines: 3,
                                                      text: TextSpan(
                                                      style: const TextStyle(
                                                        fontFamily: "Poppins-SemiBold",
                                                        fontSize: 12, // NTS: adjust for device size
                                                        color: Color.fromRGBO(45, 62, 74, 1)
                                                        ),
                                                        text: unreadNotifs.entries.elementAt(i).value.$1.toString(), // substring limits the text to a specific amount of characters
                                                      )
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          ),
                                      ),
                                    ),
                                  ),
                                  if (i != unreadNotifs.length-1) // Prevents showing a divider on the last variable which looks odd
                                    const Divider(indent: 15, endIndent: 15,), // Divider
                                ],
                              ),

                                  ],
                                ),
                              ),
                            ),

                  // PAST NOTIFICATIONS TEXT
                  const Padding(
                    padding: EdgeInsets.only(left: 15, top: 10),
                    child: Text(
                      "Past Notifications",
                      style: TextStyle(
                        fontFamily: 'Poppins-SemiBold',
                        fontSize: 14,
                        color: Color.fromRGBO(17, 20, 50, 1)
                      ),
                    ),
                  ),
                  
                  // PAST NOTIFICATIONS SECTION
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 5),
                    child: Container( // Messages Container
                      // height: 550,
                      width: width/1.08,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.withOpacity(0.3), width: 1.5)
                      ),
                      child: Column(
                        children: [

                          // SHOW NOTIFICATIONS
                          if (readNotifs.isNotEmpty)
                            for (var i=0; i < readNotifs.length; i++)
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5, bottom: 0, top: 5,),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: SizedBox(
                                        height: 70, // NTS: adjust for device size
                                        width: 350,
                                        child: ElevatedButton(
                                            onPressed: () {
                                              // Nothing yet
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
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 0),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(right: 5),
                                                    child: Container( // Container with notification image
                                                      height: 60,
                                                      width: 60,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(10),
                                                        image: DecorationImage( // Make this into an Icon Button eventually
                                                          image: readNotifs.entries.elementAt(i).value.$2, // Not interactable yet
                                                          fit: BoxFit.cover,
                                                          )
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                // Notifications Text
                                                Flexible(
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(top: 12),
                                                    child: RichText(
                                                      overflow: TextOverflow.ellipsis,
                                                      maxLines: 3,
                                                      text: TextSpan(
                                                      style: const TextStyle(
                                                        fontFamily: "Poppins-SemiBold",
                                                        fontSize: 12, // NTS: adjust for device size
                                                        color: Color.fromRGBO(45, 62, 74, 1)
                                                        ),
                                                        text: readNotifs.entries.elementAt(i).value.$1.toString(), // substring limits the text to a specific amount of characters
                                                      )
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          ),
                                      ),
                                    ),
                                  ),
                                  if (i != unreadNotifs.length-1) // Prevents showing a divider on the last variable which looks odd
                                    const Divider(indent: 15, endIndent: 15,), // Divider
                                ],
                              ),

                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20,), // Bit of space
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