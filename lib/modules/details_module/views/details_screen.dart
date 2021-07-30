import 'package:flutter/material.dart';
import 'package:sambapos_app/resources/items_card.dart';
import 'package:sambapos_app/yaml_data/yaml_functions.dart';

class DetailsPage extends StatefulWidget {
  final int mainIndex, secIndex;

  DetailsPage(this.mainIndex, this.secIndex);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool isLoading = true;
  bool hasSubMenu = false;
  final yamlFunctions = YamlFunctions();

  @override
  void initState() {
    super.initState();
    yamlFunctions.loadData().then((_) {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.secIndex);
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(title: Text('Sub Menu Details')),
      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : RawScrollbar(
        thumbColor: Colors.white70.withOpacity(1),
        child: GridView.count(
          childAspectRatio: 0.7,
          crossAxisCount: 1,
          children: [
            ListView.builder(
              itemCount: yamlFunctions.getMainMenuProductsSubMenusLength(
                  widget.mainIndex, widget.secIndex),
              itemBuilder: (BuildContext context, int mainIndex) {
                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                yamlFunctions.getMainMenuProductsSubMenus(
                                    widget.mainIndex,
                                    widget.secIndex,
                                    mainIndex),
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      '${yamlFunctions.getMainMenuProductsPrice(
                                          widget.mainIndex, mainIndex)} ₺',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                          Container(
                              height: 200,
                              child: yamlFunctions.checkSubMenus(
                                  widget.mainIndex,
                                  widget.secIndex,
                                  mainIndex) == true ? ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: yamlFunctions
                                      .getCertainSubMenusLength(
                                    yamlFunctions
                                        .getMainMenuProductsSubMenus(
                                        widget.mainIndex,
                                        widget.secIndex,
                                        mainIndex),
                                  ),
                                  itemBuilder: (BuildContext c, int index) {
                                    return ItemsCard(
                                        yamlFunctions.getCertainSubMenusName(
                                            yamlFunctions
                                                .getMainMenuProductsSubMenus(
                                                widget.mainIndex,
                                                widget.secIndex,
                                                mainIndex),
                                            index),
                                        yamlFunctions
                                            .getMainMenuProductsPrice(
                                            widget.mainIndex, index),
                                        yamlFunctions
                                            .getCertainSubMenusImage(
                                            yamlFunctions
                                                .getMainMenuProductsSubMenus(
                                                widget.mainIndex,
                                                widget.secIndex,
                                                mainIndex),
                                            index),
                                            () {});
                                  })
                                  : ItemsCard(
                                  '',
                                  '',
                                  yamlFunctions.getMainMenuProductsImage(
                                      widget.mainIndex, mainIndex),
                                      () {}),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}