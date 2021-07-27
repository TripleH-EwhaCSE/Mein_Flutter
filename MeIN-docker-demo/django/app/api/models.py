from django.db import models

class Food(models.Model):
    foodname = models.CharField(max_length=200)
    ischecked = models.BooleanField(default=False)

    def __str__(self):
        return self.foodname


class Recipe(models.Model):
    food = models.ForeignKey(Food, on_delete=models.CASCADE, related_name="recipes")
    image = models.ImageField(null=True)

    def __str__(self):
        return str(self.food.foodname)+"의 레시피"


class Ingredient(models.Model):
    ingredientname = models.CharField(max_length=200)
    isallergy = models.BooleanField(null=True)
    isvegan = models.BooleanField(null=True)

    def __str__(self):
        return self.ingredientname


class IngredientinRecipe(models.Model):
    recipe = models.ForeignKey(Recipe, on_delete=models.CASCADE, related_name="recipes")
    ingredient = models.ForeignKey(Ingredient, on_delete=models.CASCADE, related_name="recipes")

    def __str__(self):
        return str(self.recipe.food.foodname)+"에 들어가는"+str(self.ingredient.ingredientname)
