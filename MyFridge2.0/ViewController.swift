//
//  ViewController.swift
//  MyFridge2.0
//
//  Created by Husban Ahmed on 12/27/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, RecipeManagerDelegate {
    
    var recipeManager = RecipeManager()
    
    private var recipes = [RecipeModel]()
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeManager.delegate = self
        myTableView.dataSource = self
        myTableView.delegate = self
        
     self.myTableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        

    }
    
    
    @IBOutlet weak var recipeSearchBar: UISearchBar!
    
    @IBAction func searchButton(_ sender: UIButton) {
        
        
        if let query = recipeSearchBar.text{
            
            recipeManager.fetchRecipe(query: query)
        
        }
        
    }
    
    func didUpdateRecipe(recipe: [RecipeModel]) {
        
        recipes = recipe
        
        DispatchQueue.main.async {
            self.myTableView.reloadData()
        }
        
           
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! TableViewCell
          
        cell.titleLabel!.text = recipes[indexPath.row].recipeTitle
        
        
    
        //if let title =
        
        print(recipes[indexPath.row].recipeTitle)
        
       // print("title: \( cell.titleLabel!.text!)")
        
        //cell.imageCell!.image = UIImage(contentsOfFile: recipes[indexPath.row]!.recipeImage)
        
        //print(UIImage(contentsOfFile: recipes[indexPath.row]!.recipeImage))
             
        return cell
        
        
    }
}
