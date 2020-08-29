import 'package:comunica_mobile/icons/custom_icons_icons.dart';
import 'package:flutter/material.dart';

class CardComment extends StatelessWidget {
  String textBig = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur condimentum sapien quam, interdum' +
      'interdum lacus egestas ac. Maecenas arcu odio, maximus at fringilla sit amet, ' +
      'interdum lacus egestas ac. Maecenas arcu odio, maximus at fringilla sit amet, ' +
      'interdum lacus egestas ac. Maecenas arcu odio, maximus at fringilla sit amet, ' +
      'interdum lacus egestas ac. Maecenas arcu odio, maximus at fringilla sit amet, ' +
      'interdum lacus egestas ac. Maecenas arcu odio, maximus at fringilla sit amet, ' +
      'interdum lacus egestas ac. Maecenas arcu odio, maximus at fringilla sit amet, ' +
      'interdum lacus egestas ac. Maecenas arcu odio, maximus at fringilla sit amet, ' +
      'interdum lacus egestas ac. Maecenas arcu odio, maximus at fringilla sit amet, ' +
      'interdum lacus egestas ac. Maecenas arcu odio, maximus at fringilla sit amet, ';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.60,
      // color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Nome de Usuário",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              )
            ],
          ),
          Flexible(
            flex: 9,
                      child: Row(
              children: [
                // Espaço em Branco
                Flexible(
                  flex: 1,
                  child: Container(),
                ),
                // Texto e Botoões
                Flexible(
                  flex: 6,
                  child: SingleChildScrollView(
                          child: Text(
                            textBig,
                            maxLines: 100000,
                            // overflow: TextOverflow.ellipsis,
                          ),
                        ),
                )
              ],
            ),
          ),
          Row(
            children: [
              Flexible(
                child: Container(),
                flex: 1,
              ),
              Flexible(
                flex: 6,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '20',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(20, 0, 0, 15),
                                  child: Icon(
                                    CustomIcons.thumb_up,
                                    size: 40,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '1',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
                                  child: Icon(
                                    CustomIcons.thumb_down,
                                    size: 40,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
