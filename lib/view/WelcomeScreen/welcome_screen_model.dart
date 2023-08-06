class WelcomeScreenModel {
  final String title;
  final String imageUrl;

  WelcomeScreenModel(this.title, this.imageUrl);

  String get imageWithPath => 'assets/images/$imageUrl.png';
}

class WelcomeScreenModels {
  static final List<WelcomeScreenModel> welcomeScreenItems = [
    WelcomeScreenModel('Empowering Artisans,\nFarmers & Micro Business', 'welcomescreen1'),
    WelcomeScreenModel('Connecting NGOs, Social\nEnterprises with Communities', 'welcomescreen2'),
    WelcomeScreenModel('Donate, Invest & Support\ninfrastructure projects', 'welcomescreen3'),
  ];
}
