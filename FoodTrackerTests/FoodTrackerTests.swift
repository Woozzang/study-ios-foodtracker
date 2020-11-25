//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Woochan Park on 2020/11/24.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
  
  // Mark: Meal Class Test
  
  // Confirm that the Meal initiailizer returns a Meal object when passed valid parmaeters.
  func testMealInitializationSucceeds() {
    
    // Zero rating
    let zeroRatingMeal = Meal.init(name: "Zero", photo: nil, rating: 0)
    // nil 이면 중단한다
    XCTAssertNotNil(zeroRatingMeal)
    
    //highest positive rating
    let positiveRatingMeal = Meal.init(name: "Positive", photo: nil, rating: 5)
    XCTAssertNotNil(positiveRatingMeal)
  }
  
  // Confirm that the Meal initializer returns nil when passed a negative rating or an empty name.
  func testMealInitializationFails() {
    
    // Negative String
    let negatvieRatingMeal = Meal.init(name: "Negative", photo: nil, rating: -1)
    XCTAssertNil(negatvieRatingMeal)
    
    // Empty String
    let emptyStringMeal = Meal.init(name: "", photo: nil, rating: 0)
    XCTAssertNil(emptyStringMeal)
    
    // Rating exceeds maximum
    let largeRatingMeal = Meal.init(name: "Large", photo: nil, rating: 6)
    XCTAssertNil(largeRatingMeal)
  }

}
