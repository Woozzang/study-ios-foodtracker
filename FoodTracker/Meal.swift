//
//  Meal.swift
//  FoodTracker
//
//  Created by Woochan Park on 2020/11/25.
//

import UIKit

class Meal {
  
  //Mark: Properties
  
  var name: String
  var photo: UIImage?
  var rating: Int
  
  //Mark: Initialization
  init?(name: String, photo: UIImage?, rating: Int) {
    
    // The name must not be empty
    guard !name.isEmpty else {
      return nil
    }
    
    // The rating must be between 0 and inclusively
    guard (rating >= 0) && (rating <= 5 ) else {
      return nil
    }
    
    self.name = name
    self.photo = photo
    self.rating = rating
  }
}
