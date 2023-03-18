import 'package:get/get.dart';

import '../ui/intro/intro_page.dart';
import '../ui/intro/intro_page_binding.dart';
import '../ui/main/main_page.dart';
import '../ui/main/main_page_binding.dart';
import 'extension.dart';

enum Routes {
  empty,
  main,
  intro,
}

final Map<Routes, MapEntry<WidgetFunc, Bindings?>> pages = {
  Routes.main: MapEntry(() => const MainPage(), MainPageBinding()),
  Routes.intro: MapEntry(() => const IntroPage(), IntroPageBinding()),
};
