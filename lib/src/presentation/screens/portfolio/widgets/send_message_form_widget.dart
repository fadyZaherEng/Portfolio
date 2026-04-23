import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SendMessageFormWidget extends StatefulWidget {
  const SendMessageFormWidget({super.key});

  @override
  State<SendMessageFormWidget> createState() => _SendMessageFormWidgetState();
}

class _SendMessageFormWidgetState extends State<SendMessageFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isSent = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _sendMessage() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      //get it from your account here https://dashboard.emailjs.com/admin/account
      const serviceId = 'service_f0bk47r'; // Replace with your Service ID
      const templateId = 'template_iajk0vk'; // Replace with your Template ID
      const userId = 'yBSi0JJJFfnA1cFTD'; // Replace with your Public Key

      final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
      
      try {
        final response = await http.post(
          url,
          headers: {
            'Content-Type': 'application/json',
            'Origin': 'http://localhost',
          },
          body: json.encode({
            'service_id': serviceId,
            'template_id': templateId,
            'user_id': userId,
            'template_params': {
              'from_name': _nameController.text,
              'from_email': _emailController.text,
              'message': _messageController.text,
            }
          }),
        );

        if (response.statusCode == 200) {
          setState(() {
            _isSent = true;
            _isLoading = false;
          });
          
          // Clear fields after success
          Future.delayed(const Duration(seconds: 3), () {
            if (mounted) {
              setState(() {
                _isSent = false;
                _nameController.clear();
                _emailController.clear();
                _messageController.clear();
              });
            }
          });
        } else {
          throw Exception('Failed to send message');
        }
      } catch (e) {
        setState(() {
          _isLoading = false;
        });
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(S.of(context).failedToSendMessage)),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.sizeOf(context).width < 850;
    
    return Container(
      width: isMobile ? double.infinity : 600,
      padding: const EdgeInsets.all(24),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).getInTouch,
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ).animate().fadeIn(duration: 400.ms).slideX(begin: -0.2, end: 0),
            const SizedBox(height: 30),
            _buildTextField(
              controller: _nameController,
              hint: S.of(context).name,
              icon: Icons.person_outline,
              validator: (value) => value!.isEmpty ? S.of(context).nameIsRequired : null,
            ).animate().fadeIn(delay: 100.ms, duration: 400.ms).slideY(begin: 0.1, end: 0),
            const SizedBox(height: 20),
            _buildTextField(
              controller: _emailController,
              hint: S.of(context).email,
              icon: Icons.email_outlined,
              validator: (value) {
                if (value!.isEmpty) return S.of(context).emailIsRequired;
                if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) return S.of(context).invalidEmail;
                return null;
              },
            ).animate().fadeIn(delay: 200.ms, duration: 400.ms).slideY(begin: 0.1, end: 0),
            const SizedBox(height: 20),
            _buildTextField(
              controller: _messageController,
              hint: S.of(context).message,
              icon: Icons.chat_bubble_outline,
              maxLines: 5,
              validator: (value) => value!.isEmpty ? S.of(context).messageIsRequired : null,
            ).animate().fadeIn(delay: 300.ms, duration: 400.ms).slideY(begin: 0.1, end: 0),
            const SizedBox(height: 20),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, 0.2),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  ),
                );
              },
              child: _isSent
                  ? Container(
                      key: const ValueKey('success_msg'),
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.green.shade200),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.check_circle, color: Colors.green.shade600),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              S.of(context).messageSentSuccessfully,
                              style: TextStyle(
                                color: Colors.green.shade800,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(key: ValueKey('empty')),
            ),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _sendMessage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorSchemes.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                ),
                child: _isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.send, size: 20),
                          const SizedBox(width: 10),
                          Text(
                            S.of(context).sendMessage,
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
              ),
            ).animate().fadeIn(delay: 400.ms, duration: 400.ms).scale(begin: const Offset(0.8, 0.8), end: const Offset(1, 1)),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: ColorSchemes.primary.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        validator: validator,
        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey.shade500, fontWeight: FontWeight.w400),
          prefixIcon: maxLines > 1
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Icon(icon, color: ColorSchemes.primary.withOpacity(0.7)),
                    ),
                  ],
                )
              : Icon(icon, color: ColorSchemes.primary.withOpacity(0.7)),
          prefixIconConstraints: BoxConstraints(
            minWidth: 50,
            minHeight: maxLines > 1 ? 100 : 0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: ColorSchemes.primary.withOpacity(0.5), width: 1.5),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }
}
