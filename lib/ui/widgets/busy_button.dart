
import 'package:ecourse/ui/shared/shared_styles.dart';
import 'package:flutter/material.dart';

class BusyButton extends StatefulWidget {
  final bool busy;
  final String title;
  final Function()? onPressed;
  final bool enabled;

  const BusyButton({
    Key? key, required this.title,
    this.busy = false,
    this.onPressed,  this.enabled = true
  }) : super(key: key);

  @override
  _BusyButtonState createState() => _BusyButtonState();
}

class _BusyButtonState extends State<BusyButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: InkWell(
        child: AnimatedContainer(
          height: widget.busy ? 48 : null,
          width: widget.busy ? double.infinity : null,
          duration: const Duration(milliseconds: 300),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: widget.enabled ? Colors.white : Colors.grey[300],
            borderRadius: BorderRadius.circular(30),
          ),
          child: !widget.busy ? Text(
            widget.title,
            style: buttonTitleTextStyle,
          )
              : const CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)),
        ),
      ),
    );
  }
}