import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_store_app/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 80.0,
              right: 80.0,
              bottom: 40.0,
              top: 160.0,
            ),
            child: Image.asset('img/avocado.jpg'),
          ),
          Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              'We deliver groceries to your doorstep',
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSerif(
                  fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            'Fresh everyday!',
            style: TextStyle(color: Colors.grey[600]),
          ),
          Spacer(),
          GestureDetector(
            onTap: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return HomePage();
            })),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(12)),
              padding: EdgeInsets.all(24.0),
              child: Text(
                'Get started!',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
