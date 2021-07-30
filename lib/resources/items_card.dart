import 'package:flutter/material.dart';

class ItemsCard extends StatelessWidget {
  final String _cardTitle, _cardDesc, _cardImage;
  final VoidCallback _onClicked;

  ItemsCard(this._cardTitle, this._cardDesc, this._cardImage,this._onClicked);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onClicked(),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Stack(
          fit: StackFit.loose,
          children: [
            Opacity(
              opacity: 0.8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(_cardImage),
              ),
            ),
            //SizedBox( child: Placeholder()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      _cardTitle,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      _cardDesc,
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
