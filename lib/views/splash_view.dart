import 'package:chat_app/app_theme.dart';
import 'package:chat_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
// import 'package:get/get_core/src/get_main.dart';
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SingleTickerProviderStateMixin{

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(vsync: this,
      duration: Duration(seconds: 2),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );

    _animationController.forward();

    _checkAuthAndNavigate();
    // will implement check if logged in auth controller
  }
    void _checkAuthAndNavigate() async {
      await Future.delayed(Duration(seconds: 2));

      final authController = Get.put(AuthController(), permanent: true);

      await Future.delayed(Duration(milliseconds: 500));

      if (authController.isAuthenticated) {
        Get.offAllNamed(AppRoutes.main);
        // Get.offAllNamed(AppRoutes.profile);
      } else {
        Get.offAllNamed(AppRoutes.login);
      }
    }

    @override
  void dispose() {
    // TODO: implement dispose
      _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      body: Center(
        child: AnimatedBuilder(animation: _animationController,
            builder: (context, child){
          return FadeTransition(opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: AppTheme.accentColor,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 20,
                        offset: Offset(1,10)
                      )
                    ]
                  ),
                  child: Icon(
                    Icons.chat_bubble_rounded,
                    size: 60,
                    color: Colors.white,
                  )
                ),
                SizedBox(height: 32,),
                Text("Chat App",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,

                  ),
                ),
                SizedBox(height: 32,),
                Text("Connect with Friends Instantly",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.black.withOpacity(0.8),
                  ),
                ),
                SizedBox(height: 64,),
                CircularProgressIndicator(
                  color: AppTheme.accentColor,
                  strokeWidth: 2,
                ),
              ],
            ),
          ),
          );
            }),
      ),
    );
  }
}
