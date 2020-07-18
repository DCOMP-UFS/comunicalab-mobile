class SoftwareModel implements Comparable<SoftwareModel>{

  int _id;
  String _name;
  String _version;
  String _license;
  bool _is_actived;
  bool _is_deleted;

  int get id => _id;
  String get name => _name;
  String get version => _version;
  String get license => _license;
  bool get is_actived => _is_actived;
  bool get is_deleted => _is_deleted;

  SoftwareModel(this._id, this._name, this._version, this._license, this._is_actived, this._is_deleted);

  @override
  int compareTo(SoftwareModel other) {
    // TODO: implement compareTo
    throw UnimplementedError();
  }

}