import 'package:flutter/material.dart';

class Homeui extends StatelessWidget {
  const Homeui({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, "/next");
            },
            child: const Text("Go to next page"),
          ),
          const Center(
            child: Text("Tapendra Bista"),
          ),
        ],
      ),
    );
  }
}
