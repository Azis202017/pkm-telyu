import 'package:flutter/material.dart';

List<BoxShadow> dropShadow = [
  const BoxShadow(
    offset: Offset(-7, 7),
    blurRadius: 26,
    color: Color.fromRGBO(237, 237, 237, 0.02),
  ),
  const BoxShadow(
    offset: Offset(-5, 7),
    blurRadius: 16,
    color: Color.fromRGBO(237, 237, 237, 0.15),
  ),
  const BoxShadow(
    offset: Offset(-3, 6),
    blurRadius: 9,
    color: Color.fromRGBO(237, 237, 237, 0.5),
  ),
  const BoxShadow(
    offset: Offset(-1, 4),
    blurRadius: 4,
    color: Color.fromRGBO(237, 237, 237, 0.5),
  ),
  const BoxShadow(
    offset: Offset(0, 2),
    blurRadius: 1,
    color: Color.fromRGBO(237, 237, 237, 0.98),
  ),
  const BoxShadow(
    offset: Offset(0, 0),
    blurRadius: 0,
    color: Color(0xffEDEDED),
  ),
];
