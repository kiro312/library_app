// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:library_app/constant_colors.dart';

class LoaderWidget extends StatefulWidget {
  const LoaderWidget({Key? key}) : super(key: key);

  @override
  State<LoaderWidget> createState() => _LoaderWidgetState();
}

class _LoaderWidgetState extends State<LoaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.backgroundColor),
      child: Center(
        child: SizedBox(
          height: 100.0,
          width: 100.0,
          child: CircularProgressIndicator(
            strokeWidth: 10,
            color: AppColors.secondaryColor,
            backgroundColor: AppColors.mainColor,
          ),
        ),
      ),
    );
  }
}
