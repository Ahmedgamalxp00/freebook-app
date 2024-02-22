import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freebook_app/constants.dart';
import 'package:freebook_app/core/utils/app_router.dart';
import 'package:freebook_app/core/utils/services_locator.dart';
import 'package:freebook_app/features/home/data/repos/home_repo_impl.dart';
import 'package:freebook_app/features/home/presentation/manager/best_seller_cubit/best_seller_cubit.dart';
import 'package:freebook_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setupServiceLocator();
  runApp(const FreeBookApp());
}

class FreeBookApp extends StatelessWidget {
  const FreeBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            getIt.get<HomeRepoEmpl>(),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => BestSellerCubit(
            getIt.get<HomeRepoEmpl>(),
          )..fetchBestSellerBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kPrimaryColor,
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
      ),
    );
  }
}
