//
//  ListRecipes.swift
//  MyFridge2.0
//
//  Created by Husban Ahmed on 1/9/22.
//

import UIKit

class ListRecipes: UITableViewCell, UITableViewDelegate, RecipeManagerDelegate  {

    
    var recipeManager = RecipeManager()
    
    
   // @IBOutlet weak var myTableView: UITableView!
    
    // var list = ["Africa", "Europe", "North America","South America", "Antartica", " Australia", "Asia"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
       // myTableView.delegate = self
       // myTableView.dataSource = self
       // recipeManager.delegate = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
         

        // Configure the view for the selected state
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return recipeManager.
        didUpdateRecipe(recipe: RecipeModel)
        
                
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = list[indexPath.row]
//        return cell
         return didUpdateRecipe(recipe: RecipeModel)
    }
    
    func didUpdateRecipe(recipe: RecipeModel) {
        print(recipe.recipeTitle)
        print(recipe.recipeImage)
    }
    
    
}
