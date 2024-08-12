abstract class Location {
  final int id;
  final String name;

  Location(this.id, this.name);
}

class Border extends Location {
  Border(super.id, super.name);
}

class Road extends Location {
  Road(super.id, super.name);
}

class Other extends Location {
  final Province province;

  Other(super.id, super.name, this.province);
}

class Province extends Location {
  Province(super.id, super.name);
}
