import 'package:get/get.dart';
import 'package:widgets/modules/about_us/view.dart';
import 'package:widgets/modules/add%20data/add_widget/view.dart';
import 'package:widgets/modules/contact_us/view.dart';
import 'package:widgets/modules/inner%20screens/collection/view.dart';
import 'package:widgets/modules/inner%20screens/components/view.dart';
import 'package:widgets/modules/inner%20screens/widget_info/view.dart';
import 'package:widgets/routes/routes_name.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(name: RouteName.aboutus, page: () => AboutUsPage()),
        GetPage(name: RouteName.contactus, page: () => ContactUsPage()),
        GetPage(name: RouteName.collection, page: () => CollectionPage()),
        GetPage(name: RouteName.components, page: () => ComponentsPage()),
        GetPage(name: RouteName.widgetsInfo, page: () => WidgetInfoPage()),
        GetPage(name: RouteName.addWidget, page: () => AddWidgetPage()),
      ];
}
