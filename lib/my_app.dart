import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/pages/details_page/binding/details_page_binding.dart';
import 'package:test_1/pages/details_page/view/details_page.dart';
import 'package:test_1/pages/home_page/binding/home_page_binding.dart';
import 'package:test_1/pages/home_page/view/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.homePageRoute,
      getPages: [
        GetPage(
          name: HomePage.homePageRoute,
          page: () => const HomePage(),
          binding: HomePageBinding(),
        ),
        GetPage(
          name: DetailsPage.detailsPageRoute,
          page: () => const DetailsPage(),
          binding: DetailsPageBinding(),
        )
      ],
    );
  }
}
