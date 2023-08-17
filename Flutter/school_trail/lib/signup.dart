import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

// Controls state of app
class MyAppState extends ChangeNotifier {
  var prefixGiven = 0;

  String? dropDownValue; // Value of dropdown

  // Variable for text field text styling so I don't have to retype it everytime
  TextStyle formStyling = const TextStyle(
      fontFamily: "Poppins-SemiBold",
      fontSize: 16,
      color: Color.fromRGBO(147, 141, 131, 1)
    );

  // Variable for hint text styling in text fields
  TextStyle hintStyling = const TextStyle(
    fontFamily: "Poppins-SemiBold",
    fontSize: 14,
    color: Color.fromRGBO(147, 141, 131, 1)
  );
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

// Global Keys for verifying user inputs in textformfields
final accessCodeFormKey = GlobalKey<FormState>();
final firstValidationFormKey = GlobalKey<FormState>();
final secondValidationFormKey = GlobalKey<FormState>();

// Controllers to store user input
TextEditingController accessCodeController = TextEditingController();
TextEditingController firstNameController = TextEditingController();
TextEditingController lastNameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();

TextEditingController phoneNumberController = TextEditingController();
TextEditingController countryController = TextEditingController();
TextEditingController addressLineOneController = TextEditingController();
TextEditingController addressLineTwoController = TextEditingController();
TextEditingController cityController = TextEditingController();
TextEditingController parishController = TextEditingController();

class _SignUpPageState extends State<SignUpPage> {

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>(); // Access app state
    double width = double.parse(MediaQuery.of(context).size.width.toStringAsFixed(0)); // Get screen Width
    double height = double.parse(MediaQuery.of(context).size.height.toStringAsFixed(0)); // Get screen Height
    print(width);
    print(height);


    return Scaffold(
      resizeToAvoidBottomInset: false, // Prevents keyboard popping up from affecting widgets
      body: GestureDetector( // To detect clicks
        onTap: (){ // Tapping outside of any widget will close it
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Stack( // Think of it like stacking paper, it's an ordering widget
          children: [
            SafeArea(
              top: false,
              child: Container(
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
                    
                    // CREATE YOUR ACCOUNT TEXT
                    const Padding(
                      padding: EdgeInsets.only(top: 30), // NTS: adjust for device size
                      child: Text(
                        "Create Your Account",
                        style: TextStyle(
                          fontFamily: "Calistoga",
                          fontSize: 24, // NTS: adjust for device size
                          color: Color.fromRGBO(45, 62, 74, 1)
                        ),
                        ),
                    ),
                    
                    // SCHOOL ACCESS CODE TEXT
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top: 25, left: 37), // NTS: adjust for device size
                        child: Text(
                          "School Access Code",
                          style: TextStyle(
                            fontFamily: "Poppins-SemiBold",
                            fontSize: 16, // NTS: adjust for device size
                            color: Color.fromRGBO(90, 109, 124,1),
                          ),
                          ),
                      ),
                    ),
                    
                    // PARAGRAPH TEXT
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "Enter the access code provided by your\nschool. If you do not have one, please reach\nout to your school.",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14,
                          color: Color.fromRGBO(90, 109, 124, 1)
                        ),
                        ),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 10, right: 20),
                      child: Form(
                        key: accessCodeFormKey,
                        child: TextFormField(
                          controller: accessCodeController, // This is where input is stored
                          validator: (value){
                            if (value!.isEmpty){ // Value = User Input
                              return 'Invalid Access Code'; // Send Error
                            }
                            else if(value.contains(RegExp('[a-z,A-Z]'))){
                              return 'Invalid Access Code';
                            }
                            return null; // If everything is valid, send back 'null' meaning no errors
                          },
                          decoration: const InputDecoration(
                            filled: true, // Allow colour filling
                            fillColor: Colors.white, // Fill background with colour
                            border: OutlineInputBorder(borderSide: BorderSide.none),
                            floatingLabelBehavior: FloatingLabelBehavior.never, // Removes annoying floating label text on click
                            labelText: 'Access code', // Text shown in box
                            labelStyle: TextStyle( // Change label text style
                              fontFamily: "Poppins-SemiBold",
                              fontSize: 16,
                              color: Color.fromRGBO(147, 141, 131, 1)
                            ),
                            hintText: 'Access code', // Text shown when selected
                            hintStyle: TextStyle( // Change label text style
                              fontFamily: "Poppins-SemiBold",
                              fontSize: 14,
                              color: Color.fromRGBO(147, 141, 131, 1)
                            ),
                            errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                          ),
                        )
                      ),
                    ),
                
                    // CONTINUE BUTTON
                    Padding(
                      padding: const EdgeInsets.only(top: 100), // NTS: adjust for device size
                      child: SizedBox(
                        height: 50, // NTS: adjust for device size
                        width: 360,
                        child: ElevatedButton(
                          onPressed: (){
                            if (accessCodeFormKey.currentState!.validate()){ // Check if what they entered is valid based on previously given criteria
                              accessCodeFormKey.currentState!.reset();
                              accessCodeController.text = ("");
                              // appState.currentStep = 2; LOWERS PERFORMANCE, REMOVE LATER IF NO BUGS FOUND WITH NEW METHOD // Increment current step when you progress
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => 
                              ChangeNotifierProvider.value(value: MyAppState(), child: FirstCreatePage(),),
                              maintainState: true)); // Goes to page on click
                            }
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
                            "Continue",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 18, // NTS: adjust for device size
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(80, 57, 0, 1)
                              ),
                            ),
                          ),
                      ),
                    ),
                    
                  ],
                ),
              ),
            ),

            // Position top stack widget
            Positioned(
              bottom: height/20,
              left: width/2.7,
              child: const SafeArea(
                top: false,
                bottom: false,
                child: StepProgressIndicator(
                  // onTap: (p0) {
                  //   // Eventually use onTap to let user navigate by tapping indicators
                  // },
                  totalSteps: 3, // Total steps
                  currentStep: 1, // Step you're currently on
                  selectedColor: Colors.green, // Colour of selected step
                  padding: 5, // Length of indicators
                  size: 4, // Height of indicators
                  selectedSize: 5, // Height of already selected indicators
                  roundedEdges: Radius.circular(10), // Rounds out the edges for nicer aesthetics
                  ),
              ),
            )
          ],
        ),
      )
    );
  }
}


// FIRST CREATE PAGE

class FirstCreatePage extends StatefulWidget {

  @override
  State<FirstCreatePage> createState() => _FirstCreatePageState();
}

class _FirstCreatePageState extends State<FirstCreatePage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>(); // Access app state

    List<String> items = <String>['Mr', 'Mrs', 'Miss', 'Sir', 'Dr']; // List for dropdown

    // Format list for dropdown
    List<DropdownMenuItem<String>> itemList() {
      return items.map<DropdownMenuItem<String>>(
        (e) => DropdownMenuItem(
          value: e,
          child: Text(e, style: appState.formStyling,),
        ),
      ).toList();
    }


    double width = double.parse(MediaQuery.of(context).size.width.toStringAsFixed(0)); // Get screen Width
    double height = double.parse(MediaQuery.of(context).size.height.toStringAsFixed(0)); // Get screen Height
    print(width);
    print(height);


    return Scaffold(
      resizeToAvoidBottomInset: false, // Prevents keyboard popping up from affecting widgets
      body: GestureDetector( // To detect clicks
        onTap: (){ // Tapping outside of any widget will close it
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Stack( // Think of it like stacking paper, it's an ordering widget
          children: [
            SafeArea(
              top: false,
              child: Container( // Container with everything inside it
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
                    
                    // CREATE YOUR ACCOUNT TEXT
                    const Padding(
                      padding: EdgeInsets.only(top: 30), // NTS: adjust for device size
                      child: Text(
                        "Create Your Account",
                        style: TextStyle(
                          fontFamily: "Calistoga",
                          fontSize: 24, // NTS: adjust for device size
                          color: Color.fromRGBO(45, 62, 74, 1)
                        ),
                        ),
                    ),
                  
              
                    // ALL INPUT FIELDS
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 20, right: 20),
                      child: Form(
                        key: firstValidationFormKey, // Validation key
                        child: SizedBox(
                          width: width/1.1,
                          height: height/1.7,
                          child: SafeArea(
                            top: false,
                            child: ListView(
                              children: [
                        
                                // NAME PREFIX DROP DOWN
                                DropdownButtonFormField(
                                  items: itemList(), // List of options
                                  hint: Text(
                                    "Name prefix*",
                                    style: appState.formStyling,
                                    ), // Initial Text
                                  icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black, size: 30,), // Icon config
                                  value: appState.dropDownValue, // Selected value
                                  onChanged: (String? value) => setState(() { // What is done when an option is clicked
                                    appState.dropDownValue = value;
                                    appState.prefixGiven = 1; // Variable to know if user has selected something
                                  }),
                                  onSaved: (String? value) => setState(() { // Solidify changes
                                    appState.dropDownValue = value;
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
                        
                                const SizedBox(height: 20,), // Bit of space between textformfields
                        
                                // FIRST NAME TEXTFORMFIELD
                                TextFormField(
                                  controller: firstNameController, // This is where input is stored
                                  // Validation
                                  validator: (value){
                                    if (value!.isEmpty){ // Value = User Input
                                      return '*Required Field'; // Send Error
                                    }
                                    else if(value.contains(RegExp('[0-9]'))){ // If the name has numbers
                                      return 'Name contains numbers';
                                    }
                                    return null; // If everything is valid, send back 'null' meaning no errors
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(left: 10.0, top: 15.0, bottom: 15.0), // Change size of field
                                    filled: true, // Allow colour filling
                                    fillColor: Colors.white, // Fill background with colour
                                    border: OutlineInputBorder(borderSide: BorderSide.none),
                                    floatingLabelBehavior: FloatingLabelBehavior.never, // Removes annoying floating label text on click
                                    labelText: 'First name*', // Text shown in box
                                    labelStyle: appState.formStyling,
                                    hintText: 'First name', // Text shown when selected
                                    hintStyle: appState.hintStyling,
                                    errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                                  ),
                                ),
                                const SizedBox(height: 20,), // Bit of space between textformfields
                                                
                                // LAST NAME TEXTFORMFIELD
                                TextFormField(
                                  controller: lastNameController, // This is where input is stored
                                  // Validation
                                  validator: (value){
                                    if (value!.isEmpty){ // Value = User Input
                                      return '*Required Field'; // Send Error
                                    }
                                    else if(value.contains(RegExp('[0-9]'))){ // If the name has numbers
                                      return 'Name contains numbers';
                                    }
                                    return null; // If everything is valid, send back 'null' meaning no errors
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(left: 10.0, top: 15.0, bottom: 15.0), // Change size of field
                                    filled: true, // Allow colour filling
                                    fillColor: Colors.white, // Fill background with colour
                                    border: const OutlineInputBorder(borderSide: BorderSide.none),
                                    floatingLabelBehavior: FloatingLabelBehavior.never, // Removes annoying floating label text on click
                                    labelText: 'Last name*', // Text shown in box
                                    labelStyle: appState.formStyling,
                                    hintText: 'Last name', // Text shown when selected
                                    hintStyle: appState.hintStyling,
                                    errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                                  ),
                                ),
                                const SizedBox(height: 20,), // Bit of space between textformfields
                          
                                // EMAIL TEXTFORMFIELD
                                TextFormField(
                                  controller: emailController, // This is where input is stored
                                  // Validation
                                  validator: (value){
                                    if (value!.isEmpty){ // Value = User Input
                                      return '*Required Field'; // Send Error
                                    }
                                    else if(!value.contains('@') || !value.contains('.')){ // If the email doesn't have an '@' or a '.'
                                      return 'Invalid Email';
                                    }
                                    return null; // If everything is valid, send back 'null' meaning no errors
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(left: 10.0, top: 15.0, bottom: 15.0), // Change size of field
                                    filled: true, // Allow colour filling
                                    fillColor: Colors.white, // Fill background with colour
                                    border: const OutlineInputBorder(borderSide: BorderSide.none),
                                    floatingLabelBehavior: FloatingLabelBehavior.never, // Removes annoying floating label text on click
                                    labelText: 'Email address*', // Text shown in box
                                    labelStyle: appState.formStyling,
                                    hintText: 'Email address', // Text shown when selected
                                    hintStyle: appState.hintStyling,
                                    errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                                  ),
                                ),
                                const SizedBox(height: 20,), // Bit of space between textformfields
                                                
                                // PASSWORD TEXTFORMFIELD
                                TextFormField(
                                  controller: passwordController, // This is where input is stored
                                  // Validation
                                  validator: (value){
                                    if (value!.isEmpty){ // Value = User Input
                                      return '*Required Field'; // Send Error
                                    }
                                    else if(value.length < 4){ // If password has less than 4 characters
                                      return 'Password must have 4 or more characters';
                                    }
                                    else if((value.replaceAll(RegExp(r'[^A-Z,a-z]'),'')).length <= 1){ // If password has only 0-1 numbers
                                      return 'Password must have at least 2 numbers';
                                    }
                                    return null; // If everything is valid, send back 'null' meaning no errors
                                  },
                                  obscureText: true, // Replaces text with '***'
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(left: 10.0, top: 15.0, bottom: 15.0), // Change size of field
                                    filled: true, // Allow colour filling
                                    fillColor: Colors.white, // Fill background with colour
                                    border: const OutlineInputBorder(borderSide: BorderSide.none),
                                    floatingLabelBehavior: FloatingLabelBehavior.never, // Removes annoying floating label text on click
                                    labelText: 'Password*', // Text shown in box
                                    labelStyle: appState.formStyling,
                                    hintText: 'Password', // Text shown when selected
                                    hintStyle: appState.hintStyling,
                                    errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                                  ),
                                ),
                                const SizedBox(height: 20,), // Bit of space between textformfields
                                                
                                // CONFIRM PASSWORD TEXTFORMFIELD
                                TextFormField(
                                  controller: confirmPasswordController, // This is where input is stored
                                  // Validation
                                  validator: (value){
                                    if (value!.isEmpty){ // Value = User Input
                                      return '*Required Field'; // Send Error
                                    }
                                    else if(value != passwordController.text){ // If passwords are not equivalent to each other
                                      return 'Passwords do not match';
                                    }
                                    return null; // If everything is valid, send back 'null' meaning no errors
                                  },
                                  obscureText: true, // Replaces text with '***'
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(left: 10.0, top: 15.0, bottom: 15.0), // Change size of field
                                    filled: true, // Allow colour filling
                                    fillColor: Colors.white, // Fill background with colour
                                    border: const OutlineInputBorder(borderSide: BorderSide.none),
                                    floatingLabelBehavior: FloatingLabelBehavior.never, // Removes annoying floating label text on click
                                    labelText: 'Confirm password*', // Text shown in box
                                    labelStyle: appState.formStyling,
                                    hintText: 'Confirm password', // Text shown when selected
                                    hintStyle: appState.hintStyling,
                                    errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                        
                      ),
                    ),
                    
                  ],
                ),
              ),
            ),
            // CONTINUE BUTTON
            // If all required fields are filled, Continue button will appear, otherwise it will not
            if (appState.prefixGiven == 1 && firstNameController.text != "" && lastNameController.text != ""
                && emailController.text != "" && passwordController.text != "" && confirmPasswordController.text != "")
                Positioned(
                  bottom: height/15,
                  left: width/22,
                  child: SizedBox(
                    height: 50, // NTS: adjust for device size
                    width: 360,
                    child: ElevatedButton(
                      onPressed: (){
                        if (firstValidationFormKey.currentState!.validate()){ // Check if what they entered is valid based on previously given criteria
                            // If so, do the following
                            firstValidationFormKey.currentState!.reset(); // Reset form key so nothing breaks if user goes back
    
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => 
                            ChangeNotifierProvider.value(value: MyAppState(), child: SecondCreatePage(),),
                            maintainState: true)); // Goes to page on click
                        }
                      }, 
                      style: ElevatedButton.styleFrom( // Button config
                        elevation: 2.0, // Makes shadow more pronounced
                        backgroundColor: const Color.fromRGBO(255, 221, 133, 1),
                        shadowColor: const Color.fromRGBO(173, 159, 125, 1),
                        foregroundColor: Colors.transparent,
                        surfaceTintColor: Colors.transparent,
                        side: BorderSide.none, // Removes border line
                      ),
                      child: const Text(
                        "Continue",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 18, // NTS: adjust for device size
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(80, 57, 0, 1)
                          ),
                        ),
                      ),
                  ),
                ),
      
            // Position top stack widget
            Positioned(
              bottom: height/20,
              left: width/2.7,
              child: const SafeArea(
                top: false,
                bottom: false,
                child: StepProgressIndicator(
                  // onTap: (p0) {
                  //   // Eventually use onTap to let user navigate by tapping indicators
                  // },
                  totalSteps: 3, // Total steps
                  currentStep: 2, // Step you're currently on
                  selectedColor: Colors.green, // Colour of selected step
                  padding: 5, // Length of indicators
                  size: 4, // Height of indicators
                  selectedSize: 5, // Height of already selected indicators
                  roundedEdges: Radius.circular(10), // Rounds out the edges for nicer aesthetics
                  ),
              ),
            )
          ],
        ),
      )
    );
  }
}


// SECOND CREATE PAGE

class SecondCreatePage extends StatefulWidget {

  @override
  State<SecondCreatePage> createState() => _SecondCreatePageState();
}

class _SecondCreatePageState extends State<SecondCreatePage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>(); // Access app state


    double width = double.parse(MediaQuery.of(context).size.width.toStringAsFixed(0)); // Get screen Width
    double height = double.parse(MediaQuery.of(context).size.height.toStringAsFixed(0)); // Get screen Height
    List<String> parishes = <String>['kingston', 'st. andrew', 'st. james', 'st. elizabeth', 'st. ann', 'st. mary', 'st. catherine', 'st. thomas', 'portland', 'clarendon', 'manchester', 'trelawny', 'westmoreland', 'hanover'];
    print(width);
    print(height);


    return Scaffold(
      resizeToAvoidBottomInset: false, // Prevents keyboard popping up from affecting widgets
      body: GestureDetector( // To detect clicks
        onTap: (){ // Tapping outside of any widget will close it
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Stack( // Think of it like stacking paper, it's an ordering widget
          children: [
            SafeArea(
              top: false,
              child: Container( // Container with everything inside it
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
                    
                    // CREATE YOUR ACCOUNT TEXT
                    const Padding(
                      padding: EdgeInsets.only(top: 30), // NTS: adjust for device size
                      child: Text(
                        "Create Your Account",
                        style: TextStyle(
                          fontFamily: "Calistoga",
                          fontSize: 24, // NTS: adjust for device size
                          color: Color.fromRGBO(45, 62, 74, 1)
                        ),
                        ),
                    ),
                  
              
                    // ALL INPUT FIELDS
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 20, right: 20),
                      child: Form(
                        key: secondValidationFormKey, // Validation key
                        child: SizedBox(
                          width: width/1.1,
                          height: height/1.7,
                          child: SafeArea(
                            top: false,
                            child: ListView(
                              children: [

                                // PHONE NUMBER TEXTFORMFIELD
                                TextFormField(
                                  controller: phoneNumberController, // This is where input is stored
                                  // Validation
                                  validator: (value){
                                    if (value!.isEmpty){ // Value = User Input
                                      return null; // No Error
                                    }
                                    else if(value.contains(RegExp('[a-z,A-Z]'))){ // If phone number has letters
                                      return 'Invalid phone number';
                                    }
                                    return null; // If everything is valid, send back 'null' meaning no errors
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(left: 10.0, top: 15.0, bottom: 15.0), // Change size of field
                                    filled: true, // Allow colour filling
                                    fillColor: Colors.white, // Fill background with colour
                                    border: OutlineInputBorder(borderSide: BorderSide.none),
                                    floatingLabelBehavior: FloatingLabelBehavior.never, // Removes annoying floating label text on click
                                    labelText: 'Phone Number', // Text shown in box
                                    labelStyle: appState.formStyling,
                                    hintText: 'Phone Number', // Text shown when selected
                                    hintStyle: appState.hintStyling,
                                    errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                                  ),
                                ),

                                const SizedBox(height: 20,), // Bit of space between textformfields
                        
                                // COUNTRY TEXTFORMFIELD
                                TextFormField(
                                  controller: countryController, // This value is useless until countries outside Jamaica are supported
                                  readOnly: true, // Prevents them from changing anything since Jamaica is currently the only supported country

                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(left: 10.0, top: 15.0, bottom: 15.0), // Change size of field
                                    filled: true, // Allow colour filling
                                    fillColor: Colors.white, // Fill background with colour
                                    border: OutlineInputBorder(borderSide: BorderSide.none),
                                    floatingLabelBehavior: FloatingLabelBehavior.never, // Removes annoying floating label text on click
                                    labelText: 'Jamaica', // Text shown in box
                                    labelStyle: appState.formStyling,
                                    hintText: 'Jamaica', // Text shown when selected
                                    hintStyle: appState.hintStyling,
                                    errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                                  ),
                                ),
                                const SizedBox(height: 20,), // Bit of space between textformfields
                                                
                                // ADDRESS LINE 1 TEXTFORMFIELD
                                TextFormField(
                                  controller: addressLineOneController, // This is where input is stored
                                  // Validation
                                  validator: (value){
                                    if (value!.isEmpty){ // Value = User Input
                                      return '*Required Field'; // Send Error
                                    }
                                    else if(value.contains(RegExp('[^A-Za-z0-9]'))){ // If the address has symbols
                                      return 'Invalid Address';
                                    }
                                    return null; // If everything is valid, send back 'null' meaning no errors
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(left: 10.0, top: 15.0, bottom: 15.0), // Change size of field
                                    filled: true, // Allow colour filling
                                    fillColor: Colors.white, // Fill background with colour
                                    border: const OutlineInputBorder(borderSide: BorderSide.none),
                                    floatingLabelBehavior: FloatingLabelBehavior.never, // Removes annoying floating label text on click
                                    labelText: 'Address Line 1*', // Text shown in box
                                    labelStyle: appState.formStyling,
                                    hintText: 'Address Line 1', // Text shown when selected
                                    hintStyle: appState.hintStyling,
                                    errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                                  ),
                                ),
                                const SizedBox(height: 20,), // Bit of space between textformfields
                          
                                // ADDRESS LINE 2 TEXTFORMFIELD
                                TextFormField(
                                  controller: addressLineTwoController, // This is where input is stored
                                  // Validation
                                  validator: (value){
                                    if (value!.isEmpty){ // Value = User Input
                                      return '*Required Field'; // Send Error
                                    }
                                    else if(value.contains(RegExp('[^A-Za-z0-9]'))){ // If the address has symbols
                                      return 'Invalid Address';
                                    }
                                    return null; // If everything is valid, send back 'null' meaning no errors
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(left: 10.0, top: 15.0, bottom: 15.0), // Change size of field
                                    filled: true, // Allow colour filling
                                    fillColor: Colors.white, // Fill background with colour
                                    border: const OutlineInputBorder(borderSide: BorderSide.none),
                                    floatingLabelBehavior: FloatingLabelBehavior.never, // Removes annoying floating label text on click
                                    labelText: 'Address Line 2*', // Text shown in box
                                    labelStyle: appState.formStyling,
                                    hintText: 'Address Line 2', // Text shown when selected
                                    hintStyle: appState.hintStyling,
                                    errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                                  ),
                                ),
                                const SizedBox(height: 20,), // Bit of space between textformfields
                                                
                                // CITY TEXTFORMFIELD
                                TextFormField(
                                  controller: cityController, // This is where input is stored
                                  // Validation
                                  validator: (value){
                                    if (value!.isEmpty){ // Value = User Input
                                      return '*Required Field'; // Send Error
                                    }
                                    else if(value.contains(RegExp('[^A-Za-z0-9]'))){ // If the city name has symbols
                                      return 'Invalid City';
                                    }
                                    return null; // If everything is valid, send back 'null' meaning no errors
                                  },
                                  obscureText: true, // Replaces text with '***'
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(left: 10.0, top: 15.0, bottom: 15.0), // Change size of field
                                    filled: true, // Allow colour filling
                                    fillColor: Colors.white, // Fill background with colour
                                    border: const OutlineInputBorder(borderSide: BorderSide.none),
                                    floatingLabelBehavior: FloatingLabelBehavior.never, // Removes annoying floating label text on click
                                    labelText: 'City*', // Text shown in box
                                    labelStyle: appState.formStyling,
                                    hintText: 'City', // Text shown when selected
                                    hintStyle: appState.hintStyling,
                                    errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                                  ),
                                ),
                                const SizedBox(height: 20,), // Bit of space between textformfields
                                                
                                // PARISH TEXTFORMFIELD
                                TextFormField(
                                  controller: parishController, // This is where input is stored
                                  // Validation
                                  validator: (value){
                                    if (value!.isEmpty){ // Value = User Input
                                      return '*Required Field'; // Send Error
                                    }
                                    else if(!parishes.contains(value.toLowerCase())){ // If given parish isn't in the list of parishes
                                      return 'Invalid Parish | e.g. St. Mary';
                                    }
                                    return null; // If everything is valid, send back 'null' meaning no errors
                                  },
                                  obscureText: true, // Replaces text with '***'
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(left: 10.0, top: 15.0, bottom: 15.0), // Change size of field
                                    filled: true, // Allow colour filling
                                    fillColor: Colors.white, // Fill background with colour
                                    border: const OutlineInputBorder(borderSide: BorderSide.none),
                                    floatingLabelBehavior: FloatingLabelBehavior.never, // Removes annoying floating label text on click
                                    labelText: 'Parish*', // Text shown in box
                                    labelStyle: appState.formStyling,
                                    hintText: 'Parish', // Text shown when selected
                                    hintStyle: appState.hintStyling,
                                    errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                        
                      ),
                    ),
                    
                  ],
                ),
              ),
            ),
            // CONTINUE BUTTON
            // If all required fields are filled, Continue button will appear, otherwise it will not
            if (addressLineOneController.text != "" && addressLineTwoController.text != ""
                && cityController.text != "" && parishController.text != "")
                Positioned(
                  bottom: height/15,
                  left: width/22,
                  child: SizedBox(
                    height: 50, // NTS: adjust for device size
                    width: 360,
                    child: ElevatedButton(
                      onPressed: (){
                        if (secondValidationFormKey.currentState!.validate()){ // Check if what they entered is valid based on previously given criteria
                            // If so, do the following
                            secondValidationFormKey.currentState!.reset(); // Reset form key so nothing breaks if user goes back

                            Navigator.of(context).pushNamed("/Home"); // Goes to page on click
                        }
                      }, 
                      style: ElevatedButton.styleFrom( // Button config
                        elevation: 2.0, // Makes shadow more pronounced
                        backgroundColor: const Color.fromRGBO(255, 221, 133, 1),
                        shadowColor: const Color.fromRGBO(173, 159, 125, 1),
                        foregroundColor: Colors.transparent,
                        surfaceTintColor: Colors.transparent,
                        side: BorderSide.none, // Removes border line
                      ),
                      child: const Text(
                        "Continue",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 18, // NTS: adjust for device size
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(80, 57, 0, 1)
                          ),
                        ),
                      ),
                  ),
                ),
      
            // Position top stack widget
            Positioned(
              bottom: height/20,
              left: width/2.7,
              child: const SafeArea(
                top: false,
                bottom: false,
                child: StepProgressIndicator(
                  // onTap: (p0) {
                  //   // Eventually use onTap to let user navigate by tapping indicators
                  // },
                  totalSteps: 3, // Total steps
                  currentStep: 3, // Step you're currently on
                  selectedColor: Colors.green, // Colour of selected step
                  padding: 5, // Length of indicators
                  size: 4, // Height of indicators
                  selectedSize: 5, // Height of already selected indicators
                  roundedEdges: Radius.circular(10), // Rounds out the edges for nicer aesthetics
                  ),
              ),
            )
          ],
        ),
      )
    );
  }
}