// ignore_for_file: library_private_types_in_public_api

import 'package:career_craft/core/colors.dart';
import 'package:flutter/material.dart';

class IngredientListWidget extends StatefulWidget {
  final List<dynamic> ingredients;
  final String title;
  final Function(List<dynamic>) onIngredientsChanged;

  const IngredientListWidget({
    super.key,
    required this.ingredients,
    required this.onIngredientsChanged,
    required this.title,
  });

  @override
  _IngredientListWidgetState createState() => _IngredientListWidgetState();
}

class _IngredientListWidgetState extends State<IngredientListWidget> {
  TextEditingController ingredientController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          widget.title,
          style: theme.titleMedium,
        ),
        SizedBox(height: size.height * 0.02),
        TextFormField(
          controller: ingredientController,
          keyboardType: TextInputType.text,
          style: theme.bodyMedium,
          decoration: InputDecoration(
            hintText: widget.title,
            suffixIcon: IconButton(
              icon: const Icon(
                Icons.add,
                color: secondary,
              ),
              onPressed: () {
                if (ingredientController.text.isNotEmpty) {
                  setState(() {
                    widget.ingredients.add(ingredientController.text);
                    ingredientController.clear();
                    widget.onIngredientsChanged(widget.ingredients);
                  });
                }
              },
            ),
          ),
        ),
        SizedBox(height: size.height * 0.02),
        if (widget.ingredients.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Wrap(
                spacing: 8,
                children: widget.ingredients
                    .map((ingredient) => Chip(
                          label: Text(ingredient),
                          backgroundColor: primary[200],
                          deleteIcon: const Icon(
                            Icons.close,
                          ),
                          onDeleted: () {
                            setState(() {
                              widget.ingredients.remove(ingredient);
                              widget.onIngredientsChanged(widget.ingredients);
                            });
                          },
                        ))
                    .toList(),
              ),
            ],
          ),
      ],
    );
  }
}
