import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freebook_app/core/utils/services_locator.dart';
import 'package:freebook_app/features/home/data/models/book_model/book_model.dart';
import 'package:freebook_app/features/home/data/repos/home_repo_impl.dart';

import 'package:freebook_app/features/home/presentation/manager/book_detailes_cubit/book_detailes_cubit.dart';
import 'package:freebook_app/features/home/presentation/views/home_detailes_view.dart';
import 'package:freebook_app/features/home/presentation/views/home_view.dart';
import 'package:freebook_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:freebook_app/features/search/presentation/views/search_view.dart';
import 'package:go_router/go_router.dart';
import '../../features/splash/presentation/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kHomeDetailesView = '/homeDetailesView';
  static const kSearchView = '/searchview';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kHomeDetailesView,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => BookDetailesCubit(
              getIt.get<HomeRepoEmpl>(),
            ),
            child: HomeDetailesView(
              book: state.extra as BookModel,
            ),
          );
        },
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => SearchCubit(
              getIt.get<HomeRepoEmpl>(),
            ),
            child: const SearchView(),
          );
        },
      ),
    ],
  );
}
