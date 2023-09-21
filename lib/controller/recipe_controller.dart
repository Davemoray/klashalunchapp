import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:klashalunchapp/model/ingredient_model.dart';
import 'package:klashalunchapp/model/recipe_model.dart';

import '../service/retrofit_instance.dart';

class RecipeController extends GetxController {
  final recipe = <RecipeModel>[].obs;

  Future<List<RecipeModel>> fetchRecipes() async {
    try {
      final recipeList = await RetrofitClientInstance.getInstance().getDataService()?.getReceipes();
      recipe.value = recipeList!;
      print ("the list returned: ingredient");
      return recipe;

    } catch (e) {
      print("Error fetching ingredients: $e");
      return [];
    }
  }

}