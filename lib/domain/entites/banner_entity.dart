class BannerEntity {
  BannerEntity({
    this.id,
    this.position,
    this.image,
    this.url,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.shipperId,
    this.about,
  });

  String? id;
  String? position;
  String? image;
  String? url;
  bool? active;
  String? createdAt;
  String? updatedAt;
  String? shipperId;
  String? about;
}
