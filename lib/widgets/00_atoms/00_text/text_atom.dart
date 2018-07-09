import 'package:flutter/material.dart';
import '../../theme.dart';

class AtomText extends StatelessWidget {
  const AtomText(this.title,
      {this.textAlign = TextAlign.left,
      this.color = CustomColors.COLOR_ORANGE,
      this.size = CustomSizes.SIZE_18})
      : assert(textAlign != null);

  const AtomText.appbar(this.title,
      {this.textAlign = TextAlign.center,
      this.color = CustomColors.COLOR_WHITE,
      this.size = CustomSizes.SIZE_14})
      : assert(textAlign != null);

  const AtomText.description(this.title,
      {this.textAlign = TextAlign.justify,
      this.color = CustomColors.COLOR_BLACK,
      this.size = CustomSizes.SIZE_12})
      : assert(textAlign != null);

  final String title;
  final TextAlign textAlign;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: TextStyle(color: color, fontSize: size),
    );
  }
}
