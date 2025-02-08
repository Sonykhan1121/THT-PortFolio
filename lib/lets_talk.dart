import 'package:flutter/material.dart';

class LetsTalk extends StatelessWidget {
  const LetsTalk({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal:30),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orange),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(

        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress, // For email input
            decoration: const InputDecoration(
              hintText: 'Enter your email',
              border: InputBorder.none, // Remove default border inside
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 10), // Padding inside text field
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              // You can add more email validation here if needed
              return null;
            },
          ),
          Positioned(
            right:10,
            top:8,
            child: ElevatedButton(
              onPressed: () {

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange, // Example orange color
                foregroundColor: Colors.white,

                padding: const EdgeInsets.symmetric(horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),

                ),
              ),
              child: const Text('Send'),
            ),
          ),
        ],
      ),
    );
  }
}
