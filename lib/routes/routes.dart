import 'package:get/get.dart';
import 'package:widgets/modules/about_us/view.dart';
import 'package:widgets/modules/contact_us/view.dart';
import 'package:widgets/routes/routes_name.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(name: RouteName.aboutus, page: () => AboutUsPage()),
        GetPage(name: RouteName.contactus, page: () => ContactUsPage()),
      ];
}
