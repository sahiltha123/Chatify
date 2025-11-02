import 'package:chat_app/app_theme.dart';
import 'package:chat_app/controllers/auth_controller.dart';
import 'package:chat_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  final _displayNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final AuthController _authController = Get.find<AuthController>();
  bool _obsecurePassword = true;
  bool _obesecureConfirmPassword = true;

  Color? get textPrimaryColor => null;

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    _displayNameController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),

                // Center(
                //   child: Container(
                //     width: 80,
                //     height: 80,
                //     decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(20),
                //     ),
                //     child: Icon(
                //       Icons.chat_bubble_rounded,
                //       size: 40,
                //       color: Colors.black,
                //     ),
                //   ),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                    ),
                    SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        "Create Account",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textPrimaryColor,
                        ),
                        // Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  "Fill in your details to get started",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppTheme.textSecondaryColor,
                  ),
                ),
                SizedBox(height: 40),
                TextFormField(
                  style: TextStyle(color: AppTheme.textPrimaryColor),
                  controller: _displayNameController,
                  keyboardType: TextInputType.name,
                  cursorColor: AppTheme.accentColor,
                  decoration: InputDecoration(
                    filled: true, // 👈 Enables background color
                    fillColor: Colors.white,
                    labelText: 'Name',
                    prefixIcon: Icon(Icons.person_outline, color: Colors.black),
                    hintText: 'Display Name',
                    hintStyle: TextStyle(color: AppTheme.textPrimaryColor),
                    labelStyle: TextStyle(color: AppTheme.textPrimaryColor),
                    floatingLabelStyle: TextStyle(color: AppTheme.accentColor),
                    errorStyle: TextStyle(color: AppTheme.errorColor),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.redAccent,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppTheme.accentColor,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),

                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your Name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  style: TextStyle(color: AppTheme.textPrimaryColor),
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: AppTheme.accentColor,
                  decoration: InputDecoration(
                    filled: true, // 👈 Enables background color
                    fillColor: Colors.white,
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email_outlined, color: Colors.black),
                    hintText: 'Enter your Email',
                    hintStyle: TextStyle(color: AppTheme.textPrimaryColor),
                    labelStyle: TextStyle(color: AppTheme.textPrimaryColor),
                    floatingLabelStyle: TextStyle(color: AppTheme.accentColor),
                    errorStyle: TextStyle(color: AppTheme.errorColor),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.redAccent,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppTheme.accentColor,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'please enter your email';
                    }
                    if (!GetUtils.isEmail(value!)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  style: TextStyle(color: AppTheme.textPrimaryColor),
                  controller: _passwordController,
                  obscureText: _obsecurePassword,
                  cursorColor: AppTheme.accentColor,
                  decoration: InputDecoration(
                    filled: true, // 👈 Enables background color
                    fillColor: Colors.white,
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock_outline, color: Colors.black),
                    hintText: 'Enter your Password',
                    hintStyle: TextStyle(color: AppTheme.textPrimaryColor),
                    labelStyle: TextStyle(color: AppTheme.textPrimaryColor),
                    floatingLabelStyle: TextStyle(color: AppTheme.accentColor),
                    errorStyle: TextStyle(color: AppTheme.errorColor),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obsecurePassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          _obsecurePassword = !_obsecurePassword;
                        });
                      },
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.redAccent,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppTheme.accentColor,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your password';
                    }
                    if (value!.length < 8) {
                      return 'Password must Contain 8 Characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  style: TextStyle(color: AppTheme.textPrimaryColor),
                  controller: _confirmPasswordController,
                  obscureText: _obesecureConfirmPassword,
                  cursorColor: AppTheme.accentColor,
                  decoration: InputDecoration(
                    filled: true, // 👈 Enables background color
                    fillColor: Colors.white,
                    labelText: 'Confirm password',
                    prefixIcon: Icon(Icons.lock_outline, color: Colors.black),
                    hintText: 'Confirm your Password',
                    hintStyle: TextStyle(color: AppTheme.textPrimaryColor),
                    labelStyle: TextStyle(color: AppTheme.textPrimaryColor),
                    floatingLabelStyle: TextStyle(color: AppTheme.accentColor),
                    errorStyle: TextStyle(color: AppTheme.errorColor),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obesecureConfirmPassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          _obesecureConfirmPassword =
                              !_obesecureConfirmPassword;
                        });
                      },
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.redAccent,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppTheme.accentColor,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Please confirm your password";
                    }
                    if (value != _passwordController.text) {
                      return "Password does not match";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24),
                Obx(
                  () => SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.accentColor,
                      ),
                      onPressed: _authController.isLoading
                          ? null
                          : () {
                              if (_formKey.currentState?.validate() ?? false) {
                                _authController.registerWithEmailAndPassword(
                                  _emailController.text.trim(),
                                  _passwordController.text,
                                  _displayNameController.text,
                                );
                              }
                            },
                      child: _authController.isLoading
                          ? SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : Text(
                              "Sign In",
                              style: TextStyle(color: Colors.white),
                            ),
                    ),
                  ),
                ),
                SizedBox(height: 32),
                // Row(
                //   children: [
                //     Expanded(child: Divider(color: AppTheme.textSecondaryColor)),
                //     Padding(
                //       padding: EdgeInsets.symmetric(horizontal: 16),
                //       child: Text(
                //         "OR",
                //         style: Theme.of(context).textTheme.bodySmall,
                //       ),
                //     ),
                //     Expanded(child: Divider(color: AppTheme.textSecondaryColor)),
                //   ],
                // ),
                // SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(width: 12),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.login);
                      },
                      child: Text(
                        "Login",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.accentColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
