import 'package:flutter/services.dart' as service;
import 'package:sambapos_app/resources/const_strings.dart';
import 'package:yaml/yaml.dart';

class YamlFunctions {
  YamlMap yamlMap;

  Future<void> loadData() async {
    final data = await service.rootBundle.loadString("assets/menu.yaml");
    yamlMap = loadYaml(data);
  }

  String getMainMenuName(int index) {
    return yamlMap[YamlStrings.menu][0][YamlStrings.item][index]
        [YamlStrings.name];
  }

  String getMainMenuCaption(int index) {
    return yamlMap[YamlStrings.menu][0][YamlStrings.item][index]
        [YamlStrings.caption];
  }

  int getMainMenuLength() {
    return yamlMap[YamlStrings.menu][0][YamlStrings.item].length;
  }

  int getSubMenuLength(int i) {
    return yamlMap[YamlStrings.menu][0][YamlStrings.item][i][YamlStrings.item]
        .length;
  }

  String getSubMenuName(int i, int j) {
    return yamlMap[YamlStrings.menu][0][YamlStrings.item][i][YamlStrings.item]
        [j][YamlStrings.name];
  }

  String getSubMenuImage(int i, int j) {
    return yamlMap[YamlStrings.menu][0][YamlStrings.item][i][YamlStrings.item]
        [j][YamlStrings.image];
  }

  String getSubMenuCaption(int i, int j) {
    return yamlMap[YamlStrings.menu][0][YamlStrings.item][i][YamlStrings.item]
        [j][YamlStrings.caption];
  }

  String getSubMenuPrice(int i, int j) {
    return yamlMap[YamlStrings.menu][0][YamlStrings.item][i][YamlStrings.item]
            [j][YamlStrings.price]
        .toString();
  }

  String getMainMenuProductsName(int i, int j) {
    return yamlMap[YamlStrings.menu][0][YamlStrings.item][i][YamlStrings.item]
        [j][YamlStrings.name];
  }

  String getMainMenuProductsPrice(int i, int j) {
    return yamlMap[YamlStrings.menu][0][YamlStrings.item][i][YamlStrings.item]
            [j][YamlStrings.price]
        .toString();
  }

  String getMainMenuProductsSubMenus(int i, int j, int y) {
    if (yamlMap[YamlStrings.menu][0][YamlStrings.item][i][YamlStrings.item][j]
            [YamlStrings.submenu] != null) {
      return yamlMap[YamlStrings.menu][0][YamlStrings.item][i][YamlStrings.item]
          [j][YamlStrings.submenu][y];
    } else {
      return yamlMap[YamlStrings.menu][0][YamlStrings.item][i][YamlStrings.item]
      [y][YamlStrings.name];
    }
  }
  bool checkSubMenus(int i, int j, int y) {
    if (yamlMap[YamlStrings.menu][0][YamlStrings.item][i][YamlStrings.item][j]
            [YamlStrings.submenu] != null) {
      return true;
    } else {
      return false;
    }
  }
  String getMainMenuProductsSubMenusImage(int i, int j, int y) {
    if (yamlMap[YamlStrings.menu][0][YamlStrings.item][i][YamlStrings.item][j]
            [YamlStrings.submenu] != null) {
      return yamlMap[YamlStrings.menu][0][YamlStrings.item][i][YamlStrings.item]
          [j][YamlStrings.submenu][y];
    } else {
      return yamlMap[YamlStrings.menu][0][YamlStrings.item][i][YamlStrings.item]
      [y][YamlStrings.image];
    }
  }

  int getMainMenuProductsSubMenusLength(int i, int j) {
    if (yamlMap[YamlStrings.menu][0][YamlStrings.item][i][YamlStrings.item][j]
            [YamlStrings.submenu] !=
        null) {
      return yamlMap[YamlStrings.menu][0][YamlStrings.item][i][YamlStrings.item]
              [j][YamlStrings.submenu]
          .length;
    } else {
      return yamlMap[YamlStrings.menu][0][YamlStrings.item][i][YamlStrings.item]
          .length;
    }
  }

  String getMainMenuProductsImage(int i, int j) {
    return yamlMap[YamlStrings.menu][0][YamlStrings.item][i][YamlStrings.item]
        [j][YamlStrings.image];
  }

  int getMainMenuProductsLength() {
    return yamlMap[YamlStrings.menu][0][YamlStrings.item][0][YamlStrings.item]
            [0][YamlStrings.submenu]
        .length;
  }

  int getCertainSubMenusLength(String subMenuName) {
    if (subMenuName == yamlMap[YamlStrings.menu][0][YamlStrings.key]) {
      return yamlMap[YamlStrings.menu][0][YamlStrings.item].length;
    } else if (subMenuName == yamlMap[YamlStrings.menu][1][YamlStrings.key]) {
      return yamlMap[YamlStrings.menu][1][YamlStrings.item].length;
    } else if (subMenuName == yamlMap[YamlStrings.menu][2][YamlStrings.key]) {
      return yamlMap[YamlStrings.menu][2][YamlStrings.item].length;
    } else if (subMenuName == yamlMap[YamlStrings.menu][3][YamlStrings.key]) {
      return yamlMap[YamlStrings.menu][3][YamlStrings.item].length;
    } else if (subMenuName == yamlMap[YamlStrings.menu][4][YamlStrings.key]) {
      return yamlMap[YamlStrings.menu][4][YamlStrings.item].length;
    } else if (subMenuName == yamlMap[YamlStrings.menu][5][YamlStrings.key]) {
      return yamlMap[YamlStrings.menu][5][YamlStrings.item].length;
    } else if (subMenuName == yamlMap[YamlStrings.menu][6][YamlStrings.key]) {
      return yamlMap[YamlStrings.menu][6][YamlStrings.item].length;
    } else if (subMenuName == yamlMap[YamlStrings.menu][7][YamlStrings.key]) {
      return yamlMap[YamlStrings.menu][7][YamlStrings.item].length;
    } else if (subMenuName == yamlMap[YamlStrings.menu][8][YamlStrings.key]) {
      return yamlMap[YamlStrings.menu][8][YamlStrings.item].length;
    } else if (subMenuName == yamlMap[YamlStrings.menu][9][YamlStrings.key]) {
      return yamlMap[YamlStrings.menu][9][YamlStrings.item].length;
    } else if (subMenuName == yamlMap[YamlStrings.menu][10][YamlStrings.key]) {
      return yamlMap[YamlStrings.menu][10][YamlStrings.item].length;
    } else
      return 0;
  }

  String getCertainSubMenusName(String subMenuName, int i) {
    if (subMenuName == yamlMap[YamlStrings.menu][0][YamlStrings.key]) {
      return yamlMap[YamlStrings.menu][0][YamlStrings.item][i][YamlStrings.name];
    } else if (subMenuName == yamlMap[YamlStrings.menu][1][YamlStrings.key]) {
      return yamlMap[YamlStrings.menu][1][YamlStrings.item][i]
          [YamlStrings.name];
    } else if (subMenuName == yamlMap[YamlStrings.menu][2][YamlStrings.key]) {
      return yamlMap[YamlStrings.menu][2][YamlStrings.item][i]
          [YamlStrings.name];
    } else if (subMenuName == yamlMap[YamlStrings.menu][3][YamlStrings.key]) {
      return yamlMap[YamlStrings.menu][3][YamlStrings.item][i]
          [YamlStrings.name];
    } else if (subMenuName == yamlMap[YamlStrings.menu][4][YamlStrings.key]) {
      return yamlMap[YamlStrings.menu][4][YamlStrings.item][i]
          [YamlStrings.name];
    } else if (subMenuName == yamlMap[YamlStrings.menu][5][YamlStrings.key]) {
      return yamlMap[YamlStrings.menu][5][YamlStrings.item][i]
          [YamlStrings.name];
    } else if (subMenuName == yamlMap[YamlStrings.menu][6][YamlStrings.key]) {
      return yamlMap[YamlStrings.menu][6][YamlStrings.item][i]
          [YamlStrings.name];
    } else if (subMenuName == yamlMap[YamlStrings.menu][7][YamlStrings.key]) {
      return yamlMap[YamlStrings.menu][7][YamlStrings.item][i]
          [YamlStrings.name];
    } else if (subMenuName == yamlMap[YamlStrings.menu][8][YamlStrings.key]) {
      return yamlMap[YamlStrings.menu][8][YamlStrings.item][i]
          [YamlStrings.name];
    } else if (subMenuName == yamlMap[YamlStrings.menu][9][YamlStrings.key]) {
      return yamlMap[YamlStrings.menu][9][YamlStrings.item][i]
          [YamlStrings.name];
    } else if (subMenuName == yamlMap[YamlStrings.menu][10][YamlStrings.key]) {
      return yamlMap[YamlStrings.menu][10][YamlStrings.item][i]
          [YamlStrings.name];
    } else
      return 'No such menu';
  }

  String getCertainSubMenusImage(String subMenuName, int i) {
    if (subMenuName == yamlMap[YamlStrings.menu][0][YamlStrings.key]) {
      return yamlMap[YamlStrings.menu][0][YamlStrings.item][i][YamlStrings.image];
    } else if (subMenuName == yamlMap[YamlStrings.menu][1][YamlStrings.key]) {
      return yamlMap[YamlStrings.menu][1][YamlStrings.item][i][YamlStrings.image];
    } else if (subMenuName == yamlMap[YamlStrings.menu][2][YamlStrings.key]) {
      return yamlMap[YamlStrings.menu][2][YamlStrings.item][i][YamlStrings.image];
    } else if (subMenuName == yamlMap[YamlStrings.menu][3][YamlStrings.key]) {
      return yamlMap[YamlStrings.menu][3][YamlStrings.item][i][YamlStrings.image];
    } else if (subMenuName == yamlMap[YamlStrings.menu][4][YamlStrings.key]) {
      return yamlMap[YamlStrings.menu][4][YamlStrings.item][i][YamlStrings.image];
    } else if (subMenuName == yamlMap[YamlStrings.menu][5][YamlStrings.key]) {
      return yamlMap[YamlStrings.menu][5][YamlStrings.item][i][YamlStrings.image];
    } else if (subMenuName == yamlMap[YamlStrings.menu][6][YamlStrings.key]) {
      return yamlMap[YamlStrings.menu][6][YamlStrings.item][i][YamlStrings.image];
    } else if (subMenuName == yamlMap[YamlStrings.menu][7][YamlStrings.key]) {
      return yamlMap[YamlStrings.menu][7][YamlStrings.item][i][YamlStrings.image];
    } else if (subMenuName == yamlMap[YamlStrings.menu][8][YamlStrings.key]) {
      return yamlMap[YamlStrings.menu][8][YamlStrings.item][i][YamlStrings.image];
    } else if (subMenuName == yamlMap[YamlStrings.menu][9][YamlStrings.key]) {
      return yamlMap[YamlStrings.menu][9][YamlStrings.item][i][YamlStrings.image];
    } else if (subMenuName == yamlMap[YamlStrings.menu][10][YamlStrings.key]) {
      return yamlMap[YamlStrings.menu][10][YamlStrings.item][i][YamlStrings.image];
    } else
      return 'No such menu';
  }

  String getCertainSubMenusPrice(String subMenuName) {
    if (subMenuName == yamlMap[YamlStrings.menu][0][YamlStrings.key]) {
      return yamlMap[YamlStrings.menu][0][YamlStrings.item][YamlStrings.price]
          .toString();
    } else if (subMenuName == yamlMap[YamlStrings.menu][1][YamlStrings.key]) {
      return yamlMap[YamlStrings.menu][1][YamlStrings.item][YamlStrings.price]
          .toString();
    } else if (subMenuName == yamlMap[YamlStrings.menu][2][YamlStrings.key]) {
      return yamlMap[YamlStrings.menu][2][YamlStrings.item][YamlStrings.price]
          .toString();
    } else if (subMenuName == yamlMap[YamlStrings.menu][3][YamlStrings.key]) {
      return yamlMap[YamlStrings.menu][3][YamlStrings.item][YamlStrings.price]
          .toString();
    } else if (subMenuName == yamlMap[YamlStrings.menu][4][YamlStrings.key]) {
      return yamlMap[YamlStrings.menu][4][YamlStrings.item][YamlStrings.name];
    } else if (subMenuName == yamlMap[YamlStrings.menu][5][YamlStrings.key]) {
      return yamlMap[YamlStrings.menu][5][YamlStrings.item][YamlStrings.price]
          .toString();
    } else if (subMenuName == yamlMap[YamlStrings.menu][6][YamlStrings.key]) {
      return yamlMap[YamlStrings.menu][6][YamlStrings.item][YamlStrings.price]
          .toString();
    } else if (subMenuName == yamlMap[YamlStrings.menu][7][YamlStrings.key]) {
      return yamlMap[YamlStrings.menu][7][YamlStrings.item][YamlStrings.price]
          .toString();
    } else if (subMenuName == yamlMap[YamlStrings.menu][8][YamlStrings.key]) {
      return yamlMap[YamlStrings.menu][8][YamlStrings.item][YamlStrings.price]
          .toString();
    } else if (subMenuName == yamlMap[YamlStrings.menu][9][YamlStrings.key]) {
      return yamlMap[YamlStrings.menu][9][YamlStrings.item][YamlStrings.price]
          .toString();
    } else if (subMenuName == yamlMap[YamlStrings.menu][10][YamlStrings.key]) {
      return yamlMap[YamlStrings.menu][10][YamlStrings.item][YamlStrings.price]
          .toString();
    } else
      return 'No such menu';
  }
}
