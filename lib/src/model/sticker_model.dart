class StickerModel {
  final String imageFile;
  final List<String> emojis;

  StickerModel({
    required this.imageFile,
    required this.emojis,
  });

  factory StickerModel.fromMap(Map<String, dynamic> json) {
    return switch (json) {
      {
        'image_file': final String imageFile,
        'emojis': final List emojis,
      } =>
        StickerModel(
          imageFile: imageFile,
          emojis: emojis.cast<String>(),
        ),
      _ => throw Exception('Invalid Json'),
    };
  }
}
