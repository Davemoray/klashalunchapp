import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:klashalunchapp/model/ingredient_model.dart';
import 'package:klashalunchapp/model/recipe_model.dart';

class RecipeController extends GetxController {
  final recipe = <RecipeModel>[].obs;

  Future<List<RecipeModel>> fetchRecipes() async {
    try{
      var url = Uri.parse('https://lb7u7svcm5.execute-api.ap-southeast-1.amazonaws.com/dev/ingredients');
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
      });
      if (response.statusCode == 200) {

        final Map<String,dynamic> result =json.decode(response.body);

        final data = RecipeModel.fromJson(result);

        recipe.value = [data];
        return [data];

      }  else { throw Exception("There was an error fetching your data");
      }}catch(e){throw Exception("There was an error fetching your data");}
  }
}