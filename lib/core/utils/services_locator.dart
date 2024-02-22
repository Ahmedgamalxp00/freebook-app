import 'package:dio/dio.dart';
import 'package:freebook_app/core/utils/api_services.dart';
import 'package:freebook_app/features/home/data/repos/home_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<ApiServices>(ApiServices(Dio()));
  getIt.registerSingleton<HomeRepoEmpl>(
    HomeRepoEmpl(
      getIt.get<ApiServices>(),
    ),
  );
}
