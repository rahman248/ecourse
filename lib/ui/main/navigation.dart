import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:ecourse/ui/home/home.dart';
import 'package:ecourse/ui/profile/profile.dart';
import 'package:flutter/material.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  late int _selectedPage = 0;
  late FocusNode myFocusNode;
  final TextEditingController _searchControl = TextEditingController();
  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];

  @override
  @mustCallSuper
  void initState() {
    myFocusNode = FocusNode();
  }


  @override
  void dispose() {
    _searchControl.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async{
        if (_navigatorKeys[_selectedPage].currentState != null) {
          _navigatorKeys[_selectedPage].currentState!.maybePop();
          return false;
        }

        return true;
      },
      child: Scaffold(
       /* extendBodyBehindAppBar: true,
        appBar: _buildAppBar(),*/
        body: Stack(
          children: [
            _buildOffstageNavigator(0),
            _buildOffstageNavigator(1),
          ],
        ),
        bottomNavigationBar: _buildFloatingBar()
      ),
    );
  }


  Widget _buildFloatingBar() {
    return CustomNavigationBar(
      iconSize: 30.0,
      elevation: 60.0,
      selectedColor: const Color(0xff0c18fb),
      strokeColor: const Color(0x30000000),
      unSelectedColor: Colors.grey[600],
      backgroundColor: Colors.white,
      borderRadius: const Radius.circular(20.0),
      isFloating: true,
      items: [
        CustomNavigationBarItem(
          icon: const Icon(
            Icons.home_outlined,
          ),
        ),
        CustomNavigationBarItem(
          icon: const Icon(
            Icons.bookmark_border_rounded,
          ),
        ),
        CustomNavigationBarItem(
          icon: const Icon(
            Icons.play_circle_outline,
          ),
        ),
        CustomNavigationBarItem(
          icon: const Icon(
            Icons.person_outline,
          ),
        ),
      ],
      currentIndex: _selectedPage,
      onTap: (index) {
        setState(() {
          _selectedPage = index;
        });
      },
    );
  }


  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          const HomeScreen(),
          const ProfileScreen(),
          const ProfileScreen(),
          const ProfileScreen(),
        ].elementAt(index);
      },
    };
  }

  Widget _buildOffstageNavigator(int index) {
    final routeBuilders = _routeBuilders(context, index);

    return Offstage(
      offstage: _selectedPage != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
              builder: (context) => routeBuilders[routeSettings.name]!(context)

          );
        },
      ),
    );
  }
}