import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:stock_app/models/stockModel.dart';
import 'package:get/get.dart';

class StockController extends GetxController {
  var notFound = false.obs;
  var isLoading = false.obs;
  var isEmpty = false.obs;
  var data = StockModel().obs;
  void getData(String symbol) async {
    try {
      isEmpty(false);
      notFound(false);
      isLoading(true);
      if (symbol.isEmpty) {
        isEmpty(true);
        return;
      }

      const IP_SERVER = '192.168.0.9';
      var response = await http
          .get('https://rapidstocks.herokuapp.com/getData?company=$symbol');
      if (response.statusCode == 200) {
        data.value = stockModelFromJson(response.body);

        if (data.value.globalQuote.the01Symbol == null) {
          notFound(true);
        }

        print(data.value.globalQuote.the01Symbol);
      } else {
        print(response.body);
      }
    } catch (error) {
      print(error);
    } finally {
      isLoading(false);
    }
  }
}
