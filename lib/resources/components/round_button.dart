import 'package:flutter/material.dart';
import 'package:mvvm_architecture/resources/colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool isLoading;
  final VoidCallback onPress;
  const RoundButton(
      {super.key,
      required this.title,
      this.isLoading = false,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: AppColors.buttonColor,
            borderRadius: BorderRadius.circular(15)),
        width: 200,
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(color: AppColors.whiteColor)
              : Text(
                  title,
                  style: const TextStyle(color: AppColors.whiteColor),
                ),
        ),
      ),
    );
  }
}
