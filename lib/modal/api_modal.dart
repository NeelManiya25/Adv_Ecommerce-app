class FakeStoreData {
  int id;
  String title;
  dynamic price;
  String description;
  String category;
  String image;
  Map rating;

  FakeStoreData({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });
  factory FakeStoreData.fromAPI({required Map map_data}) {
    return FakeStoreData(
        id: map_data['id'],
        title: map_data['title'],
        price: map_data['price'],
        description: map_data['description'],
        category: map_data['category'],
        image: map_data['image'],
        rating: map_data['rating']);
  }
}
