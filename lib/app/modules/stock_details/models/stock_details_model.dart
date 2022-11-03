import 'dart:convert';

TicketEodDetail ticketEodDetailFromJson(String str) =>
    TicketEodDetail.fromJson(json.decode(str));

String ticketEodDetailToJson(TicketEodDetail data) =>
    json.encode(data.toJson());

class TicketEodDetail {
  TicketEodDetail({
    required this.pagination,
    required this.data,
  });

  final Pagination? pagination;
  final List<Datumu>? data;

  factory TicketEodDetail.fromJson(Map<String, dynamic> json) =>
      TicketEodDetail(
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
        data: json["data"] == null
            ? null
            : List<Datumu>.from(json["data"].map((x) => Datumu.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination == null ? null : pagination!.toJson(),
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datumu {
  Datumu({
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.volume,
    required this.adjHigh,
    required this.adjLow,
    required this.adjClose,
    required this.adjOpen,
    required this.adjVolume,
    required this.splitFactor,
    required this.dividend,
    required this.symbol,
    required this.exchange,
    required this.date,
  });

  final double? open;
  final double? high;
  final double? low;
  final double? close;
  final double? volume;
  final double? adjHigh;
  final double? adjLow;
  final double? adjClose;
  final double? adjOpen;
  final double? adjVolume;
  final double? splitFactor;
  final double? dividend;
  final Symbol? symbol;
  final Exchange? exchange;
  final String? date;

  factory Datumu.fromJson(Map<String, dynamic> json) => Datumu(
        open: json["open"] == null ? null : json["open"].toDouble(),
        high: json["high"] == null ? null : json["high"].toDouble(),
        low: json["low"] == null ? null : json["low"].toDouble(),
        close: json["close"] == null ? null : json["close"].toDouble(),
        volume: json["volume"],
        adjHigh: json["adj_high"] == null ? null : json["adj_high"].toDouble(),
        adjLow: json["adj_low"] == null ? null : json["adj_low"].toDouble(),
        adjClose:
            json["adj_close"] == null ? null : json["adj_close"].toDouble(),
        adjOpen: json["adj_open"] == null ? null : json["adj_open"].toDouble(),
        adjVolume: json["adj_volume"],
        splitFactor: json["split_factor"],
        dividend: json["dividend"],
        symbol:
            json["symbol"] == null ? null : symbolValues.map[json["symbol"]],
        exchange: json["exchange"] == null
            ? null
            : exchangeValues.map[json["exchange"]],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "open": open,
        "high": high,
        "low": low,
        "close": close,
        "volume": volume,
        "adj_high": adjHigh,
        "adj_low": adjLow,
        "adj_close": adjClose,
        "adj_open": adjOpen,
        "adj_volume": adjVolume,
        "split_factor": splitFactor,
        "dividend": dividend,
        "symbol": symbol == null ? null : symbolValues.reverse[symbol],
        "exchange": exchange == null ? null : exchangeValues.reverse[exchange],
        "date": date,
      };
}

enum Exchange { XNAS }

final exchangeValues = EnumValues({"XNAS": Exchange.XNAS});

enum Symbol { MSFT }

final symbolValues = EnumValues({"MSFT": Symbol.MSFT});

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
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
