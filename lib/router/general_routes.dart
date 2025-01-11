class RoutesData {
  final String name;
  final String path;

  const RoutesData({required this.name, required this.path});
}

enum HomeRoute {
  home(RoutesData(name: 'home', path: '/home'));

  final RoutesData data;

  const HomeRoute(this.data);
}