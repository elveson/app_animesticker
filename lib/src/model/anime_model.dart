class AnimeModel {
  final String id;
  final List<String> names;
  final String fileTrayImage;
  final Map<String, String> description;
  final Map<String, List<String>> genres;

  AnimeModel({
    required this.id,
    required this.names,
    required this.fileTrayImage,
    required this.description,
    required this.genres,
  });

  factory AnimeModel.fromMap(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': final String id,
        'names': final List names,
        'file_tray_image': final String fileTrayImage,
        'description': final Map description,
        'genres': final Map genres,
      } =>
        AnimeModel(
          id: id,
          names: names.cast<String>(),
          fileTrayImage: fileTrayImage,
          description: description.map((key, value) => MapEntry(key, value)),
          genres: genres.map(
            (key, value) => MapEntry(key, (value).cast<String>().toList()),
          ),
        ),
      _ => throw Exception('Invalid Json'),
    };
  }
}
