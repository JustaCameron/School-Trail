import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_trail/main.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

// Controls state of app
class MyAppState extends ChangeNotifier {

}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

// Global Keys for verifying user inputs in textformfields
final validationFormKey = GlobalKey<FormState>();


// Controllers to store user input
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    double width = double.parse(MediaQuery.of(context).size.width.toStringAsFixed(0)); // Get screen Width
    double height = double.parse(MediaQuery.of(context).size.height.toStringAsFixed(0)); // Get screen Height
    print(width);
    print(height);

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
                        "Log into Your Account",
                        style: TextStyle(
                          fontFamily: "Calistoga",
                          fontSize: 24, // NTS: adjust for device size
                          color: Color.fromRGBO(45, 62, 74, 1)
                        ),
                        ),
                    ),
                    
                    
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 10, right: 20),
                      child: Form(
                        key: validationFormKey,
                        child: SizedBox( // Size of list view
                          width: width/1.1,
                          height: height/2,
                          child: SafeArea( // Prevents collision
                            top: false,
                            child: ListView(
                              children: [

                                // EMAIL HEADING
                                const Text(
                                  "Email",
                                  style: TextStyle(
                                    fontFamily: "Poppins-SemiBold",
                                    fontSize: 16, // NTS: adjust for device size
                                    color: Color.fromRGBO(90, 109, 124,1),
                                  ),
                                ),

                                // EMAIL TEXTFORMFIELD
                                TextFormField(
                                  controller: emailController, // This is where input is stored
                                  validator: (value){
                                    if (value!.isEmpty){ // Value = User Input
                                      return '*Required Field'; // Send Error
                                    }
                                    else if(!value.contains('@') || !value.contains('.')){ // If the email doesn't have an '@' or a '.'
                                      return 'Invalid Email';
                                    }
                                    // Add check here later to make sure email is actually a real email in the database
                                    return null; // If everything is valid, send back 'null' meaning no errors
                                  },
                                  decoration: const InputDecoration(
                                    filled: true, // Allow colour filling
                                    fillColor: Colors.white, // Fill background with colour
                                    border: OutlineInputBorder(borderSide: BorderSide.none),
                                    floatingLabelBehavior: FloatingLabelBehavior.never, // Removes annoying floating label text on click
                                    errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                                  ),
                                ),
                                const SizedBox(height: 20,), // Bit of space between textformfields

                                // PASSWORD HEADING
                                const Text(
                                  "Password",
                                  style: TextStyle(
                                    fontFamily: "Poppins-SemiBold",
                                    fontSize: 16, // NTS: adjust for device size
                                    color: Color.fromRGBO(90, 109, 124,1),
                                  ),
                                ),

                                // PASSWORD TEXTFORMFIELD
                                TextFormField(
                                  controller: passwordController, // This is where input is stored
                                  validator: (value){
                                    if (value!.isEmpty){ // Value = User Input
                                      return '*Required Field'; // Send Error
                                    }
                                    // Add check here later to make sure password is actual password for associated email
                                    return null; // If everything is valid, send back 'null' meaning no errors
                                  },
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    filled: true, // Allow colour filling
                                    fillColor: Colors.white, // Fill background with colour
                                    border: OutlineInputBorder(borderSide: BorderSide.none),
                                    floatingLabelBehavior: FloatingLabelBehavior.never, // Removes annoying floating label text on click
                                    errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                                  ),
                                ),
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
            Positioned(
              bottom: height/3.5,
              left: width/22,
              child: SizedBox(
                height: 50, // NTS: adjust for device size
                width: 360,
                child: ElevatedButton(
                  onPressed: (){
                    if (validationFormKey.currentState!.validate()){ // Check if what they entered is valid based on previously given criteria
                      validationFormKey.currentState!.reset();
                      emailController.text = ("");
                      passwordController.text = ("");
                      Navigator.pushNamedAndRemoveUntil(context, "/Home", (r) => false); // Goes to page on click and removes all other active routes for performance
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => 
                      // ChangeNotifierProvider.value(value: MyAppState(), child: MyHomePage(),),
                      // maintainState: true)); // Goes to page on click
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
                    "Login",
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
      )
    );
  }
}