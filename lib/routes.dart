



import 'package:news_app_flutter/constant/export.dart';

class Routes {

  //static variables
  static const String newsListRoute = '/newsListRoute';


  /*============================================== App Routes added here ===================================================*/

  static final routes = <String, WidgetBuilder>{
    newsListRoute: (BuildContext context) => NewsListScreen(),

  };
}