import 'package:get/get.dart';
import 'package:widgets/modules/about_us/view.dart';
import 'package:widgets/modules/add%20data/add_widget/view.dart';
import 'package:widgets/modules/auth/login/view.dart';
import 'package:widgets/modules/auth/signup/view.dart';
import 'package:widgets/modules/contact_us/view.dart';
import 'package:widgets/modules/inner%20screens/collection/view.dart';
import 'package:widgets/modules/inner%20screens/components/view.dart';
import 'package:widgets/modules/inner%20screens/widget_info/view.dart';
import 'package:widgets/modules/widget_app.dart';
import 'package:widgets/routes/routes_name.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(name: RouteName.widgetApp, page: () => const WidgetApp()),
        GetPage(name: RouteName.aboutus, page: () => AboutUsPage()),
        GetPage(name: RouteName.contactus, page: () => ContactUsPage()),
        GetPage(name: RouteName.collection, page: () => CollectionPage()),
        GetPage(name: RouteName.components, page: () => ComponentsPage()),
        GetPage(name: RouteName.widgetsInfo, page: () => WidgetInfoPage()),
        GetPage(name: RouteName.addWidget, page: () => AddWidgetPage()),
        GetPage(name: RouteName.login, page: () => LoginPage()),
        GetPage(name: RouteName.signup, page: () => SignupPage()),
      ];
}
