import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.trueButton,
    required this.onPressed,
  });
  final bool trueButton;
  final void Function(bool) onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
        width: double.infinity,
        height: 70,
        child: ElevatedButton(
          onPressed: () {
            return onPressed(trueButton);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: trueButton
                  ? const Color(0xff4CB050)
                  : const Color(0xffEF443A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              )),
          child: Text(
            trueButton ? 'Туура' : 'Туура эмес',
            style: const TextStyle(color: Colors.white, fontSize: 32),
          ),
        ),
      ),
    );
  }
}
