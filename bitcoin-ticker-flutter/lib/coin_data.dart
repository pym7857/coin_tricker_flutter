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
  'BTC', // 비트코인
  'ETH', // 이더리움
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '34B4332C-4380-44D4-A81B-755FEE4BD61B';

class CoinData {
  //3. Create the Asynchronous method getCoinData() that returns a Future (the price data).
  Future getCoinData() async {
    //4. Create a url combining the coinAPIURL with the currencies we're interested, BTC to USD.
    String requestURL = '$coinAPIURL/BTC/USD?apikey=$apiKey';
    //5. Make a GET request to the URL and wait for the response.
    http.Response response = await http.get(requestURL);

    //6. Check that the request was successful.
    if (response.statusCode == 200) {
      //7. Use the 'dart:convert' package to decode the JSON data that comes back from coinapi.io.
      var decodedData = jsonDecode(response.body);
      //8. Get the last price of bitcoin with the key 'last'.
      var lastPrice = decodedData['rate']; // 마지막 문항이 rate 였음.
      //9. Output the lastPrice from the method.
      return lastPrice;
    } else {
      //10. Handle any errors that occur during the request.
      print(response.statusCode);
      //Optional: throw an error if our request fails.
      throw 'Problem with the get request';
    }
  }
}
