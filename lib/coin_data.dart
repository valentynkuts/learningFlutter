import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'YOUR-API-KEY-HERE';

class CoinData {
  // Create the Asynchronous method getCoinData() that returns a Future (the price data).
  Future getCoinData(String selectedCurrency) async {
    // Use a for loop here to loop through the cryptoList and request the data
    // for each of them in turn.
    // Return a Map of the results instead of a single value.
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      // Update the URL to use the crypto symbol from the cryptoList
      String requestURL =
          '$coinAPIURL/$crypto/$selectedCurrency?apikey=$apiKey';

      // Make a GET request to the URL and wait for the response.
      http.Response response = await http.get(requestURL);

      // Check that the request was successful.
      if (response.statusCode == 200) {
        // Use the 'dart:convert' package to decode the JSON data that comes back from coinapi.io.
        var decodedData = jsonDecode(response.body);
        // Get the last price of bitcoin with the key 'last'.
        var lastPrice = decodedData['rate'];
        //Create a new key value pair, with the key being the crypto symbol and the value being the lastPrice of that crypto currency.
        cryptoPrices[crypto] = lastPrice.toStringAsFixed(0);
      } else {
        // Handle any errors that occur during the request.
        print(response.statusCode);
        //Optional: throw an error if our request fails.
        throw 'Problem with the get request';
      }
    }

    return cryptoPrices;
  }
}