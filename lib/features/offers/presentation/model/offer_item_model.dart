import 'package:flutter/material.dart';

class OfferItemModel {
  final String title;
  final String description;
  final String footer;
  final IconData footerIcon;
  final String badge;
  final String logoText;
  final Color logoColor;
  final String imageUrl;

  const OfferItemModel({
    required this.title,
    required this.description,
    required this.footer,
    required this.footerIcon,
    required this.badge,
    required this.logoText,
    required this.logoColor,
    required this.imageUrl,
  });
}
