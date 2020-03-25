import 'package:flutter/material.dart';

/// A [FilledButton] that fills the width of its container.
const defaultMaxWidthButtonPadding =
    EdgeInsets.symmetric(horizontal: 24, vertical: 10);

class MaxWidthFilledButton extends StatelessWidget {
  MaxWidthFilledButton({
    Key key,
    @required this.title,
    @required VoidCallback onPressed,
    this.buttonColor,
    this.textColor,
    this.margin,
    this.overflow,
    bool trackImpression = false,
  })  : assert(title?.isNotEmpty ?? false),
        _onPressed = onPressed,
        super(key: key);

  final VoidCallback _onPressed;
  final String title;
  final Color buttonColor;
  final Color textColor;

  /// The margin to use around the button, defaults to `null`, meaning no margin
  final EdgeInsets margin;
  final TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return margin == null
        ? buildButton(context)
        : Padding(padding: margin, child: buildButton(context));
  }

  Widget buildButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        padding: defaultMaxWidthButtonPadding,
        onPressed: _onPressed,
        animationDuration: Duration.zero,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(color: textColor),
        ),
        color: buttonColor,
      ),
    );
  }
}
