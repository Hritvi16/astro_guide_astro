import 'package:astro_guide_astro/controllers/contactUs/ContactUsBinding.dart';
import 'package:astro_guide_astro/controllers/customPDFViewer/CustomPDFViewerBinding.dart';
import 'package:astro_guide_astro/controllers/information/InformationBinding.dart';
import 'package:astro_guide_astro/controllers/myBank/ManageBankDetailsBinding.dart';
import 'package:astro_guide_astro/controllers/myBank/MyBankDetailsBinding.dart';
import 'package:astro_guide_astro/controllers/myBank/MyBankHistoryBinding.dart';
import 'package:astro_guide_astro/controllers/myGallery/MyGalleryBinding.dart';
import 'package:astro_guide_astro/controllers/myLanguage/MyLanguageBinding.dart';
import 'package:astro_guide_astro/controllers/call/CallBinding.dart';
import 'package:astro_guide_astro/controllers/call/JoinScreenBinding.dart';
import 'package:astro_guide_astro/controllers/call/OneToOneMeetBinding.dart';
import 'package:astro_guide_astro/controllers/chat/ChatBinding.dart';
import 'package:astro_guide_astro/controllers/following/FollowingBinding.dart';
import 'package:astro_guide_astro/controllers/home/HomeBinding.dart';
import 'package:astro_guide_astro/controllers/language/LanguageBinding.dart';
import 'package:astro_guide_astro/controllers/login/LoginBinding.dart';
import 'package:astro_guide_astro/controllers/myProfile/MyProfileBinding.dart';
import 'package:astro_guide_astro/controllers/myQuickReplies/MyQuickRepliesBinding.dart';
import 'package:astro_guide_astro/controllers/mySkill/MySkillBinding.dart';
import 'package:astro_guide_astro/controllers/mySpec/MySpecBinding.dart';
import 'package:astro_guide_astro/controllers/otp/OTPBinding.dart';
import 'package:astro_guide_astro/controllers/review/ReviewBinding.dart';
import 'package:astro_guide_astro/controllers/signUp/SignUpBinding.dart';
import 'package:astro_guide_astro/controllers/splash/SplashBinding.dart';
import 'package:astro_guide_astro/controllers/support/SupportChatBinding.dart';
import 'package:astro_guide_astro/controllers/userDetail/UserDetailBinding.dart';
import 'package:astro_guide_astro/controllers/wallet/WalletBinding.dart';
import 'package:astro_guide_astro/controllers/wishlist/WishlistBinding.dart';
import 'package:astro_guide_astro/customPDFViewer/CustomPDFViewer.dart';
import 'package:astro_guide_astro/photoView/PhotoView.dart';
import 'package:astro_guide_astro/shared/middleware/InternetMiddleware.dart';
import 'package:astro_guide_astro/shared/widgets/NoInternetPage.dart';
import 'package:astro_guide_astro/views/authentication/Login.dart';
import 'package:astro_guide_astro/views/Splash.dart';
import 'package:astro_guide_astro/views/authentication/OTP.dart';
import 'package:astro_guide_astro/views/authentication/SignUp.dart';
import 'package:astro_guide_astro/views/home/Home.dart';
import 'package:astro_guide_astro/views/home/call/Call.dart';
import 'package:astro_guide_astro/views/home/call/JoinScreen.dart';
import 'package:astro_guide_astro/views/home/call/OneToOneMeet.dart';
import 'package:astro_guide_astro/views/home/chat/Chat.dart';
import 'package:astro_guide_astro/views/home/following/Following.dart';
import 'package:astro_guide_astro/views/home/review/Review.dart';
import 'package:astro_guide_astro/views/home/settings/ContactUs.dart';
import 'package:astro_guide_astro/views/home/settings/Information.dart';
import 'package:astro_guide_astro/views/home/settings/ManageBankDetails.dart';
import 'package:astro_guide_astro/views/home/settings/MyBankDetails.dart';
import 'package:astro_guide_astro/views/home/settings/MyBankHistory.dart';
import 'package:astro_guide_astro/views/home/settings/MyGallery.dart';
import 'package:astro_guide_astro/views/home/settings/MyLanguage.dart';
import 'package:astro_guide_astro/views/home/settings/MyProfile.dart';
import 'package:astro_guide_astro/views/home/settings/MyQuickReplies.dart';
import 'package:astro_guide_astro/views/home/settings/MySkill.dart';
import 'package:astro_guide_astro/views/home/settings/MySpec.dart';
import 'package:astro_guide_astro/views/home/support/SupportChat.dart';
import 'package:astro_guide_astro/views/home/wallet/Wallet.dart';
import 'package:astro_guide_astro/views/home/wishlist/Wishlist.dart';
import 'package:astro_guide_astro/views/language/Language.dart';
import 'package:astro_guide_astro/views/userDetail/UserDetail.dart';
import 'package:get/get.dart';

class Routes {
  static const INITIAL = '/splash';

  static final routes = [
    GetPage(
      name: '/noInternet',
      page: () => NoInternetPage(),
    ),
    GetPage(
      name: '/splash',
      page: () => Splash(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: '/login',
      page: () => Login(),
      binding: LoginBinding()
    ),
    GetPage(
      name: '/otp',
      page: () => OTP(),
      binding: OTPBinding()
    ),
    GetPage(
      name: '/signUp',
      page: () => SignUp(),
      binding: SignUpBinding()
    ),
    GetPage(
        name: '/home',
        page: () => Home(),
        binding: HomeBinding(),
        middlewares: [InternetMiddleware()]
    ),
    GetPage(
        name: '/language',
        page: () => Language(),
        binding: LanguageBinding(),
        middlewares: [InternetMiddleware()]
    ),
    GetPage(
      name: '/call',
      page: () => Call(),
      binding: CallBinding(),
    ),
    GetPage(
      name: '/oneToOneMeet',
      page: () => OneToOneMeet(),
      binding: OneToOneMeetBinding(),
    ),
    GetPage(
      name: '/joinScreen',
      page: () => JoinScreen(),
      binding: JoinScreenBinding(),
    ),
    GetPage(
      name: '/chat',
      page: () => Chat(),
      binding: ChatBinding(),
    ),
    GetPage(
        name: '/wishlist',
        page: () => Wishlist(),
        binding: WishlistBinding()
    ),
    GetPage(
        name: '/following',
        page: () => Following(),
        binding: FollowingBinding()
    ),
    GetPage(
        name: '/review',
        page: () => Review(),
        binding: ReviewBinding()
    ),
    GetPage(
      name: '/myProfile',
      page: () => MyProfile(),
      binding: MyProfileBinding(),
    ),
    GetPage(
      name: '/myLanguage',
      page: () => MyLanguage(),
      binding: MyLanguageBinding(),
    ),
    GetPage(
      name: '/mySkill',
      page: () => MySkill(),
      binding: MySkillBinding(),
    ),
    GetPage(
      name: '/mySpec',
      page: () => MySpec(),
      binding: MySpecBinding(),
    ),
    GetPage(
      name: '/myBankDetails',
      page: () => MyBankDetails(),
      binding: MyBankDetailsBinding(),
    ),
    GetPage(
      name: '/manageBankDetails',
      page: () => ManageBankDetails(),
      binding: ManageBankDetailsBinding(),
    ),
    GetPage(
      name: '/myBankHistory',
      page: () => MyBankHistory(),
      binding: MyBankHistoryBinding(),
    ),
    GetPage(
      name: '/myGallery',
      page: () => MyGallery(),
      binding: MyGalleryBinding(),
    ),
    GetPage(
      name: '/supportChat',
      page: () => SupportChat(),
      binding: SupportChatBinding(),
    ),
    GetPage(
      name: '/photoView',
      page: () => PhotoView(),
    ),
    GetPage(
      name: '/customPDFViewer',
      page: () => CustomPDFViewer(),
      binding: CustomPDFViewerBinding(),
    ),
    GetPage(
      name: '/wallet',
      page: () => Wallet(),
      binding: WalletBinding(),
    ),
    GetPage(
      name: '/quickReplies',
      page: () => MyQuickReplies(),
      binding: MyQuickRepliesBinding(),
    ),
    GetPage(
      name: '/information',
      page: () => Information(),
      binding: InformationBinding(),
    ),
    GetPage(
      name: '/userDetail',
      page: () => UserDetail(),
      binding: UserDetailBinding(),
    ),
    GetPage(
      name: '/contactUs',
      page: () => ContactUs(),
      binding: ContactUsBinding(),
    ),
  ];
}
