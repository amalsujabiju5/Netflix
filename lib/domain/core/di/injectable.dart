import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/di/injectable.config.dart';

//instance of get it

final getIt = GetIt.instance;
@InjectableInit()
Future<void> configureInjection() async {
  await $initGetIt(getIt, environment: Environment.prod);
}
