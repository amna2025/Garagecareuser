import 'package:flutter/cupertino.dart';
import 'package:garagecare/presentation/Home/discount&subscription/discount&subscriptionScreen.dart';
import 'package:garagecare/presentation/Home/services/tracking/trackingScreen.dart';
import 'package:garagecare/presentation/Home/urgent/EmergencyService.dart';
import 'package:garagecare/presentation/auth/signin/signInScreen.dart';
import 'package:garagecare/presentation/auth/signup/signUpScreen.dart';
import 'package:garagecare/presentation/choose/ChooseScreen.dart';
import 'package:garagecare/presentation/entrypoint/entrypoint_screen.dart';
import 'package:garagecare/presentation/splash/splashScreen.dart';


import 'app_routes.dart';


class RouteGenerator {
  static Route? onGenerate(RouteSettings settings) {
    final route = settings.name;

    switch (route) {

      case AppRoutes.splash:
        return CupertinoPageRoute(builder: (_) => const SplashScreen());

      case AppRoutes.choose:
        return CupertinoPageRoute(builder: (_) => const ChooseScreen());

      case AppRoutes.signin:
         return CupertinoPageRoute(builder: (_) => const SignInScreen());
      case AppRoutes.signup:
         return CupertinoPageRoute(builder: (_) => const SignUpScreen());
      case AppRoutes.entryPoint:
        return CupertinoPageRoute(builder: (_) => const EntryPoint());

      case AppRoutes.discount:
        return CupertinoPageRoute(builder: (_) => const DiscountSubscriptionPage());

      case AppRoutes.emergencyServiceScreen:
        return CupertinoPageRoute(builder: (_) => EmergencyServiceScreen(onNavigateBack: () { },));
      case AppRoutes.trackingPage:
        return CupertinoPageRoute(builder: (_) => TrackingPage());

      // case AppRoutes.savePage:
      //   return CupertinoPageRoute(builder: (_) => const SavePage());
      //
      // case AppRoutes.checkoutPage:
      //   return CupertinoPageRoute(builder: (_) => const CheckoutPage());
      //
      // case AppRoutes.categoryDetails:
      //   return CupertinoPageRoute(builder: (_) => const CategoryProductPage());
      //
      //
      //
      // case AppRoutes.signup:
      //   return CupertinoPageRoute(builder: (_) => const SignUpPage());
      //
      // case AppRoutes.loginOrSignup:
      //   return CupertinoPageRoute(builder: (_) => const LoginOrSignUpPage());
      //
      // case AppRoutes.numberVerification:
      //   return CupertinoPageRoute(
      //       builder: (_) => const NumberVerificationPage());
      //
      // case AppRoutes.forgotPassword:
      //   return CupertinoPageRoute(builder: (_) => const ForgetPasswordPage());
      //
      // case AppRoutes.passwordReset:
      //   return CupertinoPageRoute(builder: (_) => const PasswordResetPage());
      //
      // case AppRoutes.newItems:
      //   return CupertinoPageRoute(builder: (_) => const NewItemsPage());
      //
      // case AppRoutes.popularItems:
      //   return CupertinoPageRoute(builder: (_) => const PopularPackPage());
      //
      // case AppRoutes.bundleProduct:
      //   return CupertinoPageRoute(
      //       builder: (_) => const BundleProductDetailsPage());
      //
      // case AppRoutes.bundleDetailsPage:
      //   return CupertinoPageRoute(builder: (_) => const BundleDetailsPage());
      //
      // case AppRoutes.productDetails:
      //   return CupertinoPageRoute(builder: (_) => const ProductDetailsPage());
      //
      // case AppRoutes.createMyPack:
      //   return CupertinoPageRoute(builder: (_) => const BundleCreatePage());
      //
      // case AppRoutes.orderSuccessfull:
      //   return CupertinoPageRoute(builder: (_) => const OrderSuccessfullPage());
      //
      // case AppRoutes.orderFailed:
      //   return CupertinoPageRoute(builder: (_) => const OrderFailedPage());
      //
      // case AppRoutes.myOrder:
      //   return CupertinoPageRoute(builder: (_) => const AllOrderPage());
      //
      // case AppRoutes.orderDetails:
      //   return CupertinoPageRoute(builder: (_) => const OrderDetailsPage());
      //
      // case AppRoutes.coupon:
      //   return CupertinoPageRoute(builder: (_) => const CouponAndOffersPage());
      //
      // case AppRoutes.couponDetails:
      //   return CupertinoPageRoute(builder: (_) => const CouponDetailsPage());
      //
      // case AppRoutes.profileEdit:
      //   return CupertinoPageRoute(builder: (_) => const ProfileEditPage());
      //
      // case AppRoutes.newAddress:
      //   return CupertinoPageRoute(builder: (_) => const NewAddressPage());
      //
      // case AppRoutes.deliveryAddress:
      //   return CupertinoPageRoute(builder: (_) => const AddressPage());
      //
      // case AppRoutes.notifications:
      //   return CupertinoPageRoute(builder: (_) => const NotificationPage());
      //
      // case AppRoutes.settingsNotifications:
      //   return CupertinoPageRoute(
      //       builder: (_) => const NotificationSettingsPage());
      //
      // case AppRoutes.settings:
      //   return CupertinoPageRoute(builder: (_) => const SettingsPage());
      //
      // case AppRoutes.settingsLanguage:
      //   return CupertinoPageRoute(builder: (_) => const LanguageSettingsPage());
      //
      // case AppRoutes.changePassword:
      //   return CupertinoPageRoute(builder: (_) => const ChangePasswordPage());
      //
      // case AppRoutes.changePhoneNumber:
      //   return CupertinoPageRoute(
      //       builder: (_) => const ChangePhoneNumberPage());
      //
      // case AppRoutes.review:
      //   return CupertinoPageRoute(builder: (_) => const ReviewPage());
      //
      // case AppRoutes.submitReview:
      //   return CupertinoPageRoute(builder: (_) => const SubmitReviewPage());
      //
      // case AppRoutes.drawerPage:
      //   return CupertinoPageRoute(builder: (_) => const DrawerPage());
      //
      // case AppRoutes.aboutUs:
      //   return CupertinoPageRoute(builder: (_) => const AboutUsPage());
      //
      // case AppRoutes.termsAndConditions:
      //   return CupertinoPageRoute(
      //       builder: (_) => const TermsAndConditionsPage());
      //
      // case AppRoutes.faq:
      //   return CupertinoPageRoute(builder: (_) => const FAQPage());
      //
      // case AppRoutes.help:
      //   return CupertinoPageRoute(builder: (_) => const HelpPage());
      //
      // case AppRoutes.contactUs:
      //   return CupertinoPageRoute(builder: (_) => const ContactUsPage());
      //
      // case AppRoutes.paymentMethod:
      //   return CupertinoPageRoute(builder: (_) => const PaymentMethodPage());
      //
      // case AppRoutes.paymentCardAdd:
      //   return CupertinoPageRoute(builder: (_) => const AddNewCardPage());

      default:
        return errorRoute();
    }
  }

  static Route? errorRoute() =>
      CupertinoPageRoute(builder: (_) => const SplashScreen());
}
