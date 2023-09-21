class RecipeModel {
  String title;
  List<String?> ingredients;

  RecipeModel({required this.title, required this.ingredients});

  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
    title: json['title'],
    ingredients : List<String>.from(json['ingredients']),
  );

  Map<String, dynamic> toJson() =>{
      'title': title,
      'ingredients': ingredients,
    };

}