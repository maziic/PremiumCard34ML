//
//  HomeViewController.swift
//  PremiumCard34ML
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var carouselCollectionView: UICollectionView!
    @IBOutlet weak var tabsCollectionView: UICollectionView!
    @IBOutlet weak var cardsTableView: UITableView!

    // Your data arrays for carousel items, tabs, and cards
    var carouselItems: [String] = ["Item 1", "Item 2", "Item 3"]
    var tabs: [String] = ["Tab 1", "Tab 2", "Tab 3"]
    var cardItems: [String] = ["Card 1", "Card 2", "Card 3", "Card 4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carouselCollectionView.delegate = self
        carouselCollectionView.dataSource = self
        
        tabsCollectionView.delegate = self
        tabsCollectionView.dataSource = self
        
        cardsTableView.delegate = self
        cardsTableView.dataSource = self
    }
}

// Implement UICollectionViewDelegate and UICollectionViewDataSource for carousel and tabs
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == carouselCollectionView {
            return carouselItems.count
        } else if collectionView == tabsCollectionView {
            return tabs.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == carouselCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarouselCell", for: indexPath) as! CarouselCell
            cell.titleLabel.text = carouselItems[indexPath.item]
            return cell
        } else if collectionView == tabsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabCell", for: indexPath) as! TabCell
            cell.titleLabel.text = tabs[indexPath.item]
            return cell
        }
        return UICollectionViewCell()
    }
}

// Implement UITableViewDelegate and UITableViewDataSource for cards
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CardCell", for: indexPath) as! CardCell
        cell.titleLabel.text = cardItems[indexPath.row]
        return cell
    }
}

// Custom UICollectionViewCell for Carousel
class CarouselCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
}

// Custom UICollectionViewCell for Tabs
class TabCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
}

// Custom UITableViewCell for Cards
class CardCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
}
