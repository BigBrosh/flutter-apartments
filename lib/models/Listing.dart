class ListingModel {
  final int bathroomNumber;
  final int commission;
  final int constructionYear;
  final String dataSourceName;
  final String keywords;
  final double latitude;
  final String listerUrl;
  final double longitude;
  final String priceFormatted;
  final String summary;
  final String title;
  final String thumbUrl;
  final String imgUrl;

  ListingModel.fromJson(Map<String, dynamic> json)
      : bathroomNumber = int.tryParse(json["bathroom_number"]),
        commission = json["commission"],
        constructionYear = json["construction_year"],
        dataSourceName = json["datasource_name"],
        keywords = json["keywords"],
        latitude = json["latitude"],
        listerUrl = json["lister_url"],
        longitude = json["longitude"],
        priceFormatted = json["price_formatted"],
        summary = json["summary"],
        title = json["title"],
        thumbUrl = json["thumb_url"],
        imgUrl = json["img_url"];
}