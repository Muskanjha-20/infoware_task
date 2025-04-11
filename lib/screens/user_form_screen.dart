import 'package:flutter/material.dart';

class UserFormScreen extends StatefulWidget {
  const UserFormScreen({super.key});

  @override
  State<UserFormScreen> createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _gender;
  String? _country;
  String? _state;
  String? _city;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        elevation: 4,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          "User Form",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Name"),
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter your name'
                    : null,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: "Email"),
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Please enter your email';
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value))
                    return 'Enter valid email';
                  return null;
                },
              ),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(labelText: "Phone"),
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Enter phone number';
                  if (value.length != 10) return 'Phone should be 10 digits';
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: _gender,
                hint: Text("Select Gender"),
                items: ['Male', 'Female', 'Other']
                    .map((e) => DropdownMenuItem(child: Text(e), value: e))
                    .toList(),
                onChanged: (val) => setState(() => _gender = val),
                validator: (value) => value == null ? 'Select gender' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Country"),
                onChanged: (val) => _country = val,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter country' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "State"),
                onChanged: (val) => _state = val,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter state' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "City"),
                onChanged: (val) => _city = val,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter city' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Submit or show success
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Form Submitted!')),
                    );
                  }
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
