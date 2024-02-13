import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slam_up/utils/text.dart';
import 'package:slam_up/utils/constants.dart';
import 'package:image_picker/image_picker.dart';

//profile page
// ignore: must_be_immutable
class ProfilePage extends StatelessWidget {
  ProfilePage({
    Key? key,
    // required keys to display the default
    required this.fullname,
    required this.email,
    required this.birthdate,
    required this.sex,
  }) : super(key: key);

  //get the image from 'change picture button' in edit profile page
  get image => null;

  //declared to handle dynamic values from edit profile 'update button'
  String fullname;
  String email;
  String birthdate;
  String sex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('Profile'),
      ),*/
      body: ListView(
        children: [
          //container ------------------------------
          SizedBox(
            height: 350,
            child: ColoredBox(
              color: profileDarkBg,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 90, bottom: 10),
                    //profile text ------------------------------
                    child: Text(userProfile,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        )),
                  ),
                  //circle avatar ------------------------------
                  CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.white,
                    backgroundImage: image != null ? FileImage(image!) : null,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //edit profile button ------------------------------
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 110),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EditProfile()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff153836),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(editProfile,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //personal information label ------------------------------
          const SizedBox(
            child: ColoredBox(
              color: Color(0xffe8e4af),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(personalInfo,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
              ),
            ),
          ),

          //details in profile ------------------------------
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(fullname,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    )),
                const SizedBox(height: 4.0),
                Text(email,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
                const SizedBox(height: 4.0),
                Text(birthdate,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
                const SizedBox(height: 4.0),
                Text(sex,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
              ],
            ),
          ),

          //line in bottom of details ------------------------------
          const SizedBox(
            height: 3.0,
            child: ColoredBox(
              color: Color(0xFF43817F), // Change to your desired color
            ),
          ),

          const SizedBox(
            height: 20,
          ),

          //this is the logout button ------------------------------
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 20),
            child: ElevatedButton(
              onPressed: () {
                /* Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfile()),
                );*/
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF43817F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(6.0),
                child: Text('LOG OUT',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    )),
              ),
            ),
          ),
        ],
      ),

      //for bottom navbar ------------------------------
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}

//class for button navigation bar ------------------------------
class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: navBarBg,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Image.asset(
              dashboardUnselected,
            ),
            onPressed: () {
              /*Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DashboardPage()),
              );*/
            },
          ),
          IconButton(
            icon: Image.asset(
              summaryUnselected,
            ),
            onPressed: () {
              /*Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SummaryPage()),
              );*/
            },
          ),
          IconButton(
            icon: Image.asset(
              financialContentsUnselected,
            ),
            onPressed: () {
              /*Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SummaryPage()),
              );*/
            },
          ),
          IconButton(
            icon: Image.asset(
              profileSelected,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfilePage(
                          fullname: "Name",
                          email: "example@gmail.com",
                          birthdate: "2024-02-17",
                          sex: 'Sex',
                        )),
              );
            },
          ),
        ],
      ),
    );
  }
}

// class for the edit profile page ------------------------------------------------------------
class EditProfile extends StatefulWidget {
  const EditProfile({super.key});
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? image; //for fileimage handle ------------------------------

  //method for getting image from gallery ------------------------------
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('Failed to pick image: $e');
    }
  }

  //text editing controller for fullname,email,and birthdate ------------------------------
  final _fullnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _birthdateController = TextEditingController();

  //method for selecting a date in date picker ------------------------------
  Future<void> _birthdate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _birthdateController.text = picked.toString().split(" ")[0];
      });
    }
  }

  // Define a list of items for the dropdown menu ------------------------------
  List<String> items = ['Male', 'Female', 'Prefer not to say'];

  // Variable to hold the currently selected item ------------------------------
  String sex = 'Male';

  //this is the alert dialog that requires all fields to be filled ------------------------------
  _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Required'),
          content: const Text('Any field cannot be empty'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('Second Page'),
      ),*/
      body: Column(children: [
        //container ------------------------------
        SizedBox(
          height: 270,
          width: 400,
          child: ColoredBox(
            color: const Color(0xFF43817F),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 50, bottom: 10),
                  //profile text ------------------------------
                  child: Text(userProfile,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      )),
                ),
                //for getting the image if not null ------------------------------
                image != null
                    ? Image.file(image!)
                    : const CircleAvatar(
                        radius: 55,
                        backgroundColor: Colors.white,
                      ),
                const SizedBox(height: 20),
                // this is the change picture button ------------------------------
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 110),
                  child: ElevatedButton(
                    onPressed: () => pickImage(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff153836),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text(changePicture,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 20),

        //container for all the details in the body ------------------------------
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              children: [
                //fullname label ------------------------------
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Fullname',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          //backgroundColor: Colors.grey,
                          fontSize: 16,
                        )),
                  ],
                ),
                //fullname text field ------------------------------
                TextField(
                  controller: _fullnameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //email label ------------------------------
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          //backgroundColor: Colors.grey,
                          fontSize: 16,
                        )),
                  ],
                ),
                //email text field ------------------------------
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ), // Optional border
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //birthdate label ------------------------------
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Birthdate',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          //backgroundColor: Colors.grey,
                          fontSize: 16,
                        )),
                  ],
                ),
                //bithdate date picker calendar ------------------------------
                TextField(
                  controller: _birthdateController,
                  decoration: InputDecoration(
                      labelText: 'Select Date',
                      filled: true,
                      suffixIcon: const Icon(Icons.calendar_today),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(color: Colors.grey)),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      )),
                  readOnly: true,
                  onTap: () {
                    _birthdate();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                //sex label ------------------------------
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sex',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          //backgroundColor: Colors.grey,
                          fontSize: 16,
                        )),
                  ],
                ),
                //dropdown for sex ------------------------------
                Center(
                  child: DropdownButton<String>(
                    borderRadius: BorderRadius.circular(10.0),
                    value: sex,
                    icon: const Icon(Icons.person_sharp),
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                    underline: Container(
                      height: 2,
                      color: Colors.grey,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        sex = newValue!;
                      });
                    },
                    isExpanded: true,
                    items: items.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                //------------------------------------------------
              ],
            ),
          ),
        ),

        const SizedBox(
          height: 30,
        ),

        //this is for 2 buttons, cancel, update ------------------------------
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //this is for cancel button ------------------------------
            Padding(
              padding: const EdgeInsets.only(left: 70.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: cancelButton,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Text(pCancel,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      )),
                ),
              ),
            ),

            //this is for update button ------------------------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                onPressed: () {
                  if (_fullnameController.text.isEmpty |
                      _emailController.text.isEmpty |
                      _birthdateController.text.isEmpty) {
                    _showErrorDialog(
                        context, 'The text field cannot be empty.');
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfilePage(
                                fullname: _fullnameController.text,
                                email: _emailController.text,
                                birthdate: _birthdateController.text,
                                sex: sex,
                              )),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: updateButton,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Text(pUpdate,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      )),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
