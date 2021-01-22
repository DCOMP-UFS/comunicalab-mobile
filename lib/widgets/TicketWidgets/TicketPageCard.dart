import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Define o estilo do cartão de cada informação do chamado

class TicketPageCard extends StatelessWidget {
  final BuildContext context;
  final String mainTitle;
  final String cardTitle;
  final Widget subCard;
  final double width;
  final double height;
  final int mainTitleFlex;
  final int subCardFlex;

  const TicketPageCard({
    @required this.context,
    @required this.mainTitle,
    this.cardTitle,
    this.subCard,
    this.width,
    this.height,
    this.mainTitleFlex,
    this.subCardFlex,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 5.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFFE0F6FF),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              flex: mainTitleFlex ?? 2,
              child: Container(
                margin: EdgeInsets.only(top: 5.0),
                child: Text(
                  mainTitle ?? 'Título',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: subCardFlex ?? 3,
              child: Card(
                elevation: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Container(
                  //height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: Colors.black,
                        width: 0.5,
                      )),
                  child: Center(
                    child: subCard ??
                        Text(
                          cardTitle ?? 'Descrição',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
