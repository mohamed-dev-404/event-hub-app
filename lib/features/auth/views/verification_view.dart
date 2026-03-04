import 'package:event_hub_app/core/functions/navigations.dart';
import 'package:event_hub_app/core/utils/assets/app_images.dart';
import 'package:event_hub_app/core/utils/colors/app_colors.dart';
import 'package:event_hub_app/core/utils/styles/text_styles.dart';
import 'package:event_hub_app/core/widgets/main_button.dart';
import 'package:event_hub_app/features/auth/views/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerificationView extends StatefulWidget {
  const VerificationView({super.key});

  @override
  State<VerificationView> createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView> {
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());

  final List<TextEditingController> _controllers = List.generate(
    4,
    (index) => TextEditingController(),
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppImages.assetsImagesSplashBg,
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.title,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Verification',
                      style: AppStyles.h4,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'We’ve send you the verification\ncode on +1 2620 0323 7631',
                    style: AppStyles.body3.copyWith(
                      color: AppColors.title,
                    ),
                  ),

                  const SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      4,
                      (index) => _otpField(index),
                    ),
                  ),

                  const SizedBox(height: 40),

                  MainButton(
                    text: 'CONTINUE',
                    onPressed: () {
                      context.pushReplacement(const SignInView());
                    },
                  ),
                  const SizedBox(height: 28),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Re-send code in ',
                        style: AppStyles.body3.copyWith(
                          color: AppColors.title,
                        ),
                      ),
                      Text(
                        '0:20',
                        style: AppStyles.body3.copyWith(
                          color: AppColors.primaryBlue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _otpField(int index) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Focus(
        onKeyEvent: (node, event) {
          if (event.logicalKey == LogicalKeyboardKey.backspace &&
              event is KeyDownEvent) {
            if (_controllers[index].text.isEmpty && index > 0) {
              _controllers[index - 1].clear();
              FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
              return KeyEventResult.handled;
            }
          }
          return KeyEventResult.ignored;
        },
        child: TextField(
          controller: _controllers[index],
          focusNode: _focusNodes[index],
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          maxLength: 1,
          style: AppStyles.h4,
          decoration: InputDecoration(
            counterText: '',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(
                color: AppColors.title,
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(
                color: AppColors.primaryBlue,
                width: 1.5,
              ),
            ),
          ),
          onChanged: (value) {
            if (value.length == 1 && index < 3) {
              FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
            }
          },
        ),
      ),
    );
  }
}
