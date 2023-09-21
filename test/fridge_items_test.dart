import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:klashalunchapp/components/fridge_items.dart';
import 'package:klashalunchapp/model/ingredient_model.dart';

void main() {
  testWidgets('FridgeItems widget test', (WidgetTester tester) async {
    // Creating a mock of IngredientModel
    final ingredient = IngredientModel(
      title: 'Ham',
      useby: '2020-11-30',
    );

    // Build our widget and trigger a frame
    await tester.pumpWidget(
      MaterialApp(
        home: FridgeItems(ingredient: ingredient),
      ),
    );

    // Verifying that the image is displayed
    expect(find.byType(Image), findsOneWidget);

    // Verifying that the title and use-by text are displayed
    expect(find.text('title: ${ingredient.title}'), findsOneWidget);
    expect(find.text('use-by: ${ingredient.useby}'), findsOneWidget);


  });
}
