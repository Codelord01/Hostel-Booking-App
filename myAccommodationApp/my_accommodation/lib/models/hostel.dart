class HostelModel {
  final String name;
  final String location;
  final String description;
  final String frontimage;
  final String rating;
  final List<RoomType> roomTypes;

  HostelModel({
    required this.name,
    required this.location,
    required this.description,
    required this.frontimage,
    required this.rating,
    required this.roomTypes,
  });
}

class RoomType {
  final String typeName;
  final List videos;
  final String amount;
  final List specifications;
  final List roomNumbers;

  RoomType({
    required this.typeName,
    required this.videos,
    required this.amount,
    required this.specifications,
    required this.roomNumbers,
  });
}
