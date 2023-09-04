import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sports_app/Shared/Colors.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late String _username;
  late String _email;

  @override
  void initState() {
    super.initState();
    _username = '';
    _email = '';
  }

  void _saveChanges() {
    // Do something to save the changes.
    setState(() {
      // Update the state of the widgets.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Username'),
            onChanged: (value) {
              _username = value;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Email'),
            onChanged: (value) {
              _email = value;
            },
          ),
          InkWell(
            child: Text('Save'),
            onTap: _saveChanges,
          ),
        ],
      ),
    );
  }
}
