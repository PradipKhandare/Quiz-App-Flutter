import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Column(
        children: [
          const SizedBox(
            height: 90,
          ),
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              width: 300,
              height: 400,
              color: const Color.fromARGB(150, 255, 255, 255),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
           Text(
            "Learn flutter the fun way!",
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 24
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton.icon(
            onPressed: startQuiz,
            style: ButtonStyle(
              backgroundColor:
              MaterialStateProperty.all<Color>(Colors.deepPurple),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                    side: BorderSide(color: Colors.black, width: 0.5)),
              ),
            ),
            icon: const Icon(
              Icons.arrow_right_alt,
              color: Colors.white,
            ),
            label: const Text(
              'Start Quiz',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
