

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qlphongtro/app/modules/home/controllers/home_controller.dart';
import 'package:qlphongtro/app/modules/home_admin/views/home_admin_page.dart';

class HomePage extends GetView<HomeController>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Admin Panel',
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor:Colors.white,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.white)
      ),
      home: HomeAdminPage()
    );
  }


}