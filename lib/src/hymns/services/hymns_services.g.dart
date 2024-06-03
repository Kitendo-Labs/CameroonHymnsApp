// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hymns_services.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getHymnsHash() => r'bddf6d90d8330d2d47d11fa9e839d2a320443a7a';

/// See also [getHymns].
@ProviderFor(getHymns)
final getHymnsProvider = AutoDisposeFutureProvider<HymnsList>.internal(
  getHymns,
  name: r'getHymnsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getHymnsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetHymnsRef = AutoDisposeFutureProviderRef<HymnsList>;
String _$getHymnsListHash() => r'ca4d8c99a049ca22059332e2a01e213d3d494374';

/// See also [getHymnsList].
@ProviderFor(getHymnsList)
final getHymnsListProvider = AutoDisposeFutureProvider<List<Hymn?>>.internal(
  getHymnsList,
  name: r'getHymnsListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getHymnsListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetHymnsListRef = AutoDisposeFutureProviderRef<List<Hymn?>>;
String _$getOtherHymnsListHash() => r'b24223d1868cb71dc8e51ec99973c8a7c3d210f7';

/// See also [getOtherHymnsList].
@ProviderFor(getOtherHymnsList)
final getOtherHymnsListProvider =
    AutoDisposeFutureProvider<List<Hymn?>>.internal(
  getOtherHymnsList,
  name: r'getOtherHymnsListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getOtherHymnsListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetOtherHymnsListRef = AutoDisposeFutureProviderRef<List<Hymn?>>;
String _$getCategoriesListHash() => r'b99d659b1334f7d674e60169e87e4dbcc957410f';

/// See also [getCategoriesList].
@ProviderFor(getCategoriesList)
final getCategoriesListProvider =
    AutoDisposeFutureProvider<List<HymnTitle?>>.internal(
  getCategoriesList,
  name: r'getCategoriesListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getCategoriesListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetCategoriesListRef = AutoDisposeFutureProviderRef<List<HymnTitle?>>;
String _$themeModeNotifierHash() => r'f31798cb6ef540506c9b454395164ac6a7c41fe5';

/// See also [ThemeModeNotifier].
@ProviderFor(ThemeModeNotifier)
final themeModeNotifierProvider =
    NotifierProvider<ThemeModeNotifier, ThemeMode>.internal(
  ThemeModeNotifier.new,
  name: r'themeModeNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$themeModeNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ThemeModeNotifier = Notifier<ThemeMode>;
String _$fontSizeMultiplierHash() =>
    r'6cb8763c55a3de454bdb46a6739e1eb496c3ab3c';

/// See also [FontSizeMultiplier].
@ProviderFor(FontSizeMultiplier)
final fontSizeMultiplierProvider =
    AutoDisposeNotifierProvider<FontSizeMultiplier, double>.internal(
  FontSizeMultiplier.new,
  name: r'fontSizeMultiplierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fontSizeMultiplierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FontSizeMultiplier = AutoDisposeNotifier<double>;
String _$searchedHymnsHash() => r'c2f42c60a799cc4bb7686f5231734102fe25d365';

/// See also [SearchedHymns].
@ProviderFor(SearchedHymns)
final searchedHymnsProvider =
    AutoDisposeNotifierProvider<SearchedHymns, List<Hymn?>>.internal(
  SearchedHymns.new,
  name: r'searchedHymnsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchedHymnsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchedHymns = AutoDisposeNotifier<List<Hymn?>>;
String _$favoriteHymnsHash() => r'65eef4eddb5c16353c808de8979d2cf74f51a9fe';

/// See also [FavoriteHymns].
@ProviderFor(FavoriteHymns)
final favoriteHymnsProvider =
    NotifierProvider<FavoriteHymns, List<Hymn?>>.internal(
  FavoriteHymns.new,
  name: r'favoriteHymnsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favoriteHymnsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FavoriteHymns = Notifier<List<Hymn?>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
