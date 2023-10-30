import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});
  static DateTime selectedDate = DateTime.now();

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
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


    // Temporary Messages (have it show latest message when it's actually implemented)
    var receivedMessages = {"Mrs. Shakespare": ("Hi there!", const AssetImage("assets/images/dog.png")), 
                            "Cameron Meeks": ("League of legends is allowed in school?", const AssetImage("assets/images/avatar_two.jpg")), 
                            "John Doe": ("Mrs. Stewart gave my son detention :(", const AssetImage("assets/images/dog.png")), 
                            "Scott Crow": ("As someone who reads a lot, I am telling you, specifically, in science, no one calls jackdaws crows. If you want to be 'specific' like you said, then you shouldn't either. They're not the same thing.", const AssetImage("assets/images/crow.jpg")), 
                            "Mr. Smith": ("Project grades have been posted, please check your son's results", const AssetImage("assets/images/dog.png")),
                            "Mrs. Stewart": ("Your son has 5 more days to hand in his homework, else I'll be forced to give him detention", const AssetImage("assets/images/avatar.png")),
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
                      const Padding(
                        padding: EdgeInsets.only(top: 23, left: 40), // NTS: adjust for device size
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // const Expanded(child: Text("")), // Left indent for aligning widgets below
                            Text(
                              "Messages",
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
                  // MESSAGES SECTION
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

                          // SHOW MESSAGES
                          if (receivedMessages.isNotEmpty)
                            for (var i=0; i < receivedMessages.length; i++)
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Container( // Container with profile images
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage( // Make this into an Icon Button eventually
                                          image: receivedMessages.entries.elementAt(i).value.$2, // Not interactable yet
                                          fit: BoxFit.cover,
                                          )
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0, bottom: 5, top: 5,),
                                    child: SizedBox(
                                      height: 60, // NTS: adjust for device size
                                      width: 305,
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
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                                  
                                              Row(
                                                children: [
                                                  // Sender's name
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 10,), // NTS
                                                    child: Text(
                                                      receivedMessages.entries.elementAt(i).key,
                                                      style: const TextStyle(
                                                        fontFamily: "Poppins-SemiBold",
                                                        fontSize: 14, // NTS: adjust for device size
                                                        color: Color.fromRGBO(22, 40, 54, 1)
                                                        ),
                                                      ),
                                                  ),

                                                  const Expanded(child: Text("")), // Spacing
                                                  
                                                  // Current time
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 10),
                                                    child: Text(
                                                      currentTime,
                                                      style: const TextStyle(
                                                        fontFamily: 'Poppins-SemiBold',
                                                        color: Color.fromRGBO(22, 40, 54, 1),
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  // Latest message
                                                  Flexible(
                                                    child: RichText(
                                                      overflow: TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      text: TextSpan(
                                                      style: const TextStyle(
                                                        fontFamily: "Poppins",
                                                        fontSize: 12, // NTS: adjust for device size
                                                        color: Color.fromRGBO(22, 40, 54, 1)
                                                        ),
                                                        text: receivedMessages.entries.elementAt(i).value.$1.toString(), // substring limits the text to a specific amount of characters
                                                      )
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        ),
                                    ),
                                  ),
                                ],
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