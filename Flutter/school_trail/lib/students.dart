import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});
  static DateTime selectedDate = DateTime.now();

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  // For Roster & Attendance Tab
  final List<bool> selectedTab = <bool>[true, false];

  String? dropDownValue; // Value of dropdown
  String? dateValue; // Value for date dropdown
  var prefixGiven = 0;

  // For term date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: StudentPage.selectedDate,
        firstDate: DateTime(2023, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != StudentPage.selectedDate) {
      setState(() {
        StudentPage.selectedDate = picked;
        //print(StudentPage.selectedDate);
      });
    }
  }
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
    
    // Student icon
    Container studentIcon = Container(
                          height: 36,
                          width: 36,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/Ellipse.png")
                              )
                          ),
                        );
    // Absent Icon
    Container absentIcon = Container(
                          height: 16,
                          width: 16,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/absent.png")
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

    // Temporary student profiles
    var studentsList = {"Abigail Richards": (formattedTimeFrom, formattedTimeTo, 'ABSENT', 'Ruel McConnell', 'Ruel McConnell'), 
                  "Gabe Vincent": (formattedTimeFrom, formattedTimeTo, 'ABSENT', 'Ruel McConnell', 'Ruel McConnell'),
                  "Jimmy Buffet": (formattedTimeFrom, formattedTimeTo, 'ABSENT', 'Ruel McConnell', 'Ruel McConnell'),
                  "Mark Hammond": (formattedTimeFrom, formattedTimeTo, 'ABSENT', 'Ruel McConnell', 'Ruel McConnell'),
                  "Cameron Meeks": (formattedTimeFrom, formattedTimeTo, 'ABSENT', 'Ruel McConnell', 'Ruel McConnell'),
                  "John Doe": (formattedTimeFrom, formattedTimeTo, 'ABSENT', 'Ruel McConnell', 'Ruel McConnell')};
    // Format: Student Name: (DropOffTime, PickUpTime, PRESENT/ABSENT, DroppedOffBy, PickedUpBy)
    print(studentsList.entries.elementAt(0));
    print(studentsList.entries.elementAt(0).value.$1);

    var activeClasses = {"Phonics": (15, 8), "Math Basics": (15, 8)};
    var selectedIndex = 0;

    // List for dropdown
    List<String> items = <String>['Christmas Term', 'Spring Term', 'Fall Term', 'Summer Term'];

    // Format list for dropdown
    List<DropdownMenuItem<String>> itemList() {
      return items.map<DropdownMenuItem<String>>(
        (e) => DropdownMenuItem(
          value: e,
          child: Text(e, style: const TextStyle(fontFamily: 'Poppins', fontSize: 14, color: Color.fromRGBO(45, 62, 74, 1)),),
        ),
      ).toList();
    }

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
    // For Roster & Attendance Tab
    bool vertical = false;
    const List<Widget> tabs = <Widget>[
      Text(
        'ROSTER',
        style: TextStyle(
          fontFamily: 'Poppins-SemiBold',
          fontSize: 14,
          color: Color.fromRGBO(45, 62, 74, 1),
        ),
      ),
      Text(
        'ATTENDANCE',
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
            
                  // STUDENTS TEXT
                  const Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 5), // NTS
                    child: Text(
                      "Students",
                      style: TextStyle(
                        fontFamily: "Calistoga",
                        fontSize: 18,
                        color: Color.fromRGBO(146, 115, 87, 1)
                      )
                    ),
                  ),
        
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 0, right: 20),
                    child: SizedBox( // Size of safe area
                      width: width/1.1,
                      height: 50,
                      child: const SafeArea( // Prevents collision
                        top: false,
                            // SEARCH TEXTFIELD
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10.0, top: 15.0, bottom: 15.0), // Change size of field
                                filled: true, // Allow colour filling
                                fillColor: Colors.white, // Fill background with colour
                                border: OutlineInputBorder(borderSide: BorderSide.none),
                                floatingLabelBehavior: FloatingLabelBehavior.never, // Removes annoying floating label text on click
                                labelText: 'Search Students', // Text shown in box
                                labelStyle: TextStyle(
                                  fontFamily: "Poppins-SemiBold",
                                  fontSize: 14,
                                  color: Color.fromRGBO(147, 141, 131, 1)
                                ),
                                hintText: '...', // Text shown when selected
                                hintStyle: TextStyle(
                                  fontFamily: "Poppins-SemiBold",
                                  fontSize: 14,
                                  color: Color.fromRGBO(147, 141, 131, 1)
                                ),
                                suffixIcon: Icon(Icons.search), // Search Icon
                              ),
                            ),
                      ),
                    ),
                  ),
            
                  // ROSTER & ATTENDANCE TABS
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Center(
                      child: Container(
                        width: width/1.8,
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
                                // Index 0 = Roster, 1 = Attendance
                                
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
                              minWidth: 103.0,
                            ),
                            isSelected: selectedTab,
                            children: tabs,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // NUMBER OF STUDENTS TEXT
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      '${studentsList.length} Students',
                      style: const TextStyle(
                        fontFamily: 'Calistoga',
                        fontSize: 18,
                        color: Color.fromRGBO(45, 62, 74, 1)
                      ),
                    ),
                  ),

                  // TERM TEXT
                  const Padding(
                    padding: EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      'TERM',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(45, 62, 74, 1)
                      ),
                    ),
                  ),      

                  // Dropdown bar
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      width: width/1.1,
                      child: Form(
                        child: DropdownButtonFormField(
                          items: itemList(), // List of options
                          hint: const Text(
                            "Filter by Term",
                            style: TextStyle(fontFamily: 'Poppins', fontSize: 14, color: Color.fromRGBO(45, 62, 74, 1)),
                            ), // Initial Text
                          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black, size: 30,), // Icon config
                          value: dropDownValue, // Selected value
                          onChanged: (String? value) => setState(() { // What is done when an option is clicked
                            dropDownValue = value;
                            prefixGiven = 1; // Variable to know if user has selected something
                          }),
                          onSaved: (String? value) => setState(() { // Solidify changes
                            dropDownValue = value;
                          }),
                          // Validation
                          validator: (value){
                            if (value == null){ // Value = User Input
                              return '*Required Field'; // Send Error
                            }
                            return null; // If everything is valid, send back 'null' meaning no errors
                          },
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10.0, top: 15.0, bottom: 15.0), // Change size of field
                            filled: true, // Allow colour filling
                            fillColor: Colors.white, // Fill background with colour
                            border: OutlineInputBorder(borderSide: BorderSide.none),
                            floatingLabelBehavior: FloatingLabelBehavior.never, // Removes annoying floating label text on click
                            labelText: 'First name*', // Text shown in box
                            labelStyle: TextStyle( // Change label text style
                              fontFamily: "Poppins-SemiBold",
                              fontSize: 16,
                              color: Color.fromRGBO(147, 141, 131, 1)
                            ),
                            hintText: 'First name', // Text shown when selected
                            hintStyle: TextStyle( // Change label text style
                              fontFamily: "Poppins-SemiBold",
                              fontSize: 14,
                              color: Color.fromRGBO(147, 141, 131, 1)
                            ),
                            errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                          ),
                          ),
                      ),
                    ),
                  ),

                  // DATE TEXT
                  const Padding(
                    padding: EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      'DATE',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(45, 62, 74, 1)
                      ),
                    ),
                  ),      

                    // Date picker
                    Padding(                          
                      padding: const EdgeInsets.only( //spacing for select date button
                        left: 10,
                        right: 0,
                        top: 10,
                        bottom: 0,
                      ),
                      child: Container(
                        width: width/1.1,
                        height: 50,
                        decoration: const BoxDecoration(
                          // border: Border.all(width: 1, color: Colors.black.withOpacity(0.5)),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.white,
                        ),
                        child: TextButton(
                          onPressed: () {
                            _selectDate(context); // Calls function named _selectDate
                          },
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              textAlign: TextAlign.start,
                              DateFormat.yMMMMd().format(StudentPage.selectedDate), // Chosen date
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                color: Color.fromRGBO(45, 62, 74, 1),
                              ),
                            ),
                          ),

                        ),
                      ),
                    ),
                  const SizedBox(height: 10,),


                  // SHOW STUDENTS
                  if (studentsList.isNotEmpty)
                    for (var i=0; i < studentsList.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 10),
                        child: SizedBox(
                          height: 160, // NTS: adjust for device size
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
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    studentIcon, // temporary grey circle
                                    
                                    const SizedBox(width: 15,), // Bit of space
            
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
            
                                        // Student Name
                                        Padding(
                                          padding: const EdgeInsets.only(top: 15), // NTS
                                          child: Text( // Format: Student Name: (DropOffTime, PickUpTime, PRESENT/ABSENT, DroppedOffBy, PickedUpBy)
                                            studentsList.entries.elementAt(i).key,
                                            style: const TextStyle(
                                              fontFamily: "Poppins-SemiBold",
                                              fontSize: 16, // NTS: adjust for device size
                                              color: Color.fromRGBO(22, 40, 54, 1)
                                              ),
                                            ),
                                        ),
                                        Row(
                                          children: [
                                            absentIcon, // create if statement to check absent/present when that is implemented
                                            const SizedBox(width: 5),
                                            // Absent/Present
                                            Text(
                                              studentsList.entries.elementAt(i).value.$3,
                                              style: const TextStyle(
                                                fontFamily: "Poppins-SemiBold",
                                                fontSize: 14, // NTS: adjust for device size
                                                color: Color.fromRGBO(22, 40, 54, 1)
                                                ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),

                                  ],
                                ),

                                const SizedBox(height: 5),

                                Row(
                                  children: [
                                    
                                    // Drop off time
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        studentsList.entries.elementAt(i).value.$1.toString(),
                                        style: const TextStyle(
                                          fontFamily: "Poppins-SemiBold",
                                          fontSize: 14, // NTS: adjust for device size
                                          color: Color.fromRGBO(22, 40, 54, 1)
                                          ),
                                      ),
                                    ),
                                    // const SizedBox(width: 50,), // Bit of space between

                                    const Expanded(child: Text("")),

                                    // Dropped off by
                                    Text(
                                      studentsList.entries.elementAt(i).value.$4.toString(),
                                      style: const TextStyle(
                                        fontFamily: "Poppins-SemiBold",
                                        fontSize: 14, // NTS: adjust for device size
                                        color: Color.fromRGBO(22, 40, 54, 1)
                                        ),
                                    ),

                                    // Big block of spacing
                                    Expanded(child: Text("")),
                                    Expanded(child: Text("")),
                                  ],
                                ),
                                // Drop off time text
                                const Row(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "DROP-OFF TIME",
                                        style: TextStyle(
                                          fontFamily: "Poppins-SemiBold",
                                          fontSize: 8, // NTS: adjust for device size
                                          color: Color.fromRGBO(90, 109, 124, 1)
                                          ),
                                      ),
                                    ),

                                    Expanded(child: Text("")),
                                    // SizedBox(width: 38,), // Bit of space between

                                      Text(
                                        "DROPPED-OFF BY",
                                        style: TextStyle(
                                          fontFamily: "Poppins-SemiBold",
                                          fontSize: 8, // NTS: adjust for device size
                                          color: Color.fromRGBO(90, 109, 124, 1)
                                          ),
                                      ),
                                      
                                      // Big block of spacing
                                      Expanded(child: Text("")),
                                      Expanded(child: Text("")),
                                      Expanded(child: Text("")),
                                  ],
                                ),
                                const SizedBox(height: 10,), // Bit of space

                                Row(
                                  children: [
                                    // Pick up time
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        studentsList.entries.elementAt(i).value.$2.toString(),
                                        style: const TextStyle(
                                          fontFamily: "Poppins-SemiBold",
                                          fontSize: 14, // NTS: adjust for device size
                                          color: Color.fromRGBO(22, 40, 54, 1)
                                          ),
                                      ),
                                    ),
                                    // const SizedBox(width: 50,), // Bit of space between
                                    
                                    const Expanded(child: Text("")),

                                    // Picked up by
                                    Text(
                                      studentsList.entries.elementAt(i).value.$5.toString(),
                                      style: const TextStyle(
                                        fontFamily: "Poppins-SemiBold",
                                        fontSize: 14, // NTS: adjust for device size
                                        color: Color.fromRGBO(22, 40, 54, 1)
                                        ),
                                    ),

                                    // Big block of spacing
                                    Expanded(child: Text("")),
                                    Expanded(child: Text("")),
                                  ],
                                ),
                                // Pick up time text
                                const Row(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "PICKED-UP TIME",
                                        style: TextStyle(
                                          fontFamily: "Poppins-SemiBold",
                                          fontSize: 8, // NTS: adjust for device size
                                          color: Color.fromRGBO(90, 109, 124, 1)
                                          ),
                                      ),
                                    ),

                                    // SizedBox(width: 38,), // Bit of space between

                                    Expanded(child: Text("")),

                                    // Picked up by text
                                    Text(
                                      textAlign: TextAlign.left,
                                      "PICKED-UP BY         ",
                                      style: TextStyle(
                                        fontFamily: "Poppins-SemiBold",
                                        fontSize: 8, // NTS: adjust for device size
                                        color: Color.fromRGBO(90, 109, 124, 1)
                                        ),
                                    ),

                                    // Big block of spacing
                                    Expanded(child: Text("")),
                                    Expanded(child: Text("")),
                                    Expanded(child: Text("")),

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