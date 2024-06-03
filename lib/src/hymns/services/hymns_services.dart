import 'dart:convert';

import 'package:cameroon_hymn/src/hymns/models/hymns.dart';
import 'package:cameroon_hymn/src/utils/providers.dart';
import 'package:cameroon_hymn/src/utils/sembast_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sembast/sembast.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'hymns_services.g.dart';

@riverpod
Future<HymnsList> getHymns(GetHymnsRef ref) async {
  final String jsonString =
      await rootBundle.loadString('assets/hymns_json/hymns.json');
  final Map<String, dynamic> jsonMap = json.decode(jsonString);
  return HymnsList.fromJson(jsonMap);
}

@riverpod
Future<List<Hymn?>> getHymnsList(GetHymnsListRef ref) async {
  final hymnList = ref.watch(getHymnsProvider);
  final hymnObjectList = hymnList is AsyncLoading
      ? HymnsList.fromJson({'hymns': [], 'categories': []})
      : hymnList.requireValue;

  final selectCategory = ref.watch(selectedHymnCategory);
  final hymnsFromCategories =
      getHymnsFromCategories(hymnObjectList.hymns, selectCategory);

  final searchedTerm = ref.watch(searchedTermProvider);

  if (selectCategory == null && searchedTerm.isEmpty) {
    return hymnObjectList.hymns;
  }
  if (ref.watch(showSearchProvider)) {
    final hymnsFromSearch = searchHymns(hymnsFromCategories, searchedTerm);
    return hymnsFromSearch;
  }

  return hymnsFromCategories;
}

@riverpod
Future<List<Hymn?>> getOtherHymnsList(GetHymnsListRef ref) async {
  final hymnList = ref.watch(getHymnsProvider);
  final selectCategory = ref.watch(selectedHymnCategory);

  if (selectCategory == null) return [];
  final hymnObjectList = hymnList is AsyncLoading
      ? HymnsList.fromJson({'hymns': [], 'categories': []})
      : hymnList.requireValue;

  final searchedTerm = ref.watch(searchedTermProvider);
  List<Hymn?> hymnsFromSearch = [];
  if (searchedTerm.isNotEmpty) {
    hymnsFromSearch = searchHymns(hymnObjectList.hymns, searchedTerm);
    return hymnsFromSearch;
  }

  return hymnsFromSearch;
}

List<Hymn?> getHymnsFromCategories(
    List<Hymn?> hymns, HymnTitle? selectCategory) {
  final hymnListLength = hymns.length;
  if (selectCategory == null) return hymns;
  List<Hymn?> hymnListValues = [];
  for (var hymnIndices in selectCategory.hymns) {
    int startIndex = int.parse(hymnIndices[0]);
    int endIndex = int.parse(hymnIndices[1]);
    if (hymnListLength > 0) {
      startIndex = startIndex >= hymnListLength ? 10 : startIndex;
      endIndex = endIndex >= hymnListLength ? hymnListLength : endIndex;
    }
    hymnListValues = [
      ...hymnListValues,
      ...(startIndex == endIndex
          ? [hymns[startIndex]]
          : hymns.sublist(startIndex - 1, endIndex))
    ];
  }

  return hymnListValues;
}

String removePunctuation(String text) {
  var separators = [
    ',',
    '.',
    ';',
    ':',
    '-',
    '–',
    '—',
    '\'',
    '"',
    '(',
    ')',
    '[',
    ']',
    '{',
    '}',
    '/',
    '\\'
  ];
  for (var separator in separators) {
    text = text.replaceAll(separator, '');
  }
  return text;
}

List<Hymn?> searchHymns(List<Hymn?> hymns, String searchTerm) {
  final searchTermLowerCase = searchTerm.toLowerCase();
  final searchResults = hymns.where((element) {
    final titleContains = removePunctuation(element!.title.toLowerCase())
        .contains(searchTermLowerCase);
    final antiphonesContains =
        removePunctuation(element.antiphones.join(' ').toLowerCase())
            .contains(searchTermLowerCase);
    final versesContains =
        removePunctuation(element.verses.join(' ').toLowerCase())
            .contains(searchTermLowerCase);
    final refrainsContains =
        removePunctuation(element.refrains.join('').toLowerCase())
            .contains(searchTermLowerCase);
    return titleContains ||
        antiphonesContains ||
        versesContains ||
        refrainsContains;
  }).toList();
  return searchResults;
}

@riverpod
Future<List<HymnTitle?>> getCategoriesList(GetCategoriesListRef ref) async {
  final hymnList = ref.watch(getHymnsProvider);
  final hymnObjectList = hymnList is AsyncLoading
      ? HymnsList.fromJson({'hymns': [], 'categories': []})
      : hymnList.requireValue;
  return hymnObjectList.categories;
}

@Riverpod(keepAlive: true)
class ThemeModeNotifier extends _$ThemeModeNotifier {
  SharedPreferences? _database;

  @override
  ThemeMode build() {
    _database = ref.watch(sharedPreferenceProvider).requireValue;
    return fetchThemes();
  }

  ThemeMode fetchThemes() {
    final theme = _database!.getString('theme');
    final newState = ThemeMode.values.firstWhere((element) {
      final output = element.name == theme;
      return output;
    }, orElse: () => ThemeMode.system);
    return newState;
  }

  void update(Brightness currentBrightness) {
    final newState = switch (state) {
      ThemeMode.light => ThemeMode.dark,
      ThemeMode.dark => ThemeMode.light,
      ThemeMode.system => currentBrightness == Brightness.light
          ? ThemeMode.dark
          : ThemeMode.light,
    };
    _database!.setString('theme', newState.name);
    state = newState;
  }
}

@riverpod
class FontSizeMultiplier extends _$FontSizeMultiplier {
  SharedPreferences? _database;

  @override
  double build() {
    _database = ref.watch(sharedPreferenceProvider).requireValue;
    return fetchFontMultiplier();
  }

  double fetchFontMultiplier() {
    final fontMultiplier = _database!.getDouble('fontMultiplier');
    return fontMultiplier ?? 1.0;
  }

  void update(double fontMultiplier) {
    _database!.setDouble('fontMultiplier', fontMultiplier);
    state = fontMultiplier;
  }
}

final searchedTermProvider = StateProvider((ref) => '');

@riverpod
class SearchedHymns extends _$SearchedHymns {
  @override
  List<Hymn?> build() {
    final hymnListProvider = ref.watch(getHymnsProvider);
    return hymnListProvider is AsyncLoading
        ? []
        : hymnListProvider.requireValue.hymns;
  }
}

@Riverpod(keepAlive: true)
class FavoriteHymns extends _$FavoriteHymns {
  SembastDatabase? _database;

  final _store = StoreRef<String, List<Object?>>.main();
  @override
  List<Hymn?> build() {
    _database = ref.watch(sembastProvider);
    return [];
  }

  getFavoriteHymns() async {
    final record = _store.record('favorites');
    final jsonHymnsDatabase = (await record.get(_database!.instance));
    final favHymns = jsonHymnsDatabase
            ?.map((e) => Hymn.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [];
    state = favHymns;
  }

  Future<void> toggleFavorite(Hymn hymn) async {
    final record = _store.record('favorites');
    final jsonHymnsDatabase = (await record.get(_database!.instance));
    final favHymns = jsonHymnsDatabase
            ?.map((e) => Hymn.fromJson(e as Map<String, dynamic>)) ??
        [];
    List<Hymn?> hymns = [];
    if (state.contains(hymn)) {
      hymns = [...favHymns.where((item) => item.id != hymn.id)];
    } else {
      hymns = [...favHymns, hymn];
    }
    final jsonHymns = hymns.map((e) => e!.toJson()).toList();
    await record.put(_database!.instance, jsonHymns);
    state = hymns;
  }

  bool isFavorite(Hymn hymn) {
    final isFav = state.contains(hymn);
    return isFav;
  }
}
