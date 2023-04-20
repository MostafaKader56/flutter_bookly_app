import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bookly_app/core/utils/api_service.dart';
import 'package:flutter_bookly_app/core/utils/service_locator.dart';
import 'package:flutter_bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter_bookly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:flutter_bookly_app/features/home/presentation/manager/similar_books_cubit/similar_list_cubit.dart';
import 'package:flutter_bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:flutter_bookly_app/features/home/presentation/views/home_view.dart';
import 'package:flutter_bookly_app/features/search/presentation/views/search_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/splash/presentation/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kdetailsView = '/detailsScreen';
  static const kSearchView = '/searchScreen';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: kdetailsView,
        builder: (context, state) {
          return BlocProvider(
              create: (BuildContext context) {
                return SimilarListCubit(
                  getIt.get<HomeRepoImpl>(),
                );
              },
              child: BookDetailsView(
                bookModel: state.extra as BookModel,
              ));
        },
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) {
          return const SearchView();
        },
      ),
    ],
  );
}
