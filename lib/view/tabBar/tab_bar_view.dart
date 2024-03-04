import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lms/view/account/account_view.dart';
import 'package:lms/view/enrolled/enrolled_view.dart';
import 'package:lms/view/home/home_view.dart';
import 'package:lms/view/search/search_view.dart';

class CustomTabBarView extends StatefulWidget {
  const CustomTabBarView({super.key});

  @override
  State<CustomTabBarView> createState() => _CustomTabBarViewState();
}

class _CustomTabBarViewState extends State<CustomTabBarView> {
  var currentIndex = 0;

  final List _pages = [
    HomeView(),
    const SearchView(),
    const EnrolledView(),
    const AccountView(),
  ];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: _pages[currentIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: GNav(
          onTabChange: (value) {
            setState(
              () {
                currentIndex = value;
              },
            );
          },
          rippleColor: Colors.grey.shade800,
          hoverColor: Colors.grey.shade700,
          color: theme.colorScheme.primary,
          activeColor: theme.colorScheme.onPrimary,
          tabBackgroundColor: theme.colorScheme.primary,
          gap: 8,
          padding: const EdgeInsets.all(12),
          tabs: const [
            GButton(
              icon: Icons.home_filled,
              text: 'Home',
            ),
            GButton(
              icon: Icons.search,
              text: 'Search',
            ),
            GButton(
              icon: Icons.bookmark,
              text: 'Enrolled',
            ),
            GButton(
              icon: Icons.person,
              text: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
