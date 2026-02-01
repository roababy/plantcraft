import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'pages/dashboard_page.dart';
import 'pages/ingredient_library_page.dart';
import 'pages/ingredient_detail_page.dart';
import 'pages/recipe_builder_page.dart';
import 'pages/recipe_layers_page.dart';
import 'pages/substitution_modal_page.dart';
import 'pages/cost_overview_page.dart';
import 'pages/version_history_page.dart';
import 'pages/functions_map_page.dart';
import 'pages/supplier_management_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.home,
    routes: [
      GoRoute(
        path: AppRoutes.home,
        name: 'home',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: DashboardPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.ingredientLibrary,
        name: 'ingredientLibrary',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: IngredientLibraryPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.ingredientDetail,
        name: 'ingredientDetail',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: IngredientDetailPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.recipeBuilder,
        name: 'recipeBuilder',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: RecipeBuilderPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.recipeLayers,
        name: 'recipeLayers',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: RecipeLayersPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.substitutionModal,
        name: 'substitutionModal',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: SubstitutionModalPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.costOverview,
        name: 'costOverview',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: CostOverviewPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.versionHistory,
        name: 'versionHistory',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: VersionHistoryPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.functionsMap,
        name: 'functionsMap',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: FunctionsMapPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.supplierManagement,
        name: 'supplierManagement',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: SupplierManagementPage(),
        ),
      ),
    ],
  );
}

class AppRoutes {
  static const String home = '/';
  static const String ingredientLibrary = '/ingredient-library';
  static const String ingredientDetail = '/ingredient-detail';
  static const String recipeBuilder = '/recipe-builder';
  static const String recipeLayers = '/recipe-layers';
  static const String substitutionModal = '/substitution-modal';
  static const String costOverview = '/cost-overview';
  static const String versionHistory = '/version-history';
  static const String functionsMap = '/functions-map';
  static const String supplierManagement = '/supplier-management';
}
