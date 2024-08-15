// Yahya Mahmoud

import 'package:flutter/material.dart';

class toggleSections extends ChangeNotifier {
  // will be determined when user click on menu button
  String activeSection = "Materials"; // at first materials section is activated
   
  void active(String s) {
    if(activeSection != s) { // to avoid extra rerenders
      activeSection = s;
    }
    notifyListeners();
  }
}
