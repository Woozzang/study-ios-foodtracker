//
//  RatingControl.swift
//  FoodTracker#imageLiteral(resourceName: "Screen Shot 2020-11-25 at 16.40.50.png")
//
//  Created by Woochan Park on 2020/11/25.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
  
  //MARK: Properties
  private var ratingButtons = [UIButton]()
  
  var rating = 0 {
    didSet {
      updateButtonSelectionStates()
    }
  }
  
  // Need to reset the control’s buttons every time these attributes change
  //  the didSet property observer is called immediately after the property’s value is set.
  @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
    didSet {
      setupButtons()
    }
  }
  @IBInspectable var starCount: Int = 5 {
    didSet {
      setupButtons()
    }
  }
  

  
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

    // clear any existing buttons
    for button in ratingButtons {
      removeArrangedSubview(button)
      button.removeFromSuperview()
    }
    ratingButtons.removeAll()
    
    // Load Button Images
    let bundle = Bundle(for: type(of:self))
    let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
    let emptyStar = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection)
    let highlightedStar = UIImage(named: "highlightedStar", in: bundle, compatibleWith: self.traitCollection)
    
    
    for _ in 0..<starCount {
      // Create the button
      let button = UIButton()
      
      // Set the button images
      button.setImage(emptyStar, for: .normal)
      button.setImage(filledStar, for: .selected)
      button.setImage(highlightedStar, for: .highlighted)
      button.setImage(highlightedStar, for: [.highlighted, .selected])
      
      
      // Add constraints
      button.translatesAutoresizingMaskIntoConstraints = false
      button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
      button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
      
      // Setup the button action
      button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
      
      // Add the button ot the stack
      addArrangedSubview(button)
      
      // Add the new button to the rating button array
      ratingButtons.append(button)
    }
  }
  
  private func updateButtonSelectionStates(){
    for (index, button) in ratingButtons.enumerated(){
      // If the index of a button is less than the rating, tha button should be selected.
      button.isSelected = index < rating
    }
  }

  //MARK: Button Action
  @objc func ratingButtonTapped(button: UIButton) {
    guard let index = ratingButtons.firstIndex(of: button) else {
      fatalError("The button, \(button), is not in the ratignButotns array: \(ratingButtons)")
    }
    
    // Calcluate the rating of the selected button
    let selectedRating = index + 1
    
    if selectedRating == rating {
      // If the selected star represents the current ratign, reset the rating to 0.
      rating = 0
    } else {
      // Otherwise set the rating to the selected star
      rating = selectedRating
    }
    
    updateButtonSelectionStates()
  }
}
