import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildLoginOption(IconData icon, String label, bool isSelected) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border:
                isSelected ? Border.all(color: Colors.green, width: 3) : null,
          ),
          child: CircleAvatar(
            radius: 27,
            foregroundColor: Colors.green,
            backgroundColor: Colors.white,
            child: Icon(
              icon,
              size: 30,
              color: Colors.green,
            ),
          ),
        ),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(10), // Rounded corners
          child: Container(
            // height: 10,
            padding: const EdgeInsets.only(bottom: 8), // Add spacing here
            decoration: isSelected
                ? const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.green,
                        width: 2,
                      ),
                    ),
                  )
                : null,
            child: Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 11,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
