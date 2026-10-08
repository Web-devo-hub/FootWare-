import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesClient {
  SharedPreferencesClient._();

  static SharedPreferencesClient _instance = SharedPreferencesClient._();

  static SharedPreferencesClient get instance => _instance;

  final String cardKey = "card_key";

  Future<List<Map<String, dynamic>>> getCardsInfo() async {
    SharedPreferencesAsync sharedPreferencesAsync = SharedPreferencesAsync();

    List<String>? cardData = await sharedPreferencesAsync.getStringList(
      cardKey,
    );

    if (cardData == null) {
      return [];
    }

    return cardData
        .map((card) => Map<String, dynamic>.from(jsonDecode(card)))
        .toList();
  }

  Future<void> setCardInfo(Map<String, dynamic> cardInfo) async {
    SharedPreferencesAsync sharedPreferencesAsync = SharedPreferencesAsync();

    List<String> cardData =
        await sharedPreferencesAsync.getStringList(cardKey) ?? [];

    var cardsInfoDecoded = cardData
        .map((card) => Map<String, dynamic>.from(jsonDecode(card)))
        .toList();

    bool cardInfoExists = cardsInfoDecoded.any(
      (element) => element["cardNumber"] == cardInfo["cardNumber"],
    );

    if (cardInfoExists) {
      return;
    }

    cardData.add(jsonEncode(cardInfo));

    await sharedPreferencesAsync.setStringList(cardKey, cardData);
  }

  Future<void> deleteCard(Map<String, dynamic> cardData) async {
    SharedPreferencesAsync prefs = SharedPreferencesAsync();

    List<String> cardDataList = await prefs.getStringList(cardKey) ?? [];

    var deleteCardDecode = cardDataList.map((card) => Map<String, dynamic>.from(jsonDecode(card)))
        .toList();


    int indexNumber = deleteCardDecode.indexWhere(
      (element) => element["cardNumber"] == cardData["cardNumber"],
    );

    if(indexNumber != -1){
      cardDataList.removeAt(indexNumber);

    }
    else{
      return;
    }
    await prefs.setStringList(cardKey, cardDataList);
  }
}
