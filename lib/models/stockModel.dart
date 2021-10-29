// To parse this JSON data, do
//
//     final stockModel = stockModelFromJson(jsonString);

import 'dart:convert';

StockModel stockModelFromJson(String str) =>
    StockModel.fromJson(json.decode(str));

String stockModelToJson(StockModel data) => json.encode(data.toJson());

class StockModel {
  StockModel({
    this.globalQuote,
  });

  GlobalQuote globalQuote;

  factory StockModel.fromJson(Map<String, dynamic> json) => StockModel(
        globalQuote: GlobalQuote.fromJson(json["Global Quote"]),
      );

  Map<String, dynamic> toJson() => {
        "Global Quote": globalQuote.toJson(),
      };
}

class GlobalQuote {
  String the01Symbol = '0';
  String the02Open = '0';
  String the03High = '0';
  String the04Low = '0';
  String the05Price = '0';
  String the06Volume = '0';
  String the07LatestTradingDay = '0';
  String the08PreviousClose = '0';
  String the09Change = '0';
  String the10ChangePercent = '0';
  GlobalQuote({
    this.the01Symbol,
    this.the02Open,
    this.the03High,
    this.the04Low,
    this.the05Price,
    this.the06Volume,
    this.the07LatestTradingDay,
    this.the08PreviousClose,
    this.the09Change,
    this.the10ChangePercent,
  });

  factory GlobalQuote.fromJson(Map<String, dynamic> json) => GlobalQuote(
        the01Symbol: json["01. symbol"],
        the02Open: json["02. open"],
        the03High: json["03. high"],
        the04Low: json["04. low"],
        the05Price: json["05. price"],
        the06Volume: json["06. volume"],
        the07LatestTradingDay: json["07. latest trading day"],
        the08PreviousClose: json["08. previous close"],
        the09Change: json["09. change"],
        the10ChangePercent: json["10. change percent"],
      );

  Map<String, dynamic> toJson() => {
        "01. symbol": the01Symbol,
        "02. open": the02Open,
        "03. high": the03High,
        "04. low": the04Low,
        "05. price": the05Price,
        "06. volume": the06Volume,
        "07. latest trading day": the07LatestTradingDay,
        "08. previous close": the08PreviousClose,
        "09. change": the09Change,
        "10. change percent": the10ChangePercent,
      };
}
