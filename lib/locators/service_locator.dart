import 'package:get_it/get_it.dart';

import '../services/call_sms.dart';

GetIt locator = GetIt.asNewInstance();

void setupLocator() {
  locator.registerSingleton(CallsAndMessagesService());
}
