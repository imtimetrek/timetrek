import 'package:flutter/material.dart';
import 'package:timetrek/helper/helper_function.dart';
import 'package:timetrek/pages/add_profile_page.dart';
import 'package:timetrek/widgets/widgets.dart';

class OTPVerif extends StatefulWidget {
  const OTPVerif({super.key});

  @override

  State<OTPVerif> createState() => _OTPVerifState();
}

class _OTPVerifState extends State<OTPVerif> {

  String email = '';
  List<TextEditingController> otpControllers = List.generate(4, (_) => TextEditingController());
  String generatedOTP = "1234"; // Replace with your generated OTP

  @override
  void initState() {
    super.initState();
    gettingUserData();
  }

  gettingUserData() async {
    await HelperFunctions.getUserEmailFromSF().then((value) {
      setState(() {
        email = value!;
      });
    });
  }

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    for (var controller in otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Container(
          decoration: bgBoxDecoration2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                const SizedBox(height: 150.0),

                const Text(
                  'OTP Verification',
                  style: TextStyle(fontSize: 25.0,color: Colors.white),
                ),

                const SizedBox(height: 16.0),

                Container(
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      const Text(
                        'Send on ',
                        style: TextStyle(fontSize: 18.0,color: Colors.white),
                      ),
                      Text(
                        email,
                        style: TextStyle(fontSize: 18.0,color: Colors.white),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    4,
                        (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: SizedBox(
                        width: 50.0,
                        height: 60,
                        child: TextField(
                          controller: otpControllers[index],
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 24.0),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white30,
                            counterText: '',
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                          onChanged: (value) {
                            if (value.isNotEmpty && index < 3) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),


                const SizedBox(height: 32.0),

                const Text(
                  'Dont receive the code?  Resend',
                  style: TextStyle(fontSize: 18.0,color: Colors.white),
                ),

                const SizedBox(height: 425.0),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                        )
                    ),
                    child: const Text(
                      "Confirm",
                      style:
                      TextStyle(
                          color: Colors.white,
                          fontSize: 16
                      ),
                    ),
                    onPressed: () {

                      String enteredOTP = otpControllers
                          .map((controller) => controller.text)
                          .join();
                      if (enteredOTP == generatedOTP) {
                        nextScreenReplace(context, AddProfile());
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Invalid OTP'),
                              content: const Text('Please enter the correct 4-digit OTP.'),
                              actions: [
                                ElevatedButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                  ),
                ),

                const SizedBox(height: 8.0),

              ],
            ),
          ),
        ),
      ),
    );
  }
}