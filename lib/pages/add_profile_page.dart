import 'package:flutter/material.dart';
import 'package:timetrek/helper/helper_function.dart';
import 'package:timetrek/services/database_services.dart';

class AddProfile extends StatefulWidget {
  const AddProfile({super.key});

  @override
  State<AddProfile> createState() => _AddProfileState();
}

class _AddProfileState extends State<AddProfile> {
  final formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  DatabaseService databaseService = DatabaseService();
  String fullName = '';
  String email = '';
  String phone = '';
  String gender = '';
  String profession = '';

  String dropDownValue = 'One';

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
    await HelperFunctions.getUserNameFromSF().then((val) {
      setState(() {
        fullName = val!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Form(
            key: formKey,
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Column(
                children: [

                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Add Profile',
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                  ),

                  const SizedBox(height: 15,),

                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 4,
                                  color: Theme
                                      .of(context)
                                      .primaryColor
                              ),
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1),
                                  offset: const Offset(0, 10),
                                )
                              ],
                              shape: BoxShape.circle,
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80')
                              )
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color: Theme
                                    .of(context)
                                    .colorScheme
                                    .background,
                              ),
                              color: Colors.green,
                            ),
                            child: const Icon(Icons.edit, color: Colors.white,),
                          ),
                        ),

                      ],
                    ),
                  ),

                  const SizedBox(height: 15,),

                  buildTextField("Full Name", fullName),
                  buildTextField("Phone", phone),

                  Container(
                    width: 400,
                    height: 50,
                    decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        )
                    ),
                    child: Expanded(
                      child: DropdownButton(
                          isExpanded: true,
                          value: dropDownValue,
                          items: const [
                            DropdownMenuItem<String>(
                              value: 'One',
                              child: Text("Male"),
                            ),
                            DropdownMenuItem<String>(
                              value: 'Two',
                              child: Text("Female"),
                            ),
                            DropdownMenuItem<String>(
                              value: 'Three',
                              child: Text("Other"),
                            ),
                          ],
                          onChanged: (String? newValue) {
                            setState(() {
                              dropDownValue = newValue!;
                            });
                          }
                      ),
                    ),
                  ),


                  const SizedBox(height: 30,),

                  buildTextField("Profession", profession),

                  const SizedBox(height: 15,),

                  ElevatedButton(
                    onPressed: () {
                      saveDataToFirebase();
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        backgroundColor: Theme
                            .of(context)
                            .primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)
                        )
                    ),
                    child: const Text(
                      'Lets GO',
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2.2,
                        color: Colors.white,
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        controller: TextEditingController(
            text: placeholder
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(bottom: 3),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),

      ),
    );
  }

  Future<void> saveDataToFirebase() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      await databaseService.savingUserData(email);
    }
  }
}
