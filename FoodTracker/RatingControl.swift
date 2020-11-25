//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Woochan Park on 2020/11/25.
//

import UIKit

class RatingControl: UIStackView {
  //MARK: Initialization
  
  /*
   For programatically initializing the view
   */
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupButtons()
  }
  
  /*
   For loading the view from the storyboard
   */
  required init(coder: NSCoder) {
    super.init(coder: coder)
    setupButtons()
  }
  
  private func setupButtons() {
    
    // Create the button
    let button = UIButton()
    button.backgroundColor = UIColor.systemRed
    
    // Add constraints
    button.translatesAutoresizingMaskIntoConstraints = false
    button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
    button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
    
    // Add the button ot the stack
    addArrangedSubview(button)
  }
}
