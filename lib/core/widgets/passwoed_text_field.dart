import 'package:event_hub_app/core/utils/assets/app_icons.dart';
import 'package:event_hub_app/core/widgets/custom_svg_picture.dart';
import 'package:flutter/material.dart';
import 'app_text_form_field.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    this.hintText = 'Your password',
    this.controller,
    this.validator,
    this.textInputAction = TextInputAction.done,
  });

  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: widget.controller,
      hintText: widget.hintText,
      obscureText: _isObscure,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: widget.textInputAction,
      prefixIcon: const FittedBox(
        fit: BoxFit.scaleDown,
        child: CustomSvgPicture(
          path: AppIcons.assetsIconsPass,
          width: 24,
          height: 24,
        ),
      ),
      validator: widget.validator,
      suffixIcon: _isObscure
          ? GestureDetector(
              onTap: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              },
              child: const FittedBox(
                fit: BoxFit.scaleDown,
                child: CustomSvgPicture(
                  path: AppIcons.assetsIconsHidden,
                  width: 24,
                  height: 24,
                ),
              ),
            )
          : IconButton(
              icon: const Icon(
                Icons.visibility_outlined,
              ),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              },
            ),
    );
  }
}
