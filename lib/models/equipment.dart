class Equipment {
  int id;
  String name;
  bool isMarked = false;

  Equipment({this.id, this.name, this.isMarked});  

  Equipment copyWith({
    final int id,
    final String name,
    final bool isMarked
  }) {
    return Equipment(
      id: id ?? this.id,
      name: name ?? this.name,
      isMarked: isMarked ?? this.isMarked
    );
  }
}