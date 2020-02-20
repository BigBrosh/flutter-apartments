import 'package:nestoria_appartments/helpers/parse/parseToInt.dart';

class ListingModel {
  final int bathroomNumber;
  final int bedroomNumber;
  final int commission;
  final int constructionYear;
  final String dataSourceName;
  final String keywords;
  final double latitude;
  final double longitude;
  final String listerUrl;
  final String priceFormatted;
  final String summary;
  final String title;
  final String thumbUrl;
  final String imgUrl;
  final int updatedInDays;
  final String updatedInDaysFormatted;

  ListingModel.fromJson(Map<String, dynamic> json)
      : bathroomNumber = parseToInt(json["bathroom_number"]),
        bedroomNumber = parseToInt(json["bedroom_number"]),
        commission = parseToInt(json["commission"]),
        constructionYear = parseToInt(json["construction_year"]),
        dataSourceName = json["datasource_name"],
        keywords = json["keywords"],
        latitude = json["latitude"],
        longitude = json["longitude"],
        listerUrl = json["lister_url"],
        priceFormatted = json["price_formatted"],
        summary = json["summary"],
        title = json["title"],
        thumbUrl = json["thumb_url"],
        updatedInDays = parseToInt(json["updated_in_days"]),
        updatedInDaysFormatted = json["updated_in_days_formatted"],
        imgUrl = json["img_url"];
}