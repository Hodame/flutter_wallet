import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/firebase_options.dart';
import 'package:flutter_learn/pages/home_page.dart';
import 'package:flutter_learn/pages/product_page.dart';
import 'package:flutter_learn/pages/profile_page.dart';
import 'package:flutter_learn/pages/wishlist_page.dart';
import 'package:flutter_learn/themes/theme.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();

  var darkModeBox = await Hive.openBox('darkMode');

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final darkModeBox = Hive.box('darkMode');

  late bool _isDarkMode = darkModeBox.get('isDarkMode') ?? false;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(darkModeBox.get('isDarkMode'));
    print(_isDarkMode);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
      debugShowCheckedModeBanner: false,
      title: 'Wallet app',
      theme: lightTheme,
      darkTheme: darkTheme,
    );
  }
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final _router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/product/1',
      builder: (context, state) => ProductPage(
        key: state.pageKey,
      ),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return Scaffold(
          body: child,
          bottomNavigationBar: const MyNavBar(),
        );
      },
      routes: [
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/',
          pageBuilder: (context, state) => NoTransitionPage(
              child: HomePage(
            key: state.pageKey,
          )),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/wishlist',
          pageBuilder: (context, state) => NoTransitionPage(
              child: WishListPage(
            key: state.pageKey,
          )),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/profile',
          pageBuilder: (context, state) => NoTransitionPage(
              child: ProfilePage(
            key: state.pageKey,
          )),
        ),
      ],
    ),
  ],
);

class MyNavBar extends StatefulWidget {
  const MyNavBar({super.key});

  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return GNav(
      selectedIndex: _selectedIndex,
      gap: 15,
      backgroundColor: Theme.of(context).colorScheme.background,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      color: Theme.of(context).colorScheme.onBackground,
      activeColor: Theme.of(context).colorScheme.primary,
      rippleColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      onTabChange: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      tabs: [
        GButton(
          icon: Icons.home_outlined,
          text: 'Home',
          onPressed: () => _selectedIndex != 0 ? context.go('/') : null,
        ),
        GButton(
          icon: Icons.favorite_outline_rounded,
          text: 'WishList',
          onPressed: () => _selectedIndex != 1 ? context.go('/wishlist') : null,
        ),
        const GButton(
          icon: Icons.local_mall_outlined,
          text: 'Cart',
        ),
        GButton(
          icon: Icons.person_outline_rounded,
          text: 'Profile',
          onPressed: () => _selectedIndex != 2 ? context.go('/profile') : null,
        ),
      ],
    );
  }
}
