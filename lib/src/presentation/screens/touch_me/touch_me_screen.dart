// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mailto/mailto.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/src/config/routes/routes_manager.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/utils/constants.dart';
import 'package:my_portfolio/src/core/utils/show_snack_bar.dart';
import 'package:my_portfolio/src/di/data_layer_injector.dart';
import 'package:my_portfolio/src/domain/usecase/get_theme_use_case.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/custom_app_bar_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/custom_resume_widget.dart';
import 'package:my_portfolio/src/presentation/widgets/restart_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class TouchMeScreen extends StatefulWidget {
  const TouchMeScreen({super.key});

  @override
  _TouchMeScreenState createState() => _TouchMeScreenState();
}

class _TouchMeScreenState extends State<TouchMeScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  String? _nameError;
  String? _emailError;
  String? _messageError;

  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    isDarkMode = GetThemeUseCase(injector())() == Constants.dark;
  }

  Future<void> sendEmail() async {
    if (_formKey.currentState!.validate()) {
      final String name = _nameController.text;
      final String email = _emailController.text;
      final String message = _messageController.text;

      final mailtoLink = Mailto(
        to: ['fedo.zaher@gmail.com'],
        subject: 'New Contact Form Submission',
        body: 'Name: $name\nEmail: $email\nMessage: $message',
      );

      final Uri emailUri = Uri.parse(mailtoLink.toString());

      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri);
      } else {
        showSnackBar(
          context: context,
          message: S.of(context).couldNotOpenEmail,
          color: ColorSchemes.snackBarWarning,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.go(Routes.portfolio);
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor:
            isDarkMode ? ColorSchemes.iconBackGround : Colors.white,
        appBar: CustomAppBarWidget(
          isBack: true,
          onBackTap: () {
            context.go(Routes.portfolio);
            Navigator.pop(context);
          },
          onLogoTap: () {
            RestartWidget.restartApp(context);
            context.go(Routes.portfolio);
          },
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildTextField(
                          _nameController,
                          S.of(context).yourName,
                          Icons.person,
                          _nameError,
                          (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.trim().length < 3) {
                              setState(() {
                                _nameError = S.of(context).nameIsRequired;
                              });
                              return S.of(context).nameIsRequired;
                            }
                            setState(() {
                              _nameError = null;
                            });
                            return null;
                          },
                          maxLines: 2,
                        ),
                        const SizedBox(height: 16),
                        _buildTextField(
                          _emailController,
                          S.of(context).yourEmail,
                          Icons.email,
                          _emailError,
                          (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$")
                                    .hasMatch(value)) {
                              setState(() {
                                _emailError = S.of(context).emailIsRequired;
                              });
                              return S.of(context).emailIsRequired;
                            }
                            setState(() {
                              _emailError = null;
                            });
                            return null;
                          },
                          maxLines: 2,
                        ),
                        const SizedBox(height: 16),
                        _buildTextField(
                          _messageController,
                          S.of(context).yourMessage,
                          Icons.message,
                          _messageError,
                          (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.trim().length < 5) {
                              setState(() {
                                _messageError = S.of(context).messageIsRequired;
                              });
                              return S.of(context).messageIsRequired;
                            }
                            setState(() {
                              _messageError = null;
                            });
                            return null;
                          },
                          maxLines: 10,
                        ),
                        const SizedBox(height: 42),
                        CustomResumeWidget(
                          onViewResumeTap: sendEmail,
                          isDarkMode: isDarkMode,
                          borderColor: ColorSchemes.white,
                          textColor: isDarkMode
                              ? ColorSchemes.white
                              : ColorSchemes.iconBackGround,
                          title: S.of(context).sendMessage,
                          width: MediaQuery.of(context).size.width * 0.6,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String hintText,
    IconData icon,
    String? errorText,
    String? Function(String?) validator, {
    int maxLines = 1,
  }) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        minLines: null,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white,
            ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white54,
              ),
          prefix: Icon(icon, color: Colors.white),
          filled: true,
          errorText: errorText,
          hintMaxLines: 1,
          enabled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          fillColor: ColorSchemes.primary,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: (value) => setState(() {
          controller.text = value;
          validator(value);
        }),
        validator: (value) {
          setState(() {});
          if (value == null) return null;
          controller.text = value;
          return validator(value);
        },
      ),
    );
  }
}
