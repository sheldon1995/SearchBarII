//
//  ViewController.swift
//  SearchBarInTable
//
//  Created by Sheldon on 12/31/19.
//  Copyright © 2019 wentao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    @IBOutlet var table: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var animalArray = [Animal]()
    var currentAnimalArray = [Animal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpAnimals()
        setUpSearchBar()
        //keepSearchBarAtTop()
    }
    
    private func setUpAnimals() {
        // CATS
        animalArray.append(Animal(name: "Amber", category: .cat, image:"1"))
        animalArray.append(Animal(name: "Gege", category: .cat, image:"2"))
        animalArray.append(Animal(name: "Tom", category: .cat, image:"3"))
        // DOGS
        animalArray.append(Animal(name: "Cookie", category: .dog, image:"4"))
        animalArray.append(Animal(name: "Sheldon", category: .dog, image:"5"))
        animalArray.append(Animal(name: "James", category: .dog, image:"6"))
        currentAnimalArray = animalArray

    }
    
    private func setUpSearchBar(){
         searchBar.delegate = self
    }
 
    // Keep the search bar stay at the top rather than disspeared when user scroll down
  

    // Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentAnimalArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? TableCell else {
            return UITableViewCell()
        }
        cell.NameLab.text = currentAnimalArray[indexPath.row].name
        cell.CategoryLab.text = currentAnimalArray[indexPath.row].category.rawValue
        cell.imgView.image = UIImage(named:currentAnimalArray[indexPath.row].image)
        return cell
    }
    
    // Asks the delegate for the height to use for a row in a specified location.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    // Search bar
      func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
          currentAnimalArray = animalArray.filter({ animal -> Bool in
              switch searchBar.selectedScopeButtonIndex {
              case 0:
                  if searchText.isEmpty { return true }
                  return animal.name.lowercased().contains(searchText.lowercased())
              case 1:
                  if searchText.isEmpty { return animal.category == .dog }
                  return animal.name.lowercased().contains(searchText.lowercased()) &&
                  animal.category == .dog
              case 2:
                  if searchText.isEmpty { return animal.category == .cat }
                  return animal.name.lowercased().contains(searchText.lowercased()) &&
                  animal.category == .cat
              default:
                  return false
              }
          })
          table.reloadData()
      }
    
    // Set the scope bar
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        // Set the defult
        switch selectedScope {
            case 0:
                currentAnimalArray = animalArray
            case 1:
                currentAnimalArray = animalArray.filter({animal->Bool in animal.category == AnimalType.cat})
            case 2:
                currentAnimalArray = animalArray.filter({animal->Bool in animal.category == AnimalType.dog})
        
        default:
            currentAnimalArray = animalArray
        }
        table.reloadData()
    }
    

}

class Animal {
    let name: String
    let image: String
    let category: AnimalType
    
    init(name: String, category: AnimalType, image: String) {
        self.name = name
        self.category = category
        self.image = image
    }
}

enum AnimalType: String {
    case cat = "Cat"
    case dog = "Dog"
}


