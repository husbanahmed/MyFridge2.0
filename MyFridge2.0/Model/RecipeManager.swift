//
//  RecipeManager.swift
//  MyFridge2.0
//
//  Created by Husban Ahmed on 1/1/22.
//

import Foundation


struct RecipeManager{
    
    let recipeURL = "https://api.spoonacular.com/recipes/"
    
    let complexSearch = "complexSearch?"
    
    let apikey="apiKey=5ef0804695184c5eb9812a59c6461d16"
    
    let number = 25
    
    func fetchRecipe(query:String) {
        
        let urlString = "\(recipeURL)\(complexSearch)\(apikey)&query=\(query)&number=\(number)"
        
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, response, error in
                
                if error != nil {
                    
                    print(error!)
                    
                    return
                }
                if let safeData = data {
                    
                        self.parseJSON(recipeData: safeData)
                    
                }
            }
            task.resume()
        }
        
    }
    
    func parseJSON(recipeData: Data){
        let decoder  = JSONDecoder()
        
        do{
            
            let decodedData = try decoder.decode(RecipeData.self, from: recipeData)
            
            for index in 0...decodedData.results.count - 1  {
                
                let title = decodedData.results[index].title
                
                let image = decodedData.results[index].image
                
                RecipeModel(recipeTitle: title, recipeImage: image)
                
            }
            
        } catch{
            
            print(error)
            
        }
    }
}

