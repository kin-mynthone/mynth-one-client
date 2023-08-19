class CardIcon {
  static List<String> myIcons = [
    'assets/icons/card_icons/netflix.png',
    'assets/icons/card_icons/steam.png',
    'assets/icons/card_icons/savings.png',
    'assets/icons/card_icons/spotify.png',
  ];

  static getIcon(name) {
    switch (name) {
      case 'netflix':
        return 0;
      case 'steam':
        return 1;
      case 'savings':
        return 2;
      case 'spotify':
    }
  }

  static getIconName(index) {
    switch (index) {
      case 'netflix':
        return 0;
      case 'steam':
        return 1;
      case 'savings':
        return 2;
      case 'spotify':
    }
  }
}
