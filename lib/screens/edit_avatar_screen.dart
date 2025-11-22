import 'package:_3d_avatar_gen/constants/avatar_constants.dart';
import 'package:_3d_avatar_gen/constants/color_selection_constant.dart';
import 'package:_3d_avatar_gen/constants/item_selection_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditAvatarScreen extends StatefulWidget {
  const EditAvatarScreen({super.key});

  @override
  State<EditAvatarScreen> createState() => _EditAvatarScreenState();
}

class _EditAvatarScreenState extends State<EditAvatarScreen> {
  int _selectedItemIndex = 0;
  int? _selectedColorIndex;
  int _selectedAvatarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 20.0, top: 20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey[300]!, width: 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6.0),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.arrow_back_ios, size: 16),
                      ),
                    ),
                  ),
                  Text(
                    "Save",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),

              Image.asset(
                AvatarConstants.avatarSelectionAssets[_selectedAvatarIndex],
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),

              SizedBox(height: 40),

              // items selection
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: ItemSelectionConstants.eyeAccessories.length,
                  itemBuilder: (context, index) {
                    final item = ItemSelectionConstants.eyeAccessories[index];
                    final isSelected = _selectedItemIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedItemIndex = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              item,
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: isSelected
                                    ? Colors.deepPurpleAccent
                                    : Colors.grey[500],
                              ),
                            ),
                            SizedBox(height: 4),
                            if (isSelected)
                              Container(
                                width: 6,
                                height: 6,
                                decoration: BoxDecoration(
                                  color: Colors.deepPurpleAccent,
                                  shape: BoxShape.circle,
                                ),
                              )
                            else
                              SizedBox(height: 6),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 20),

              // color selection
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: ColorSelectionConstants.colorSelection.length,
                  itemBuilder: (context, index) {
                    final isSelected = _selectedColorIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedColorIndex = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected
                                  ? Colors.black
                                  : Colors.transparent,
                              width: isSelected ? 3 : 1,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(
                                  ColorSelectionConstants.colorSelection[index],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 20),

              // avatar selection
              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: AvatarConstants.avatarSelectionAssets.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedAvatarIndex = index;
                        });
                      },
                      child: SizedBox(
                        width: 120,
                        height: 120,
                        child: Image.asset(
                          AvatarConstants.avatarSelectionAssets[index],
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 20),

              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Transform.rotate(
                    angle: 90 * 3.1415926535 / 180,
                    child: Icon(
                      Icons.arrow_forward_ios_sharp, 
                      size: 20),
                  ),
                  Transform.rotate(
                    angle: 90 * 3.1415926535 / 180,
                    child: Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Colors.grey[400],
                      size: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
