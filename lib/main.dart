import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/application/app_controller.dart';
import 'app/routes/app_pages.dart';
import 'app/core/values/constan.dart';

void main() {

  getPlatform();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner : false,
      title: "Phong Tro FStack",
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        canvasColor: secondaryColor,
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

void getPlatform() => GetPlatform.isMobile ? isMobile = !isMobile : isWeb = !isWeb;