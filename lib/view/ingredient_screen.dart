import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:klashalunchapp/controller/ingredient_controller.dart';
import 'package:klashalunchapp/view/recipe_screen.dart';

import '../components/fridge_items.dart';
import '../model/ingredient_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  IngredientController ingredientController = Get.put(IngredientController());
  TextEditingController useByController = TextEditingController();
  List<IngredientModel> filteredIngredients = [];
  List<IngredientModel> selectedIngredients = [];

  void searchIngredients() {
    final searchText = useByController.text.toString();

    if (searchText.isEmpty) {
      setState(() {
        filteredIngredients = ingredientController.ingredient;
      });
    } else {
      final List<IngredientModel> filtered = ingredientController.ingredient
          .where((ingredient) => ingredient.useby == searchText)
          .toList();
      setState(() {
        filteredIngredients = filtered;
      });
    }
  }

  void selectedIngredient(IngredientModel ingredient) async {
    setState(() {
      if (selectedIngredients.contains(ingredient)) {
        selectedIngredients.remove(ingredient);
      } else {
        selectedIngredients.add(ingredient);
      }
    });
  }

  @override
  void initState() {
    searchIngredients();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffB2BF71),
        title: const Text(
          "Fridge Ingredients",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
            child: Column(
              children: [
                TextField(
                  controller: useByController,
                  cursorColor: Color(0xffB2BF71),
                  keyboardType: TextInputType.datetime,
                  style: const TextStyle(
                    color: Color(0xffB2BF71),
                  ),
                  decoration: InputDecoration(
                    hintText: "Enter use-by Date:",
                    hintStyle: const TextStyle(
                      color: Color(0xffB2BF71),
                    ),
                    prefixIcon: const Icon(Icons.search),
                    prefixIconColor: const Color(0xffB2BF71),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: const BorderSide(
                        color: Color(0xffB2BF71),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: const BorderSide(
                        color: Color(0xffB2BF71),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Center(
                    child: TextButton(
                  onPressed: searchIngredients,
                  child: Container(
                    height: 46,
                    width: 151,
                    decoration: BoxDecoration(
                        border: const Border(
                          bottom: BorderSide(
                            color: Color(0xffB2BF71),
                          ),
                          top: BorderSide(
                            color: Color(0xffB2BF71),
                          ),
                          right: BorderSide(
                            color: Color(0xffB2BF71),
                          ),
                          left: BorderSide(
                            color: Color(0xffB2BF71),
                          ),
                        ),
                        color: const Color(0xFF696A6C),
                        borderRadius: BorderRadius.circular(30.r)),
                    child: Center(
                        child: Text(
                      "Search",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xffB2BF71),
                      ),
                    )),
                  ),
                )),
                SizedBox(
                  height: 20.0.h,
                ),

                FutureBuilder<List<IngredientModel>>(
                  future: ingredientController.fetchIngredients(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (snapshot.hasData) {
                      final ingredients = snapshot.data!;
                      return GridView.builder(
                        key: UniqueKey(),
                        scrollDirection: Axis.vertical,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16.0,
                                mainAxisSpacing: 16.0),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: filteredIngredients.length,
                        itemBuilder: (context, index) {
                          final ingredient = filteredIngredients[index];
                          return GestureDetector(
                              onTap: () => {
                                    selectedIngredients
                                        .add(filteredIngredients[index]),
                                    selectedIngredient(
                                        filteredIngredients[index]),
                                  },
                              child: FridgeItems(ingredient: ingredient));
                        },
                      );
                    } else {
                      return const Center(child: Text('No data available'));
                    }
                  },
                ),
                Center(
                    child: TextButton(
                  onPressed: ()=>Get.to(RecipeScreen()),
                  child: Container(
                    height: 46,
                    width: 200,
                    decoration: BoxDecoration(
                        border: const Border(
                          bottom: BorderSide(
                            color: Color(0xffB2BF71),
                          ),
                          top: BorderSide(
                            color: Color(0xffB2BF71),
                          ),
                          right: BorderSide(
                            color: Color(0xffB2BF71),
                          ),
                          left: BorderSide(
                            color: Color(0xffB2BF71),
                          ),
                        ),
                        color: const Color(0xFF696A6C),
                        borderRadius: BorderRadius.circular(30.r)),
                    child: Center(
                        child: Text(
                      "Get Recipes",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xffB2BF71),
                      ),
                    )),
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
