//
//  DetailVC.swift
//  MyFridge2.0
//
//  Created by Husban Ahmed on 1/29/22.
//

import UIKit

class DetailVC: UIViewController, RecipeManagerDelegate {

    var recipeManager = RecipeManager()
    
    var recipeNumber: Int = 0
    
    private var recipes = [RecipeModel]()
    
    @IBOutlet weak var labeling: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        recipeManager.fetchData(id: recipeNumber)
    }
    
    func didUpdateRecipe(recipe: [RecipeModel]) {
        
        recipes = recipe
    
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
