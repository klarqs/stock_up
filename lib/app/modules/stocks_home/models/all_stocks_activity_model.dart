import 'dart:convert';

TicketAssetModel ticketAssetModelFromJson(String str) =>
    TicketAssetModel.fromJson(json.decode(str));

String ticketAssetModelToJson(TicketAssetModel data) =>
    json.encode(data.toJson());

class TicketAssetModel {
  TicketAssetModel({
    required this.pagination,
    required this.data,
  });

  final Pagination? pagination;
  final List<Datum>? data;

  factory TicketAssetModel.fromJson(Map<String, dynamic> json) =>
      TicketAssetModel(
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination == null ? null : pagination!.toJson(),
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.name,
    required this.symbol,
    required this.hasIntraday,
    required this.hasEod,
    required this.country,
    required this.stockExchange,
  });

  final String name;
  final String symbol;
  final bool hasIntraday;
  final bool hasEod;
  final dynamic country;
  final StockExchange? stockExchange;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        symbol: json["symbol"],
        hasIntraday: json["has_intraday"],
        hasEod: json["has_eod"],
        country: json["country"],
        stockExchange: json["stock_exchange"] == null
            ? null
            : StockExchange.fromJson(json["stock_exchange"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "symbol": symbol,
        "has_intraday": hasIntraday,
        "has_eod": hasEod,
        "country": country,
        "stock_exchange":
            stockExchange == null ? null : stockExchange!.toJson(),
      };
}

class StockExchange {
  StockExchange({
    required this.name,
    required this.acronym,
    required this.mic,
    required this.country,
    required this.countryCode,
    required this.city,
    required this.website,
  });

  final Name? name;
  final Acronym? acronym;
  final Mic? mic;
  final Country? country;
  final CountryCode? countryCode;
  final City? city;
  final Website? website;

  factory StockExchange.fromJson(Map<String, dynamic> json) => StockExchange(
        name: json["name"] == null ? null : nameValues.map[json["name"]],
        acronym:
            json["acronym"] == null ? null : acronymValues.map[json["acronym"]],
        mic: json["mic"] == null ? null : micValues.map[json["mic"]],
        country:
            json["country"] == null ? null : countryValues.map[json["country"]],
        countryCode: json["country_code"] == null
            ? null
            : countryCodeValues.map[json["country_code"]],
        city: json["city"] == null ? null : cityValues.map[json["city"]],
        website:
            json["website"] == null ? null : websiteValues.map[json["website"]],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : nameValues.reverse[name],
        "acronym": acronym == null ? null : acronymValues.reverse[acronym],
        "mic": mic == null ? null : micValues.reverse[mic],
        "country": country == null ? null : countryValues.reverse[country],
        "country_code":
            countryCode == null ? null : countryCodeValues.reverse[countryCode],
        "city": city == null ? null : cityValues.reverse[city],
        "website": website == null ? null : websiteValues.reverse[website],
      };
}

enum Acronym { NASDAQ, NYSE }

final acronymValues =
    EnumValues({"NASDAQ": Acronym.NASDAQ, "NYSE": Acronym.NYSE});

enum City { NEW_YORK }

final cityValues = EnumValues({"New York": City.NEW_YORK});

enum Country { USA }

final countryValues = EnumValues({"USA": Country.USA});

enum CountryCode { US }

final countryCodeValues = EnumValues({"US": CountryCode.US});

enum Mic { XNAS, XNYS }

final micValues = EnumValues({"XNAS": Mic.XNAS, "XNYS": Mic.XNYS});

enum Name { NASDAQ_STOCK_EXCHANGE, NEW_YORK_STOCK_EXCHANGE }

final nameValues = EnumValues({
  "NASDAQ Stock Exchange": Name.NASDAQ_STOCK_EXCHANGE,
  "New York Stock Exchange": Name.NEW_YORK_STOCK_EXCHANGE
});

enum Website { WWW_NASDAQ_COM, WWW_NYSE_COM }

final websiteValues = EnumValues({
  "www.nasdaq.com": Website.WWW_NASDAQ_COM,
  "www.nyse.com": Website.WWW_NYSE_COM
});

class Pagination {
  Pagination({
    required this.limit,
    required this.offset,
    required this.count,
    required this.total,
  });

  final int limit;
  final int offset;
  final int count;
  final int total;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        limit: json["limit"],
        offset: json["offset"],
        count: json["count"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "limit": limit,
        "offset": offset,
        "count": count,
        "total": total,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap;
    return reverseMap!;
  }
}
