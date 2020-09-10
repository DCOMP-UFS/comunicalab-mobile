import 'package:flutter/material.dart';

class ModalCustom extends StatefulWidget {
  String name;
  String category;
  ModalCustom(this.name, this.category);

  @override
  _ModalCustomState createState() => _ModalCustomState();
}

class _ModalCustomState extends State<ModalCustom> {
  MaterialColor customPrimarySwatch = MaterialColor(0xFF000080, <int, Color>{
    50: Color(0xFFEAE3F3),
    100: Color(0xFFC9BBE2),
    200: Color(0xFFa68fcf),
    300: Color(0xFF8262bc),
    400: Color(0xFF6841af),
    500: Color(0xFF4c1fa2),
    600: Color(0xFF431b9d),
    700: Color(0xFF351394),
    800: Color(0xFF260d8d),
    900: Color(0xFF000080),
  });

  var filter = <String, dynamic>{
    "name": null,
    "category": null,
  };
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String teste = '';
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      padding: EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                bottom: 20.0,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Text(
                    'Filtro',
                    style: TextStyle(
                      color: Color(0xFF000080),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkResponse(
                        splashFactory: InkRipple.splashFactory,
                        child: Container(
                          child: Icon(
                            Icons.close,
                            color: Color(0xFF625F5F),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      InkResponse(
                        splashFactory: InkRipple.splashFactory,
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Limpar',
                            style: TextStyle(
                              color: Color(0xFF625F5F),
                              fontSize: 16,
                            ),
                          ),
                        ),
                        onTap: () {
                          print(filter);
                          setState(() {
                            filter.updateAll((key, value) => null);
                            controller.text = "";
                          });
                          print(filter);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              //padding: const EdgeInsets.all(4.0),
              margin: EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 4.0,
              ),
              child: Text(
                'Nome do Equipamento',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            InkWell(
              splashFactory: InkRipple.splashFactory,
              borderRadius: BorderRadius.circular(8.0),
              onTap: () async {},
              child: Center(
                child: Container(
                  width: double.infinity,
                  height: 45,
                  padding: const EdgeInsets.only(left: 10,top: 18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: Color(0xFFE0DFDF),
                      width: 2,
                    ),
                  ),
                  child: TextField(
                    controller: controller,
                    autofocus: false,
                    textAlignVertical: TextAlignVertical.center,
                    style: TextStyle(height: 1.5),
                    decoration: InputDecoration(
                        hintText: filter['name'] == null ? 'Digite o nome do equipamento' : filter['name'],
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none),
                    onChanged: (text) {
                      setState(() {
                        filter["name"] = text;
                      });
                      print(filter);
                    },
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 4.0,
              ),
              child: Text(
                'Categoria',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            InkWell(
              splashFactory: InkRipple.splashFactory,
              borderRadius: BorderRadius.circular(8.0),
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: Color(0xFFE0DFDF),
                    width: 2,
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    icon: Icon(Icons.keyboard_arrow_down),
                    value: filter["category"],
                    hint: Text(
                      'Escolha uma categoria',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black45,
                      ),
                    ),
                    isExpanded: true,
                    onChanged: (String newValue) {
                      setState(() {
                        filter["category"] = newValue;
                      });
                    },
                    items: <String>['Rede', 'Software', 'Hardware', 'OK'].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 4.0,
              ),
              child: SizedBox(
                width: double.infinity,
                child: FlatButton(
                  color: Color(0xFF000080),
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    'Aplicar filtro',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () async {
                    // filter["name"] = controller.text;
                    print(filter);
                    Navigator.pop(context, filter);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
