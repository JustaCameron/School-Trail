import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

// Global Keys for verifying user inputs in textformfields
final accessCodeFormKey = GlobalKey<FormState>();
final firstNameFormKey = GlobalKey<FormState>();
final lastNameFormKey = GlobalKey<FormState>();
final emailFormKey = GlobalKey<FormState>();
final passwordFormKey = GlobalKey<FormState>();
final confirmPasswordFormKey = GlobalKey<FormState>();

// Controllers to store user input
TextEditingController accessCodeController = TextEditingController();
TextEditingController firstNameController = TextEditingController();
TextEditingController lastNameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();

class _SignUpPageState extends State<SignUpPage> {

  // Variable so I don't have to type this out every time
  BoxDecoration textContainerFormat = BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.all(Radius.circular(5)), // Make container borders more rounded
                                        boxShadow: [ // Container shadow settings
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.1), // Colour of shadow
                                            offset: const Offset(0.5, 0.5), // Offset of shadow from container
                                            spreadRadius: 1, // Size of shadow
                                            blurRadius: 0, // Blur effect
                                          )
                                        ]
                                      );

  @override
  Widget build(BuildContext context) {
    double width = double.parse(MediaQuery.of(context).size.width.toStringAsFixed(0)); // Get screen Width
    double height = double.parse(MediaQuery.of(context).size.height.toStringAsFixed(0)); // Get screen Height
    print(width);
    print(height);


    return Scaffold(
      body: GestureDetector( // To detect clicks
        onTap: (){ // Tapping outside of any widget will close it
          FocusScope.of(context).requestFocus(FocusNode());
        },
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
                padding: EdgeInsets.only(top: 50), // NTS: adjust for device size
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
                        Navigator.of(context).pushNamed("/Home"); // Goes to page on click
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
      )
    );
  }
}