import 'package:easecar/app/theme/app_colors.dart';
import 'package:easecar/app/theme/text_style_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localization/localization.dart';

class TextFormFieldCustom extends StatefulWidget {
  final String title;
  final String hintText;
  final TextEditingController? textEditingController;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final bool obscureText;
  final String? initialValue;
  final TextStyle? titleFormFieldStyle;
  final bool disabled;
  final Color colorBorder;
  final Color backgroundColor;
  final String? statusText;
  final Color? hintStyleColor;

  const TextFormFieldCustom({
    super.key,
    required this.title,
    this.statusText,
    required this.hintText,
    this.textEditingController,
    this.inputFormatters,
    this.keyboardType,
    this.suffixIcon,
    this.validator,
    this.obscureText = false,
    this.initialValue,
    this.titleFormFieldStyle,
    this.disabled = false,
    this.colorBorder = Colors.white,
    this.backgroundColor = Colors.white,
    this.hintStyleColor,
  });

  @override
  State<TextFormFieldCustom> createState() => _TextFormFieldCustomState();
}

class _TextFormFieldCustomState extends State<TextFormFieldCustom> {
  @override
  void initState() {
    _initTextController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 6.0),
          child: Text(
            widget.title,
            style: widget.titleFormFieldStyle ??
                TextStyleCustom.titleFormFieldStyle,
          ),
        ),
        Visibility(
          visible: widget.statusText != null,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 6.0),
            child: _status(
              statusText: widget.statusText ?? "",
              colorStatus: widget.statusText == "pedding".i18n()
                  ? AppColors.statePadding
                  : AppColors.red,
            ),
          ),
        ),
        TextFormField(
          inputFormatters: widget.inputFormatters,
          keyboardType: widget.keyboardType,
          controller: widget.textEditingController,
          validator: widget.validator,
          obscureText: widget.obscureText,
          enabled: !widget.disabled,
          decoration: InputDecoration(
            suffixIcon: widget.suffixIcon,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 15.0,
              horizontal: 10.0,
            ),
            fillColor: widget.disabled
                ? const Color.fromARGB(129, 208, 207, 207)
                : const Color(0xffEBEAEA),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.colorBorder,
                width: 2.0,
              ),
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
            hintText: widget.hintText,
            helperStyle: const TextStyle(
              color: Color(0xff9D9D9D),
              fontSize: 16,
              fontWeight: FontWeight.w100,
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 252, 161, 128),
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.disabled ? Colors.transparent : AppColors.white,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.disabled ? Colors.transparent : AppColors.white,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            errorStyle: TextStyleCustom.errorTextFormFieldStyle,
            errorMaxLines: 10,
            hintStyle: TextStyle(
              color: widget.disabled
                  ? const Color(0xff6F6565)
                  : widget.hintStyleColor,
            ),
          ),
        ),
      ],
    );
  }

  void _initTextController() {
    if (widget.initialValue != null) {
      widget.textEditingController!.text = widget.initialValue!;
    }
  }

  Widget _status({required String statusText, required Color colorStatus}) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
      decoration: BoxDecoration(
        color: colorStatus,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        statusText,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}
