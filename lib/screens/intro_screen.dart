import 'package:_3d_avatar_gen/resources/resources.dart';
import 'package:_3d_avatar_gen/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        left: false,
        right: false,
        top: false,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              Images.bg,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 400,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                        top: 0,
                        right: 70,
                        child: Transform.rotate(
                          angle: -0.1,
                          child: Image.asset(
                            Images.i3,
                            width: 330,
                            height: 330,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 100,
                        left: 120,
                        child: Transform.rotate(
                          angle: 0.3,
                          child: Image.asset(
                            Images.i4,
                            width: 300,
                            height: 300,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                Text(
                  'New Update',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.deepPurple,
                  ),
                ),
                SizedBox(height: 10),

                Text(
                  '3D Avatar',
                  style: GoogleFonts.poppins(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Generator',
                  style: GoogleFonts.poppins(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),

                SizedBox(height: 60),

                // swipe button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 90),
                  child: SwipeButton.expand(
                    height: 70,
                    thumbPadding: EdgeInsets.all(6),
                    thumb: Icon(
                      Icons.double_arrow_rounded,
                      color: Colors.white,
                    ),
                    activeThumbColor: Colors.deepPurple,
                    activeTrackColor: Colors.white,
                    onSwipe: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Start",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
