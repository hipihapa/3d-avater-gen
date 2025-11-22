import 'package:_3d_avatar_gen/components/nav_bar_button.dart';
import 'package:_3d_avatar_gen/models/avatar_model.dart';
import 'package:_3d_avatar_gen/resources/resources.dart';
import 'package:_3d_avatar_gen/screens/edit_avatar_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;
  int? _selectedAvatarIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            Images.bg2,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),

          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi, Sulivan 👋",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[600],
                    ),
                  ),
                  Text(
                    "Create your",
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Avatar",
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),

                  SizedBox(height: 10),

                  // avatar list
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.only(bottom: 100),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        // crossAxisSpacing: 10,
                        // mainAxisSpacing: 5,
                      ),
                      itemCount: AvatarModel.avatars.length,
                      itemBuilder: (context, index) {
                        final avatar = AvatarModel.avatars[index];
                        final isSelected = _selectedAvatarIndex == index;
                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedAvatarIndex =
                                    _selectedAvatarIndex == index
                                    ? null
                                    : index;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(30),
                                border: isSelected
                                    ? Border.all(
                                        color: Colors.deepPurpleAccent,
                                        width: 3,
                                      )
                                    : null,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          top: 40.0,
                                          bottom: 10.0,
                                          left: 40.0,
                                          right: 40.0,
                                        ),
                                        child: Image.asset(
                                          avatar.imagePath,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                      vertical: 8.0,
                                    ),
                                    child: Text(
                                      avatar.description,
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Floating navbar
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 18,
                ),
                decoration: BoxDecoration(color: Colors.transparent),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    NavBarButton(
                      icon: Images.menu,
                      isActive: _selectedIndex == 0,
                      size: 22,
                      onTap: () {
                        setState(() {
                          _selectedIndex = 0;
                        });
                        // TODO: Handle menu tap
                      },
                    ),
                    SizedBox(width: 60),
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        shape: BoxShape.circle,
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: NavBarButton(
                              icon: Images.circle,
                              iconColor: Colors.white,
                              isActive: _selectedIndex == 1,
                              onTap: () {
                                setState(() {
                                  _selectedIndex = 1;
                                });
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const EditAvatarScreen(),
                                  ),
                                );
                              },
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 8,
                            child: Image.asset(
                              Images.dot,
                              width: 20,
                              height: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 60),
                    NavBarButton(
                      icon: Images.setting,
                      isActive: _selectedIndex == 2,
                      onTap: () {
                        setState(() {
                          _selectedIndex = 2;
                        });
                        // TODO: Handle settings tap
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
