//
//  RecipeData.swift
//  MyFridge2.0
//
//  Created by Husban Ahmed on 1/5/22.
//

import Foundation
import UIKit

struct RecipeData:Decodable {
    
    let results: [Recipes]
    
    
}

struct Recipes: Decodable {
    
    let title: String
    
    let image: String
    
    let id: Int
    
    
}



