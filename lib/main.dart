

import 'package:dio/dio.dart';
import 'package:news_app_flutter/constant/export.dart';

final dioInstanceProvider = Provider<Dio>((ref) {
  return Dio();
});

final dioClientProvider = Provider<DioClient>((ref) {
  final dio = ref.watch(dioInstanceProvider);
  return DioClient(dio);
});

void main() {
  runApp( ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: Routes.routes,
      debugShowCheckedModeBanner: false,
      home: NewsListScreen(),
    );
  }
}

