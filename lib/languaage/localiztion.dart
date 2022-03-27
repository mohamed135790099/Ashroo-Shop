import 'package:get/route_manager.dart';
import 'package:sroo_shop/languaage/ar.dart';
import 'package:sroo_shop/languaage/en.dart';
import 'package:sroo_shop/languaage/fr.dart';

import '../utils/my_string.dart';


class LocaliztionApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        ene: en,
        ara: ar,
        frf: fr,
      };
}
