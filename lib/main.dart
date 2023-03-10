import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poc_navigation/page.dart';
import 'go_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/1': (context) => WhitePage(
              title: 'page 1',
              buttonText: 'go to page 2',
              onPressed: () => Navigator.of(context).pushNamed('/2'),
              color: Colors.greenAccent,
            ),
        '/2': (context) => WhitePage(
              title: 'page 2',
              buttonText: 'go to page default',
              onPressed: () {
                Navigator.of(context)
                    .pushNamed('/')
                    .then((_) => context.go('/3'));
              },
              color: Colors.greenAccent,
            ),
        '/': (context) => Router.withConfig(
              config: GoRouter(
                initialLocation: '/',
                routes: [
                  ShellRoute(
                      builder: (context, state, child) {
                        return ScaffoldWithBottomNavBar(child: child);
                      },
                      routes: [
                        GoRoute(
                          path: '/',
                          builder: (gocontext, __) => WhitePage(
                            title: 'page default',
                            buttonText: 'go to page 1',
                            onPressed: () => gocontext.go('/3'),
                            color: Colors.brown,
                          ),
                        ),
                        GoRoute(
                          path: '/3',
                          builder: (gocontext, __) => WhitePage(
                            title: 'page 1',
                            buttonText: 'go to page 2',
                            onPressed: () => gocontext.go('/4'),
                            color: Colors.brown,
                          ),
                        ),
                        GoRoute(
                          path: '/4',
                          builder: (context, __) => WhitePage(
                            title: 'page 2',
                            buttonText: 'go to page lo quesea ',
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true)
                                  .pushNamed('/1');
                              context.go('/3');
                            },
                            color: Colors.brown,
                          ),
                        )
                      ]),
                ],
              ),
            ),
      },
    );
  }
}

class ScaffoldWithBottomNavBar extends StatefulWidget {
  const ScaffoldWithBottomNavBar({Key? key, required this.child})
      : super(key: key);
  final Widget child;

  @override
  State<ScaffoldWithBottomNavBar> createState() =>
      _ScaffoldWithBottomNavBarState();
}

class _ScaffoldWithBottomNavBarState extends State<ScaffoldWithBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.green),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
                backgroundColor: Colors.yellow),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Colors.blue,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: 0,
          selectedItemColor: Colors.black,
          iconSize: 40,
          onTap: (_) {},
          elevation: 5),
    );
  }
}
