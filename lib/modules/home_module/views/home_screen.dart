import 'package:flutter/material.dart';
import 'package:sambapos_app/modules/details_module/views/details_screen.dart';
import 'package:sambapos_app/resources/const_strings.dart';
import 'package:sambapos_app/resources/items_card.dart';
import 'package:yaml/yaml.dart';
import 'package:flutter/services.dart' as service;
import 'package:sambapos_app/yaml_data/yaml_functions.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //YamlMap yamlMap;
  bool isLoading = true;
  int mainMenuLength;
  final yamlFunctions = YamlFunctions();

  @override
  void initState() {
    super.initState();
    yamlFunctions.loadData().then((_){
      setState(() {
        isLoading = false;
      });
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text('Menus'),
      ),
      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : RawScrollbar(
              thumbColor: Colors.white70.withOpacity(1),
              child: GridView.count(
                childAspectRatio: 0.7,
                crossAxisCount: 1,
                children: [
                  ListView.builder(
                    itemCount: yamlFunctions.getMainMenuLength(),
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
                                      yamlFunctions.getMainMenuName(mainIndex),
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),

                                Container(
                                  height: 200,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: yamlFunctions
                                          .getSubMenuLength(mainIndex),
                                      itemBuilder: (BuildContext c, int index) {
                                        return ItemsCard(
                                            yamlFunctions.getSubMenuName(
                                                mainIndex, index),
                                            '${yamlFunctions.getSubMenuPrice(
                                                mainIndex, index)} ₺' ?? '',
                                            yamlFunctions.getSubMenuImage(
                                                mainIndex, index),
                                                (){
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => DetailsPage(mainIndex,index)),
                                                  );
                                                });
                                      }),
                                )
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
