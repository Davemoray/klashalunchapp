import 'package:get/get.dart';
import 'package:klashalunchapp/model/ingredient_model.dart';
import 'package:klashalunchapp/service/retrofit_instance.dart';

class IngredientController extends GetxController {
  var ingredient = <IngredientModel>[].obs;

  Future<List<IngredientModel>> fetchIngredients() async {
    try {
      final ingredientList = await RetrofitClientInstance.getInstance().getDataService()?.getIngredients();
      ingredient.value = ingredientList!;
      print ("the list returned: ingredient");
      return ingredient;

    } catch (e) {
      print("Error fetching ingredients: $e");
      return [];
    }
  }
}
