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

enum MyProfileRoute {
  init(RoutesData(name: 'init', path: '/init')),
  age(RoutesData(name: 'age', path: '/age')),
  name(RoutesData(name: 'name', path: '/name')),
  signIn(RoutesData(name: 'sign_in', path: '/sign_in')),
  signUp(RoutesData(name: 'sign_up', path: '/sign_up')),
  gender(RoutesData(name: 'gender', path: '/gender')),
  my_profile(RoutesData(name: 'my_profile', path: '/my_profile')),
  security(RoutesData(name: 'security', path: '/security')),
  account(RoutesData(name: 'account', path: '/account')),
  change_password(RoutesData(name: 'change_password', path: '/change_password')),
  allDone(RoutesData(name: 'all_done', path: '/all_done'));

  final RoutesData data;

  const MyProfileRoute(this.data);
}
