import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_flutter/constant/colors.dart';
import 'package:news_app_flutter/features/newsfeed/presentation/screens/news_feed_screen.dart';


class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> with SingleTickerProviderStateMixin{


  @override
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    navigateToHomeScreen();
    super.initState();
  }

  Future<void> navigateToHomeScreen() async {
    await Future.delayed(const Duration(seconds: 3)).then((value)  {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>
      const NewsFeedView()), (Route<dynamic> route) => false,);});
    }



   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: bgColor,
       body: Center(
         child: Container(
           height: 150,
           width: 150,
           alignment: Alignment.center,
           decoration: BoxDecoration(
             shape: BoxShape.circle,
             border: Border.all(color: Colors.white, width: 5),
           ),
           child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 2),
             child: Text(
               'News App',
               textAlign: TextAlign.center,
               style: TextStyle(
                 fontSize: 20,
                 color: Colors.white,
               ),
             ),
           ),
         ),
       ),
     );
   }



   @override
   void dispose() {
     super.dispose();
   }

}
