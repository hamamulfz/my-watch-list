import 'package:about/about_page.dart';
import 'package:flutter/material.dart';
import 'package:movie/presentation/pages/movie_home_page.dart';
import 'package:movie/presentation/pages/watchlist_movies_page.dart';
import 'package:tv_show/presentation/pages/tv_home_page.dart';
import 'package:tv_show/presentation/pages/tvs_watchlist_page.dart';

class DitontonDrawer extends StatelessWidget {
  const DitontonDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/circle-g.png'),
            ),
            accountName: Text('Ditonton Tv'),
            accountEmail: Text('ditonton@dicoding.com'),
          ),
          ListTile(
            leading: Icon(Icons.movie),
            title: Text('Movies'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, MovieHomePage.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.live_tv_rounded),
            title: Text('TV Shows'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, TvHomePage.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.save_alt),
            title: Text('Watchlist Movie'),
            onTap: () {
              Navigator.pushNamed(context, WatchlistMoviesPage.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.save_alt),
            title: Text('Watchlist Tv'),
            onTap: () {
              Navigator.pushNamed(context, TvsWatchlistPage.routeName);
            },
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, AboutPage.routeName);
            },
            leading: Icon(Icons.info_outline),
            title: Text('About'),
          ),
        ],
      ),
    );
  }
}
