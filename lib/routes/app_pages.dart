import 'package:chat_app/controllers/friends_controller.dart';
import 'package:chat_app/controllers/main_controller.dart';
import 'package:chat_app/controllers/notification_controller.dart';
import 'package:chat_app/controllers/users_list_controller.dart';
import 'package:chat_app/routes/app_routes.dart';
import 'package:chat_app/views/auth/forgot_password_view.dart';
import 'package:chat_app/views/auth/login_view.dart';
import 'package:chat_app/views/auth/register_view.dart';
import 'package:chat_app/views/find_people_view.dart';
import 'package:chat_app/views/friend_requests_view.dart';
import 'package:chat_app/views/friends_view.dart';
import 'package:chat_app/views/notification_view.dart';
import 'package:chat_app/views/profile/change_password_view.dart';
import 'package:get/get.dart';
import '../controllers/chat_controller.dart';
import '../controllers/friend_requests_controller.dart';
import '../controllers/home_controller.dart';
import '../controllers/profile_controller.dart';
import '../views/ai_chatbot_view.dart';
import '../views/chat_view.dart';
import '../views/home_view.dart';
import '../views/main_view.dart';
import '../views/profile/profile_view.dart';
import '../views/splash_view.dart';

class AppPages {
  static const initial = AppRoutes.splash;

  static final routes = [
    GetPage(name: AppRoutes.splash, page: () => const SplashView()),
    GetPage(name: AppRoutes.login, page: () => const LoginView()),
    GetPage(name: AppRoutes.register, page: () => const RegisterView()),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordView(),
    ),
    GetPage(
      name: AppRoutes.changePassword,
      page: () => const ChangePasswordView(),
    ),
    GetPage(
      name: AppRoutes.main,
      page: () => MainView(),
      binding: BindingsBuilder(() {
        Get.put(MainController());
      }),
    ),
    GetPage(
      name: AppRoutes.aiChatbot,
      page: () => AIChatView(),
      // binding: BindingsBuilder(() {
      //   Get.put(AIChatbotController());
      // }),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeView(),
      binding: BindingsBuilder(() {
        Get.put(HomeController());
      }),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfileView(),
      binding: BindingsBuilder(() {
        Get.put(ProfileController());
      }),
    ),
    GetPage(
      name: AppRoutes.chat,
      page: () => ChatView(),
      binding: BindingsBuilder(() {
        Get.put(ChatController());
      }),
    ),
    GetPage(
      name: AppRoutes.usersList,
      page: () => FindPeopleView(),
      binding: BindingsBuilder(() {
        Get.put(UsersListController());
      }),
    ),
    GetPage(
      name: AppRoutes.friends,
      page: () => FriendsView(),
      binding: BindingsBuilder(() {
        Get.put(FriendsController());
      }),
    ),
    GetPage(
      name: AppRoutes.friendRequests,
      page: () => FriendRequestsview(),
      binding: BindingsBuilder(() {
        Get.put(FriendRequestsController());
      }),
    ),
    GetPage(
      name: AppRoutes.notifications,
      page: () => NotificationView(),
      binding: BindingsBuilder(() {
        Get.put(NotificationController());
      }),
    ),
  ];
}
