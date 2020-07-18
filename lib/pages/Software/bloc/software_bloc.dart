import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:comunica_mobile/models/software_list.dart';

class SoftwareBloc {

  bool isCheckBox = false;

  final StreamController<bool> _softwareController = StreamController<bool>();
  Stream get checkBox => _softwareController.stream;

  dispose(){
    _softwareController.close();
  }

}