import 'package:flutter/material.dart';
import '../model/ingredient_model.dart';

class FridgeItems extends StatelessWidget {
  const FridgeItems({
    super.key,
    required this.ingredient,
  });

  final IngredientModel ingredient;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: const Border(
              bottom: BorderSide(color: Color(0xffB2BF71),),
              top: BorderSide(color: Color(0xffB2BF71),),
              right: BorderSide(color: Color(0xffB2BF71),),
              left: BorderSide(color: Color(0xffB2BF71),),
            )),
        child: Column(
          children: [
            Image.asset("assets/images/${ingredient.title}.png",
                height: 100, width: 100, fit: BoxFit.contain),
            Text(
              "title: ${ingredient.title}",
              style: const TextStyle(color: Colors.black,),
            ),
            Text(
              "use-by: ${ingredient.useby}",
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ));
  }
}