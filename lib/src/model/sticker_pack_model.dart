import 'package:app_animesticker/src/model/sticker_model.dart';

class StickerPackModel {
  final String identifier;
  final String name;
  final String publisher;
  final String trayImageFile;
  final String publisherEmail;
  final String publisherWebsite;
  final String privacyPolicyWebsite;
  final String licenseAgreementWebsite;
  final bool? animatedStickerPack;
  final List<StickerModel> stickers;

  StickerPackModel({
    required this.identifier,
    required this.name,
    required this.publisher,
    required this.trayImageFile,
    required this.publisherEmail,
    required this.publisherWebsite,
    required this.privacyPolicyWebsite,
    required this.licenseAgreementWebsite,
    this.animatedStickerPack = false,
    required this.stickers,
  });

  factory StickerPackModel.fromMap(Map<String, dynamic> json) {
    return switch (json) {
      {
        'identifier': final String identifier,
        'name': final String name,
        'publisher': final String publisher,
        'tray_image_file': final String trayImageFile,
        'publisher_email': final String publisherEmail,
        'publisher_website': final String publisherWebsite,
        'privacy_policy_website': final String privacyPolicyWebsite,
        'license_agreement_website': final String licenseAgreementWebsite,
        'stickers': final List stickers,
      } =>
        StickerPackModel(
          identifier: identifier,
          name: name,
          publisher: publisher,
          trayImageFile: trayImageFile,
          publisherEmail: publisherEmail,
          publisherWebsite: publisherWebsite,
          privacyPolicyWebsite: privacyPolicyWebsite,
          licenseAgreementWebsite: licenseAgreementWebsite,
          stickers: List<StickerModel>.from(
            stickers.map((e) => StickerModel.fromMap(e)).toList(),
          ),
        ),
      _ => throw Exception('Invalid Json'),
    };
  }
}
