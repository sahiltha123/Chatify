import 'package:chat_app/app_theme.dart';
import 'package:chat_app/controllers/change_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChangePasswordController());
    return Scaffold(
      appBar: AppBar(title: Text("Change Password")),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: AppTheme.accentColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.security_rounded,
                      size: 40,
                      color: AppTheme.accentColor,
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  "Update Your Password",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text(
                  "Enter your current password and choose your new secure password",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppTheme.textSecondaryColor,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 40),

                Obx(
                  () => TextFormField(
                    style: TextStyle(color: AppTheme.textPrimaryColor),
                    controller: controller.currentPasswordController,
                    obscureText: controller.obscureCurrentPassword,
                    cursorColor: AppTheme.accentColor,
                    decoration: InputDecoration(
                      filled: true, // 👈 Enables background color
                      fillColor: Colors.white,
                      labelText: 'Current Password',
                      prefixIcon: Icon(
                        Icons.lock_outlined,
                        color: Colors.black,
                      ),
                      suffixIcon: IconButton(
                        onPressed: controller.toggleCurrentPasswordVisibility,
                        icon: Icon(
                          controller.obscureCurrentPassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Colors.black,
                        ),
                      ),
                      hintStyle: TextStyle(color: AppTheme.textPrimaryColor),
                      labelStyle: TextStyle(color: AppTheme.textPrimaryColor),
                      floatingLabelStyle: TextStyle(
                        color: AppTheme.accentColor,
                      ),
                      errorStyle: TextStyle(color: AppTheme.errorColor),
                      hintText: 'Enter your current password',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppTheme.accentColor,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.redAccent,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.redAccent,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: controller.validateCurrentPassword,
                  ),
                ),
                SizedBox(height: 20),
                Obx(
                  () => TextFormField(
                    style: TextStyle(color: AppTheme.textPrimaryColor),
                    controller: controller.newPasswordController,
                    obscureText: controller.obscureNewPassword,
                    cursorColor: AppTheme.accentColor,
                    decoration: InputDecoration(
                      filled: true, // 👈 Enables background color
                      fillColor: Colors.white,
                      labelText: 'New Password',
                      prefixIcon: Icon(
                        Icons.lock_outlined,
                        color: Colors.black,
                      ),
                      suffixIcon: IconButton(
                        onPressed: controller.toggleNewPasswordVisibility,
                        icon: Icon(
                          controller.obscureNewPassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Colors.black,
                        ),
                      ),
                      hintText: 'Enter your new password',
                      hintStyle: TextStyle(color: AppTheme.textPrimaryColor),
                      labelStyle: TextStyle(color: AppTheme.textPrimaryColor),
                      floatingLabelStyle: TextStyle(
                        color: AppTheme.accentColor,
                      ),
                      errorStyle: TextStyle(color: AppTheme.errorColor),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppTheme.accentColor,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.redAccent,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.redAccent,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: controller.validateNewPassword,
                  ),
                ),
                SizedBox(height: 20),
                Obx(
                  () => TextFormField(
                    style: TextStyle(color: AppTheme.textPrimaryColor),
                    controller: controller.confirmPasswordController,
                    obscureText: controller.obscureConfirmPassword,
                    cursorColor: AppTheme.accentColor,
                    decoration: InputDecoration(
                      filled: true, // 👈 Enables background color
                      fillColor: Colors.white,
                      labelText: 'Confirm New Password',
                      prefixIcon: Icon(
                        Icons.lock_outlined,
                        color: Colors.black,
                      ),
                      labelStyle: TextStyle(color: AppTheme.textPrimaryColor),
                      floatingLabelStyle: TextStyle(
                        color: AppTheme.accentColor,
                      ),
                      errorStyle: TextStyle(color: AppTheme.errorColor),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppTheme.accentColor,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.redAccent,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.redAccent,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      suffixIcon: IconButton(
                        onPressed: controller.toggleConfirmPasswordVisibility,
                        icon: Icon(
                          controller.obscureConfirmPassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Colors.black,
                        ),
                      ),
                      hintText: 'Confirm your new password',
                    ),
                    validator: controller.validateConfirmPassword,
                  ),
                ),
                SizedBox(height: 40),
                Obx(
                  () => SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: controller.isLoading
                          ? null
                          : controller.changePassword,
                      icon: controller.isLoading
                          ? SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : Icon(Icons.security),
                      label: Text(
                        controller.isLoading
                            ? 'Updating...'
                            : 'Update Password',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
