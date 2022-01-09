//
//  ViewController.swift
//  MyFridge2.0
//
//  Created by Husban Ahmed on 12/27/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    var recipeManager = RecipeManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    
    @IBOutlet weak var recipeSearchBar: UISearchBar!
    
    @IBAction func searchButton(_ sender: UIButton) {
        
        if let query = recipeSearchBar.text{
            
            recipeManager.fetchRecipe(query: query)
            
        }
        
    }
    
    
}
