import 'package:flutter/material.dart';

class ResultIcon extends StatelessWidget {
  const ResultIcon({
    super.key,
    required this.trueIcon,
  });
  final bool trueIcon;

  @override
  Widget build(BuildContext context) {
    return Icon(
      trueIcon ? Icons.check : Icons.close,
      color: trueIcon ? const Color(0xff4CB050) : const Color(0xffEF443A),
      size: 40,
    );
  }
}
