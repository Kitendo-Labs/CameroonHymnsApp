import 'package:cameroon_hymn/src/home/services/package_info.dart';
import 'package:cameroon_hymn/src/home/services/remote_config.dart';
import 'package:cameroon_hymn/src/hymns/models/hymns.dart';
import 'package:cameroon_hymn/src/profile/services/firebase_service.dart';
import 'package:cameroon_hymn/src/utils/sembast_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'providers.g.dart';

const dense = 60.0;
const expanded = 105.0;

final selectedHymnCategory = StateProvider<HymnTitle?>((ref) => null);
final textCurve = Provider((ref) => Curves.easeIn);
final textAnimationDuration = Provider((ref) => 300);
final showMore = StateProvider.autoDispose((ref) => false);
final showPlayer = StateProvider.autoDispose((ref) => false);
final hymnListPageControllerProvider = Provider((ref) => PageController());

final homeBottomSize = StateProvider.autoDispose((ref) {
  final padding = ref.watch(appPaddingProvider).bottom;
  final bottom =
      ref.watch(showMore) || ref.watch(showPlayer) ? expanded : dense;
  return bottom + padding;
});
final appPaddingProvider = StateProvider((ref) => const EdgeInsets.all(0));
final showSearchProvider = StateProvider((ref) => false);

final sembastProvider = StateProvider((ref) => SembastDatabase());

@Riverpod(keepAlive: true)
Future<SharedPreferences> sharedPreference(SharedPreferenceRef ref) =>
    SharedPreferences.getInstance(); //

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

@Riverpod(keepAlive: true)
Future<void> appStartup(AppStartupRef ref) async {
  ref.onDispose(() {
    // ensure we invalidate all the providers we depend on
    ref.invalidate(sharedPreferenceProvider);
  });
  // all asynchronous app initialization code should belong here:
  await ref.watch(sharedPreferenceProvider.future);
  await ref.watch(sembastProvider).init();
  await ref.watch(appConfigProvider).initialize();
  await ref.watch(appInfoProvider).initialize();
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    ref.watch(isSignedIn.notifier).update((state) => user != null);
    if (user == null) {
      print("Not logged in");
    } else {
      print("Logged in");
    }
  });
}
