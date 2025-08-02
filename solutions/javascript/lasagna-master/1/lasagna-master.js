/// <reference path="./global.d.ts" />
// @ts-check

/**
 * Implement the functions needed to solve the exercise here.
 * Do not forget to export them so they are available for the
 * tests. Here an example of the syntax as reminder:
 *
 * export function yourFunction(...) {
 *   ...
 * }
 */

export function cookingStatus(timer){
  if (timer==undefined)
    return "You forgot to set the timer."
  else if (timer==0)
    return "Lasagna is done."
  else
    return "Not done, please wait."
}

export function preparationTime(layers,timePrep=2){
  return layers.length*timePrep
}

export function quantities(layer){
  const qty={
    noodles:0,
    sauce:0
  }
  for(let i=0;i<layer.length;i++){
    if (layer[i]=="sauce")
      qty.sauce+=0.2
    else if (layer[i]=="noodles")
      qty.noodles+=50
  }
  return qty
}

export function addSecretIngredient(friendsList,myList){
  myList.push(friendsList[friendsList.length-1])
}

export function scaleRecipe(recipe,value){
  let copyRecipe = {...recipe}
  for (let key in copyRecipe)
    copyRecipe[key]=copyRecipe[key]*value/2
  return copyRecipe
}