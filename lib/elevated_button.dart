import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void proceedToLogin(String? selectedLogin) async {
  String url;
  switch (selectedLogin) {
    case "Individual":
      url = "https://halalvest.co/login";
      break;
    case "Agent":
      url = "https://halalvest.co/agent";
      break;
    case "Merchant":
      url = "https://halalvest.co/merchant";
      break;
    case "Staff":
      url = "https://halalvest.co/staff";
      break;
    case "Aggregator":
      url = "https://halalvest.co/aggregator";
      break;
    default:
      return;
  }

  // ignore: deprecated_member_use
  if (await canLaunch(url)) {
    // ignore: deprecated_member_use
    await launch(url, forceSafariVC: false, forceWebView: false);
  } else {
    throw "Could not launch $url";
  }
}


ElevatedButton elevatedButton(double buttonWidth, String? selectedLogin) {
    return ElevatedButton(
                onPressed:
                    selectedLogin == null ? null : () => proceedToLogin(selectedLogin),
                style: ElevatedButton.styleFrom(
                  disabledForegroundColor:
                      Colors.black, // Custom disabled text color
                  disabledBackgroundColor:
                      Colors.white, // Custom disabled background color
                  padding: EdgeInsets.symmetric(
                      horizontal: buttonWidth * 0.25, vertical: 18),
                  foregroundColor:
                      selectedLogin == null ? Colors.black : Colors.white,
                  backgroundColor:
                      selectedLogin == null ? Colors.white : Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  selectedLogin == null
                      ? "Choose a way to login"
                      : "Proceed as $selectedLogin",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    //color: selectedLogin == null ? Colors.black : Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
  }
