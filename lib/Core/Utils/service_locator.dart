import 'package:bookly_app/Features/Home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/Features/Search/data/repos/search_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'Service/api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // تسجيل الـ ApiService
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  // تسجيل HomeRepoImpl
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>()));

  // تسجيل SearchRepoImpl
  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(getIt.get<ApiService>()),
  );
}
