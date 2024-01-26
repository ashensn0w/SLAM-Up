// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      /*appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {},
          ),
        ],
      ),*/

      body: ListView(
        children: [
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('PROFILE',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                ]),
          ),
          SizedBox(
            height: 10,
          ),
          CircleAvatar(
            radius: 50,
            backgroundImage:
                NetworkImage('https://example.com/profile_picture.jpg'),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfile()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF43817F),
            ),
            child: Padding(
              padding: const EdgeInsets.all(
                5.0,
              ),
              child: Text('Edit Profile',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 255, 255, 255),
                  )),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('PERSONAL INFORMATION',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.grey,
                      fontSize: 18,
                    )),
                const SizedBox(height: 20.0),
                Text('Name',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(height: 4.0),
                Text('example@email.com',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(height: 4.0),
                Text('1990-01-01',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(height: 4.0),
                Text('Male',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          ),


          SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF43817F),
              ),
              child: Text(
                'LOG OUT',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ))
        ],
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('Second Page'),
      ),*/
      body: ListView(children: [
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Text('PROFILE',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )),
          ]),
        ),
        SizedBox(
          height: 0,
        ),
        CircleAvatar(
          radius: 50,
          //backgroundImage: AssetImage('lib/assets/images/img.jpg'),
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EditProfile()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF43817F),
          ),
          child: Padding(
            padding: const EdgeInsets.all(
              5.0,
            ),
            child: Text('Change picture',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(255, 255, 255, 255),
                )),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 50, // Desired width
          height: 40, // Desired height
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Fullname', // Optional label
              border: OutlineInputBorder(), // Optional border
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 50, // Desired width
          height: 40, // Desired height
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Email', // Optional label
              border: OutlineInputBorder(), // Optional border
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 50, // Desired width
          height: 40, // Desired height
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Birthdate', // Optional label
              border: OutlineInputBorder(), // Optional border
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 50, // Desired width
          height: 40, // Desired height
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Password', // Optional label
              border: OutlineInputBorder(), // Optional border
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff52dc57),
            ),
            child: Text(
              'Update',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            )),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: Text(
              'Cancel',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ))
      ]),
    );
  }
}
