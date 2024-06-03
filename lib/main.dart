import 'package:cameroon_hymn/src/theme/app_theme.dart';
import 'package:cameroon_hymn/src/home/view/home_page.dart';
import 'package:cameroon_hymn/src/hymns/services/hymns_services.dart';
import 'package:cameroon_hymn/src/utils/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: AppStartupWidget()));
}

class AppStartupWidget extends ConsumerWidget {
  const AppStartupWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStartupState = ref.watch(appStartupProvider);
    return appStartupState.when(
      loading: () => const AppStartupLoadingWidget(),
      error: (e, st) => AppStartupErrorWidget(
        message: e.toString(),
        onRetry: () => ref.invalidate(appStartupProvider),
      ),
      data: (_) => const MyApp(),
    );
  }
}

class AppStartupLoadingWidget extends StatelessWidget {
  const AppStartupLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cameroon Hymn',
      theme: AppTheme.light,
      // 3. Provide dark theme.
      darkTheme: AppTheme.dark,
      // 4. Watch AppTheme changes (ThemeMode).
      home: const Center(
        child: SizedBox(
          height: 40,
          width: 40,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class AppStartupErrorWidget extends StatelessWidget {
  const AppStartupErrorWidget({super.key, required this.message, this.onRetry});

  final String message;
  final void Function()? onRetry;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cameroon Hymn',
      theme: AppTheme.light,
      // 3. Provide dark theme.
      darkTheme: AppTheme.dark,
      // 4. Watch AppTheme changes (ThemeMode).
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(message),
              const SizedBox(height: 20),
              TextButton(
                onPressed: onRetry,
                child: const Text("Retry"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.microtask(() async {
      ref.read(appPaddingProvider.notifier).update(
            (state) => MediaQuery.paddingOf(context),
          );
    });
    return MaterialApp(
      title: 'Cameroon Hymn',
      theme: AppTheme.light,
      // 3. Provide dark theme.
      darkTheme: AppTheme.dark,
      // 4. Watch AppTheme changes (ThemeMode).
      themeMode: ref.watch(themeModeNotifierProvider),
      home: const MyHomePage(title: 'Christian Hymns'),
      navigatorKey: navigatorKey,
    );
  }
}
