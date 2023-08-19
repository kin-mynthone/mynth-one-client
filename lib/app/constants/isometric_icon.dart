class IsometricIcon {
  static List<String> myIcons = [
    'assets/icons/isometric/banking_isometric.png',
    'assets/icons/isometric/vehicle_isometric.png',
    'assets/icons/isometric/food_isometric.png',
    'assets/icons/isometric/delivery_isometric.png',
    'assets/icons/isometric/grocery_isometric.png',
    'assets/icons/isometric/staycation_isometric.png',
  ];

  static getIcon(name) {
    switch (name) {
      case 'banking':
        return 0;
      case 'vehicle':
        return 1;
      case 'food':
        return 2;
      case 'delivery':
        return 3;
      case 'grocery':
        return 4;
      case 'staycation':
        return 5;
    }
  }
}
