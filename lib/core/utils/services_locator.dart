import 'package:equation/controller/provider/perform_equation.dart';
import 'package:get_it/get_it.dart';

  abstract class ServiceLocator {

  static final getIt = GetIt.instance;

  static void setup() {
    getIt.registerLazySingleton<PerformEquationProvider>(() =>PerformEquationProvider() );

  }
}