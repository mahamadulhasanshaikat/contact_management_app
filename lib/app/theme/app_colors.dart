import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary Branding & AppBar
  static const Color primary = Color(0xFF4B45D9);
  static const Color appbar = Color(0xFF413ED1);

  // Light Mode Colors
  static const Color background = Color(0xFFF8F9FD);
  static const Color surface = Colors.white;

  // Modern Soft Dark Mode Colors (Comfortable on Eyes)
  static const Color darkBackground = Color(
    0xFF16171D,
  ); // মূল পেজের ব্যাকগ্রাউন্ড (নরম ডার্ক)
  static const Color darkSurface = Color(
    0xFF21232B,
  ); // কার্ড ও টেক্সটফিল্ডের ব্যাকগ্রাউন্ড
  static const Color darkAppbar = Color(0xFF1C1D24); // ডার্ক অ্যাপবার
  static const Color darkBorder = Color(0xFF2E313D); // সূক্ষ্ম বর্ডার কালার

  // Text & Borders
  static const Color text = Color(0xFF171725);
  static const Color mutedText = Color(0xFF7A7B87);
  static const Color border = Color(0xFFE5E5EC);

  // Status & Actions
  static const Color danger = Color(0xFFF04444);
  static const Color favorite = Color(0xFFF7B51D);
}
