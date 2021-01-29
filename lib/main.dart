
import 'package:ibu_negara/core/router/Router.dart';
import 'package:ibu_negara/module/home/HomePage.dart';
import 'package:ibu_negara/widget/DefaultWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ibu Negara',
      routes: getRoutes(),
      debugShowCheckedModeBanner: false,
      //navigatorKey: _navigatorKey,
      //navigatorObservers: [FirebaseAnalyticsObserver(analytics: FirebaseAnalytics())],
      theme: ThemeData(
        backgroundColor: Colors.white,
        primaryColor: color_primary,
        primaryColorDark: color_primary_dark,
        accentColor: color_accent,
        dividerColor: color_divider,
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(spacing_large),
            ),
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}
