import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/shard/color.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customButton({
  double? height,
  required String text,
  void Function()? onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: primaryColor,
      ),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.padauk(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
    ),
  );
}
