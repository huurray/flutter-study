import 'package:flutter/material.dart';

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({
    super.key,
    required this.onChanged,
    this.width,
    this.height,
    this.text = '',
    this.value = false,
    this.required = false,
    this.backgroundColor,
    this.action,
  });

  final Function(bool) onChanged;
  final double? width;
  final double? height;
  final String text;
  final bool value;
  final bool required;
  final Color? backgroundColor;
  final Widget? action;

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  void _onChanged() {
    widget.onChanged(!widget.value);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onChanged,
      child: Container(
        width: widget.width,
        height: widget.height ?? 56,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(widget.value
                  ? Icons.check_box
                  : Icons.check_box_outline_blank),
              if (widget.text != '')
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    widget.text,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              if (widget.required)
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Container(
                    color: Colors.amber,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 4,
                      ),
                      child: Text(
                        'Required',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                ),
              if (widget.action != null) const Spacer(),
              if (widget.action != null) widget.action!,
            ],
          ),
        ),
      ),
    );
  }
}
