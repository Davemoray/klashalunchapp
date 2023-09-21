class IngredientModel {
  String title;
  String useby;

  IngredientModel({required this.title, required this.useby});

  IngredientModel.fromJson(Map<String, dynamic> json) :
    title = json['title'],
    useby = json['use-by'];


  Map<String, dynamic> toJson() => {
    'title' : title,
    'use-by' : useby,
  };

}