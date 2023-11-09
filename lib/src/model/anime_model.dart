class AnimeModel {
  final List<String> names;
  final String fileTrayImage;
  final Map<String, String> description;
  final Map<String, List<String>> genes;

  AnimeModel(
      {required this.names,
      required this.fileTrayImage,
      required this.description,
      required this.genes});

  factory AnimeModel.fromMap(Map<String, dynamic> json) {
    return switch (json) {
      {
        'names': final List names,
        'fileTrayImage': final String fileTrayImage,
        'description': final Map<String, String> description,
        'genes': final Map<String, List<String>> genes,
      } =>
        AnimeModel(
          names: names.cast(),
          fileTrayImage: fileTrayImage,
          description: description.cast(),
          genes: genes.cast(),
        ),
      _ => throw Exception('Invalid Json'),
    };
  }
}
