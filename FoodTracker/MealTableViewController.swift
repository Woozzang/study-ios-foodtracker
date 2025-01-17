//
//  MealTableViewController.swift
//  FoodTracker
//
//  Created by Woochan Park on 2020/11/25.
//

import UIKit

class MealTableViewController: UITableViewController {

  // MARK: Private Methods
  var meals = [Meal]()

  override func viewDidLoad() {
      super.viewDidLoad()
    
    // Load the sample data.
    loadSampleMeals()
  }

  // MARK: - Table view data source

  override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return meals.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
    
    //Configure the cell...
    
  
    return cell
  }


  /*
  // Override to support conditional editing of the table view.
  override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
      // Return false if you do not want the specified item to be editable.
      return true
  }
  */

  /*
  // Override to support editing the table view.
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
          // Delete the row from the data source
          tableView.deleteRows(at: [indexPath], with: .fade)
      } else if editingStyle == .insert {
          // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
      }
  }
  */

  /*
  // Override to support rearranging the table view.
  override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

  }
  */

  /*
  // Override to support conditional rearranging of the table view.
  override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
      // Return false if you do not want the item to be re-orderable.
      return true
  }
  */

  /*
  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      // Get the new view controller using segue.destination.
      // Pass the selected object to the new view controller.
  }
  */
  //MARK: Private Methods
  
  private func loadSampleMeals() {
    
    let photo1 = UIImage(named: "meal1")
    let photo2 = UIImage(named: "meal2")
    let photo3 = UIImage(named: "meal3")
    
    guard let meal1 = Meal(name: "Pepperoni Pizza", photo: photo1, rating: 4) else {
      fatalError("Unable to instantiate meal1")
    }
    
    guard let meal2 = Meal(name: "Tomato Pasta", photo: photo2, rating: 5) else {
      fatalError("Unable to instantiate meal2")
    }
    
    guard let meal3 = Meal(name: "Hamburger", photo: photo3, rating: 3) else {
      fatalError("Unable to instantiate meal3")
    }
    
    meals += [meal1, meal2, meal3]
  }
}
