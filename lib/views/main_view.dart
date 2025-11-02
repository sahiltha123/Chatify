import 'package:chat_app/app_theme.dart';
import 'package:chat_app/views/find_people_view.dart';
import 'package:chat_app/views/friends_view.dart';
import 'package:chat_app/views/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/views/profile/profile_view.dart';
import 'package:chat_app/controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        onPageChanged: controller.onPageChanged,
        children: [HomeView(), FriendsView(), FindPeopleView(), ProfileView()],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 16), // space from bottom
        child: Obx(
          () => BottomNavigationBar(
            currentIndex: controller.currentIndex,
            onTap: controller.changeTabIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppTheme.accentColor,
            unselectedItemColor: AppTheme.textPrimaryColor,
            backgroundColor: AppTheme.primaryColor,
            elevation: 20,
            items: [
              BottomNavigationBarItem(
                icon: _buildIconWithBadge(
                  Icons.chat_outlined,
                  controller.getUnreadCount(),
                ),
                activeIcon: _buildIconWithBadge(
                  Icons.chat,
                  controller.getUnreadCount(),
                ),
                // you can name it chat or home
                label: 'Chats',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people_outline),
                activeIcon: Icon(Icons.people),
                label: 'Friends',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_search_outlined),
                activeIcon: Icon(Icons.person_search),
                label: 'Find Friends',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                activeIcon: Icon(Icons.account_circle),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconWithBadge(IconData icon, int count) {
    return Stack(
      children: [
        Icon(icon),
        if (count > 0)
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: AppTheme.errorColor,
                borderRadius: BorderRadius.circular(6),
              ),
              constraints: BoxConstraints(minWidth: 12, minHeight: 12),
              child: Text(
                count > 99 ? '99+' : count.toString(),
                style: TextStyle(color: Colors.white, fontSize: 8),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
