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
    
    var selectedCell: Int = 0
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        
        recipeManager.delegate = self
        
        myTableView.dataSource = self
        
        myTableView.delegate = self
        
        myTableView.register(nib, forCellReuseIdentifier: "TableViewCell")
        
    // self.myTableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        

    }
    
    
    @IBOutlet weak var recipeSearchBar: UISearchBar!
    
    @IBAction func searchButton(_ sender: UIButton) {
        
        
        
        if let query = recipeSearchBar.text{
            
            recipeManager.fetchRecipe(query: query)
        
            recipeSearchBar.endEditing(true)
            
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
            if let url = URL(string: recipes[indexPath.row].recipeImage) {
                
                let session = URLSession(configuration: .default)
                
                let task = session.dataTask(with: url) { data, response, error in
                    
                    if error != nil {
                        
                        print(error!)
                        
                        return
                    }
                  if let imageData = data {
                      
                      let images  = UIImage(data: imageData)
                    
                      DispatchQueue.main.async {
                          
                          cell.myImageView.image =  images
                      }
                    }
                   
                    
                }
                task.resume()
        
            }

        cell.mylabel!.text = recipes[indexPath.row].recipeTitle
             
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedCell = recipes[indexPath.row].recipeId
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        performSegue(withIdentifier: "showDetail", sender: self)
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if let destination = segue.destination as? DetailVC{
            destination.recipeNumber = selectedCell
            
        }
    }
}
