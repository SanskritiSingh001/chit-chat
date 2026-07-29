import 'package:chat_app/routes/app_routes.dart';
import 'package:get/get.dart';

import '../view/auth/splash_view.dart';

class AppPages {
  static const initial = AppRoutes.splash;

  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
    ),

    // GetPage(
    //   name: AppRoutes.login,
    //   page: () => const LoginView(),
    // ),

    // GetPage(
    //   name: AppRoutes.register,
    //   page: () => const RegisterView(),
    // ),

    // GetPage(
    //   name: AppRoutes.forgotPassword,
    //   page: () => const ForgotPasswordView(),
    //   binding: BindingBuilder(() {
    //     Get.put(ForgotPasswordController());
    //   }),
    // ),

    // GetPage(
    //   name: AppRoutes.changePassword,
    //   page: () => const ChangePasswordView(),
    //   binding: BindingBuilder(() {
    //     Get.put(ChangePasswordController());
    //   }),
    // ),

    // GetPage(
    //   name: AppRoutes.home,
    //   page: () => const HomeView(),
    //   binding: BindingBuilder(() {
    //     Get.put(HomeController());
    //   }),
    // ),

    // GetPage(
    //   name: AppRoutes.main,
    //   page: () => const MainView(),
    //   binding: BindingBuilder(() {
    //     Get.put(MainController());
    //   }),
    // ),

    // GetPage(
    //   name: AppRoutes.profile,
    //   page: () => const ProfileView(),
    //   binding: BindingBuilder(() {
    //     Get.put(NotificationController());
    //   }),
    // ),

    // GetPage(
    //   name: AppRoutes.chat,
    //   page: () => const ChatView(),
    //   binding: BindingBuilder(() {
    //     Get.put(ChatController());
    //   }),
    // ),

    // GetPage(
    //   name: AppRoutes.userList,
    //   page: () => const UserListView(),
    //   binding: BindingBuilder(() {
    //     Get.put(UserListController());
    //   }),
    // ),

    // GetPage(
    //   name: AppRoutes.friends,
    //   page: () => const FriendView(),
    //   binding: BindingBuilder(() {
    //     Get.put(FriendController());
    //   }),
    // ),

    // GetPage(
    //   name: AppRoutes.friendRequest,
    //   page: () => const FriendRequest(),
    //   binding: BindingBuilder(() {
    //     Get.put(FriendRequestController());
    //   }),
    // ),

    // GetPage(
    //   name: AppRoutes.notification,
    //   page: () => const NotificationView(),
    //   binding: BindingBuilder(() {
    //     Get.put(NotificationController());
    //   }),
    // ),
  ];
}