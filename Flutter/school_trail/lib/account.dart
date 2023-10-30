import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});
  static DateTime selectedDate = DateTime.now();

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

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

    TextStyle profileTextStyle = const TextStyle(
                          fontFamily: "Poppins-SemiBold",
                          fontSize: 14,
                          color: Color.fromRGBO(22, 40, 54, 1)
                        );

    var accountName = "Shakira Lee";
    var accountType = "Administrator";

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
                          decoration: const BoxDecoration( // Set edit image
                            image: DecorationImage(
                              image: AssetImage("assets/images/edit.png"), // Not interactable yet
                              fit: BoxFit.cover,
                              )
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,) // Bit of space for aligning
                    ],
                  ),
                  const SizedBox(height: 15,), // Bit of space for aligning
            
                  // PROFILE INFORMATION TEXT
                  const Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 5), // NTS
                    child: Text(
                      "Profile Information",
                      style: TextStyle(
                        fontFamily: "Calistoga",
                        fontSize: 18,
                        color: Color.fromRGBO(146, 115, 87, 1)
                      )
                    ),
                  ),

                  // PROFILE SECTION
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 5),
                    child: Container( // Profile Container
                      height: 550,
                      width: width/1.08,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10, top: 15),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Container( // Green placeholder container
                                    height: 120,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      color: const Color.fromRGBO(155, 196, 131, 1),
                                      borderRadius: BorderRadius.circular(100),
                                      image: const DecorationImage(
                                        image: AssetImage("assets/images/dog.png"), // temp image
                                        fit: BoxFit.cover,
                                        )
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding( 
                                    padding: const EdgeInsets.only(top: 25, left: 20), // NTS
                                    child: Row(
                                      children: [
                                        Text(
                                          accountName, // Account name
                                          style: const TextStyle(
                                            fontFamily: 'Poppins-SemiBold',
                                            fontSize: 16,
                                            color: Color.fromRGBO(45, 62, 74, 1)
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text( 
                                          accountType, // Account type
                                          style: const TextStyle(
                                            fontFamily: 'Poppins-SemiBold',
                                            fontSize: 14,
                                            color: Color.fromRGBO(90, 109, 124, 1)
                                          ),
                                        ),

                                        const SizedBox(height: 10,), // Spacing
                                        // Edit Profile Button
                                        OutlinedButton(
                                          onPressed:() {
                                            // Nothing yet
                                          }, 
                                          style: OutlinedButton.styleFrom( // Button config
                                            side: BorderSide.none,
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                            backgroundColor: const Color.fromRGBO(56, 97, 125, 1),
                                          ),
                                          child: const Text(
                                            "Edit Profile",
                                            style: TextStyle(
                                              fontFamily: 'Poppins-SemiBold',
                                              fontSize: 14,
                                              color: Colors.white,
                                            ),
                                          )
                                          )
                                      ],
                                    ),
                                  ),
                                ],
                                
                              )
                            ],
                          ),
                          const SizedBox(height: 10,), // Spacing
                          const Divider(indent: 15, endIndent: 15,), // Divider

                          // MESSAGES BUTTON
                          SizedBox(
                            width: width/1.1,
                            child: OutlinedButton(
                              onPressed:() {
                                Navigator.of(context).pushNamed("/Messages");
                              }, 
                              style: OutlinedButton.styleFrom( // Button config
                                side: BorderSide.none,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                              child: Row(
                                children: [
                                  Container( // Container with Icon Image
                                    width: 25,
                                    height: 25,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("assets/images/message.png"),
                                        ),
                                    ),
                                  ), // Messages icon
                                  const SizedBox(width: 10,), // Spacing
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Messages",
                                      style: profileTextStyle,
                                    ),
                                  ),
                                  const Expanded(flex: 10, child: Text("")), // Spacing
                                  
                                  // Right arrow icon
                                  const Expanded(
                                    child: Icon(
                                      Icons.chevron_right,
                                      color: Colors.black,
                                      )
                                    ),
                                ],
                              )
                              ),
                          ),

                          // ADDRESSES BUTTON
                          SizedBox(
                            width: width/1.1,
                            child: OutlinedButton(
                              onPressed:() {
                                // Nothing yet
                              }, 
                              style: OutlinedButton.styleFrom( // Button config
                                side: BorderSide.none,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                              child: Row(
                                children: [
                                  Container( // Container with Icon Image
                                    width: 25,
                                    height: 25,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("assets/images/address.png"),
                                        ),
                                    ),
                                  ), // Addresses icon
                                  const SizedBox(width: 10,), // Spacing
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Addresses",
                                      style: profileTextStyle,
                                    ),
                                  ),
                                  const Expanded(flex: 10, child: Text("")), // Spacing
                                  
                                  // Right arrow icon
                                  const Expanded(
                                    child: Icon(
                                      Icons.chevron_right,
                                      color: Colors.black,
                                      )
                                    ),
                                ],
                              )
                              ),
                          ),

                          // MY SCHOOLS BUTTON
                          SizedBox(
                            width: width/1.1,
                            child: OutlinedButton(
                              onPressed:() {
                                // Nothing yet
                              }, 
                              style: OutlinedButton.styleFrom( // Button config
                                side: BorderSide.none,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                              child: Row(
                                children: [
                                  Container( // Container with Icon Image
                                    width: 25,
                                    height: 25,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("assets/images/school.png"),
                                        ),
                                    ),
                                  ), // My Schools icon
                                  const SizedBox(width: 10,), // Spacing
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "My Schools",
                                      style: profileTextStyle,
                                    ),
                                  ),
                                  const Expanded(flex: 10, child: Text("")), // Spacing
                                  
                                  // Right arrow icon
                                  const Expanded(
                                    child: Icon(
                                      Icons.chevron_right,
                                      color: Colors.black,
                                      )
                                    ),
                                ],
                              )
                              ),
                          ),

                          // MY STAFF BUTTON
                          SizedBox(
                            width: width/1.1,
                            child: OutlinedButton(
                              onPressed:() {
                                // Nothing yet
                              }, 
                              style: OutlinedButton.styleFrom( // Button config
                                side: BorderSide.none,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 25,
                                    height: 25,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("assets/images/mystaff.png"),
                                        ),
                                    ),
                                  ), // My Staff icon
                                  const SizedBox(width: 10,), // Spacing
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "My Staff",
                                      style: profileTextStyle,
                                    ),
                                  ),
                                  const Expanded(flex: 10, child: Text("")), // Spacing
                                  
                                  // Right arrow icon
                                  const Expanded(
                                    child: Icon(
                                      Icons.chevron_right,
                                      color: Colors.black,
                                      )
                                    ),
                                ],
                              )
                              ),
                          ),

                          const Divider(indent: 15, endIndent: 15,), // Divider

                          // CHANGE PASSWORD BUTTON
                          SizedBox(
                            width: width/1.1,
                            child: OutlinedButton(
                              onPressed:() {
                                // Nothing yet
                              }, 
                              style: OutlinedButton.styleFrom( // Button config
                                side: BorderSide.none,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 25,
                                    height: 25,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("assets/images/password.png"),
                                        ),
                                    ),
                                  ), // Change Password icon
                                  const SizedBox(width: 10,), // Spacing
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Change Password",
                                      style: profileTextStyle,
                                    ),
                                  ),
                                  const Expanded(flex: 10, child: Text("")), // Spacing
                                  
                                  // Right arrow icon
                                  const Expanded(
                                    child: Icon(
                                      Icons.chevron_right,
                                      color: Colors.black,
                                      )
                                    ),
                                ],
                              )
                              ),
                          ),

                          // NOTIFICATIONS BUTTON
                          SizedBox(
                            width: width/1.1,
                            child: OutlinedButton(
                              onPressed:() {
                                Navigator.of(context).pushNamed("/Notifications");
                              }, 
                              style: OutlinedButton.styleFrom( // Button config
                                side: BorderSide.none,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 25,
                                    height: 25,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("assets/images/notification.png"),
                                        ),
                                    ),
                                  ), // Notifications icon
                                  const SizedBox(width: 10,), // Spacing
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Notifications",
                                      style: profileTextStyle,
                                    ),
                                  ),
                                  const Expanded(flex: 10, child: Text("")), // Spacing
                                  
                                  // Right arrow icon
                                  const Expanded(
                                    child: Icon(
                                      Icons.chevron_right,
                                      color: Colors.black,
                                      )
                                    ),
                                ],
                              )
                              ),
                          ),

                          const Divider(indent: 15, endIndent: 15,), // Divider

                          // SIGN OUT BUTTON
                          SizedBox(
                            width: width/1.1,
                            child: OutlinedButton(
                              onPressed:() {
                                Navigator.of(context).pushNamed("/Login");
                              }, 
                              style: OutlinedButton.styleFrom( // Button config
                                side: BorderSide.none,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 25,
                                    height: 25,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("assets/images/signout.png"),
                                        ),
                                    ),
                                  ), // Sign out icon
                                  const SizedBox(width: 10,), // Spacing
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Sign Out",
                                      style: profileTextStyle,
                                    ),
                                  ),
                                  const Expanded(flex: 10, child: Text("")), // Spacing
                                  
                                  // Right arrow icon
                                  const Expanded(
                                    child: Icon(
                                      Icons.chevron_right,
                                      color: Colors.black,
                                      )
                                    ),
                                ],
                              )
                              ),
                          ),

                        ],
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