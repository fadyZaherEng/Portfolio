import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';

class CustomTextFieldWithSuffixIconWidget extends StatefulWidget {
  final TextEditingController controller;
  final String labelTitle;
  final String? errorMessage;
  final VoidCallback onTap;
  final TextInputType textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final Widget suffixIcon;
  final bool isReadOnly;
  final Function(String)? onSubmitted;
  final Function(String)? onChange;
  final int maxLine;
  final bool isDarkMode;

  const CustomTextFieldWithSuffixIconWidget({
    Key? key,
    required this.controller,
    required this.labelTitle,
    required this.onTap,
    required this.suffixIcon,
    this.errorMessage,
    this.textInputType = TextInputType.text,
    this.inputFormatters,
    this.isReadOnly = false,
    this.onSubmitted,
    required this.onChange,
    required this.maxLine,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  State<CustomTextFieldWithSuffixIconWidget> createState() =>
      _CustomTextFieldWithSuffixIconWidgetState();
}

class _CustomTextFieldWithSuffixIconWidgetState
    extends State<CustomTextFieldWithSuffixIconWidget> {
  final FocusNode _focus = FocusNode();
  bool _textFieldHasFocus = false;

  @override
  void initState() {
    _focus.addListener(() {
      setState(() {
        _textFieldHasFocus = _focus.hasFocus;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextField(
        onTap: widget.onTap,
        readOnly: widget.isReadOnly,
        focusNode: _focus,
        keyboardType: widget.textInputType,
        controller: widget.controller,
        onSubmitted: widget.onSubmitted,
        onChanged: widget.onChange,
        inputFormatters: widget.inputFormatters,
        maxLines: widget.maxLine,
        minLines: null,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white,
            ),
        decoration: InputDecoration(
          hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white54,
              ),
          filled: true,
          errorText: widget.errorMessage,
          hintMaxLines: 1,
          enabled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          fillColor: widget.isDarkMode
              ? ColorSchemes.secondary.withOpacity(0.5)
              : ColorSchemes.primary,
          hintText: widget.labelTitle,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          errorMaxLines: 2,
          prefix: widget.suffixIcon,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focus.dispose();
    super.dispose();
  }
}
