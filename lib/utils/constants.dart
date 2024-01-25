import 'package:flutter/material.dart';

/* -- LIST OF ALL COLORS -- */
// global
const primLightBg = Color(0xFFFAF7F3);
const seconDarkBg = Color(0xFF39524F);
const navBarBg = Color(0xFF39524F);
const darkText = Color(0xFF2F2C2C);
const lightText = Color(0xFFD5D0CA);
const lighterText = Color(0xFFFFFFFF); // for summary
const textBoxBorder = Color(0xFFA9A9A9); // weight: 1

// dashboard panel
const dropdownBg = Color(0xFFA19893);
const dashboardActiveCard = Color(0xFFA4C7C9);
const dashboardInactiveCard = Color(0xFFD5D0CA);
const viewAllButton = Color(0xFF39524F);
const transactionItemBg = Color(0xFFD5D0CA);
const transactionDescrip = Color(0xFF6B6A66);
const transactionDeduct = Color(0xFFB21616);
const transactionAdd = Color(0xFF46672C);
const calendarLightText = Color(0xFFD9D9D9);

// summary panel
const sectionTitleBg = Color(0xFFA4C7C9);
const graphBg = Color(0xFFD5D0CA);
const addCategText = Color(0xFF2F2C2C);

// financial content panel
const categBg = Color(0xFF39524F);
const contentsBg = Color(0xFF165E5B);
const finContentBg = Color(0xFF8CD4CC);

// profile
const profileDarkBg = Color(0xFF43817F);
const profilesectionBg = Color(0xFFE4DCCF); // personal info, contact
const cancelButton = Color(0xFFB21616);
const updateButton = Color(0xFF008B16);

/* -- LIST OF ALL IMAGE ASSETS -- */
// global icons
const String darkBackButton = "lib/assets/images/GlobalIcons/slamup_logo.png";
const String darkBackButton = "lib/assets/images/GlobalIcons/hide_password_button.png";
const String darkBackButton = "lib/assets/images/GlobalIcons/dark_back_button.png";
const String lightBackButton = "lib/assets/images/GlobalIcons/light_back_button.png";

// navigation bar buttons
const String dashboardSelected = "lib/assets/images/NavigationBarButtons/dashboard_selected.png";
const String dashboardUnselected = "lib/assets/images/NavigationBarButtons/dashboard_unselected.png";
const String financialContentsSelected = "lib/assets/images/NavigationBarButtons/financial_contents_selected.png";
const String financialContentsUnselected = "lib/assets/images/NavigationBarButtons/financial_contents_unselected.png";
const String profileSelected = "lib/assets/images/NavigationBarButtons/profile_selected.png";
const String profileUnselected = "lib/assets/images/NavigationBarButtons/profile_unselected.png";
const String summarySelected = "lib/assets/images/NavigationBarButtons/summary_selected.png";
const String summaryUnselected = "lib/assets/images/NavigationBarButtons/summary_unselected.png";

// notification buttons and icons
const String notifButton = "lib/assets/images/NotificationButtonsAndIcons/notification_button.png";
const String noNotifIcon = "lib/assets/images/NotificationButtonsAndIcons/no_notif_icon.png";
const String readIcon = "lib/assets/images/NotificationButtonsAndIcons/read_icon.png";
const String unreadIcon = "lib/assets/images/NotificationButtonsAndIcons/unread_icon.png";

// transaction icons
const String clothingIcon = "lib/assets/images/TransactionIcons/clothing_icon.png";
const String debtPaymentIcon = "lib/assets/images/TransactionIcons/debt_payment_icon.png";
const String educationIcon = "lib/assets/images/TransactionIcons/education_icon.png";
const String entertainmentIcon = "lib/assets/images/TransactionIcons/entertainment_icon.png";
const String foodIcon = "lib/assets/images/TransactionIcons/food_icon.png";
const String giftIcon = "lib/assets/images/TransactionIcons/gift_icon.png";
const String healthIcon = "lib/assets/images/TransactionIcons/health_icon.png";
const String housingIcon = "lib/assets/images/TransactionIcons/housing_icon.png";
const String insuranceIcon = "lib/assets/images/TransactionIcons/insurance_icon.png";
const String miscellaneousIcon = "lib/assets/images/TransactionIcons/miscellaneous_icon.png";
const String savingsIcon = "lib/assets/images/TransactionIcons/savings_icon.png";
const String transportationIcon = "lib/assets/images/TransactionIcons/transportation_icon.png";
const String utilitiesIcon = "lib/assets/images/TransactionIcons/utilities_icon.png";
const String vacationIcon = "lib/assets/images/TransactionIcons/vacation_icon.png";

/* 
  // GLOBAL
    appbar title and others not mentioned: Poppins Bold
    label for input box: Poppins Medium
    text input: Poppins Regular

  // NOTIFICATION
    notification unread and all: Poppins Medium
    "There are Currently No Notifications to Display.": Poppins Semi Bold
    notication message: Poppins Regular

  // DASHBOARD
    calendar days (sunday-monday): Poppins Bold
    calendar days (1-31): Poppins Regular
  
  // SUMMARY
    summary sections: Poppins Semi Bold
    categories: Poppins Medium
    "Categories - Future Spending Prediction: - Total Budget Amount:": Poppins Semi Bold
    "CATEGORIES - PERCENTAGE": Poppins Semi Bold

  // FINANCIAL CONTENTS
    articles, videos, etc. label: Poppins Semi Bold

  // PROFILE
    sections "PERSONAL INFORMATION - CONTACT INFO": Poppins Semi Bold
    text under the section: "Name - Email - Birthdate - Sex": Poppins Medium
*/

/*
Text(
  'Title',
  style: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: darkText,
  ),
),
TextField(
  style: TextStyle(
    fontFamily: 'Poppins',
    color: darkText,
  ),
  decoration: InputDecoration(
    hintText: 'Enter title',
    hintStyle: TextStyle(
      fontFamily: 'Poppins',
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
          10.0),
      borderSide:
          BorderSide(color: Color(0xFFA9A9A9), width: 2.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide:
          BorderSide(color: Color(0xFFA9A9A9), width: 2.0),
    ),
  ),
  cursorColor: Color(0xFF2F2C2C),
),
*/
