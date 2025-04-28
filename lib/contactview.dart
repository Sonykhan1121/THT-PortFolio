import 'package:flutter/material.dart';

class ContactView extends StatefulWidget {
  final TabController controller;

  ContactView({required this.controller});

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  String? selectedService;
  String? selectedBudget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: <Widget>[
              SizedBox(height: 30,),
              Align(
                alignment: Alignment.center,
                child: Text(
                  textAlign: TextAlign.center,
                  'Let\'s Start a Conversation',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                textAlign: TextAlign.center,
                'Have questions or need assistance? We\'re here to help! Reach out to us, and we\'ll get back to you as soon as possible.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 70),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Enter Your Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: selectedService,
                decoration: InputDecoration(
                  labelText: 'Select Service',
                  border: OutlineInputBorder(),
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedService = newValue;
                  });
                },
                items: <String>['Service 1', 'Service 2', 'Service 3']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: selectedBudget,
                decoration: InputDecoration(
                  labelText: 'Budget Range',
                  border: OutlineInputBorder(),
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedBudget = newValue;
                  });
                },
                items: <String>['\$0-\$500', '\$500-\$1500', '\$1500+']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: messageController,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Message',
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    // Implement what happens when the form is submitted
                  },
                  child: Text(
                    'Send Message',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, // Background color
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
