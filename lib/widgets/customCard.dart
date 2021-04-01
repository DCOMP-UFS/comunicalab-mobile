import 'package:comunica_mobile/icons/custom_icons_icons.dart';
import 'package:comunica_mobile/pages/Images/imagesDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Cartão De Imagem E Software
class CustomCard extends StatelessWidget {
  final String softwareName;
  CustomCard(this.softwareName);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: InkWell(
        splashColor: Color(0xFF2F2FAF),
        highlightColor: Color(0xFF2F2FAF),
        //borderRadius: BorderRadius.circular(5.0),
        onTap: () {},
        child: Container(
          padding: EdgeInsets.fromLTRB(15.0, 15.0, 20.0, 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Text(
                    softwareName,
                    style: TextStyle(
                        fontFamily: 'Poppins-Medium',
                        fontSize: 18.0,
                        color: Color(0xFF000080)),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Color(0xFF000080),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
