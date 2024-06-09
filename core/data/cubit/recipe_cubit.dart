import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


part 'recipe_state.dart';

class RecipeCubit extends Cubit<List<RecipeModel>> {
  final DatabaseHelper dbHelper;

  RecipeCubit(this.dbHelper) : super([]);

  void loadRecipes() async {
    final recipes = await dbHelper.readAllRecipes();
    emit(recipes);
  }

  void addRecipe(RecipeModel recipe) async {
    await dbHelper.create(recipe);
    loadRecipes();
  }

  void updateRecipe(RecipeModel recipe) async {
    await dbHelper.update(recipe);
    loadRecipes();
  }

  void deleteRecipe(int id) async {
    await dbHelper.delete(id);
    loadRecipes();
  }
}
