//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by Maksim Nosov on 26/01/2019.
//  Copyright © 2019 NosovML. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var headerView: RestaurantDetailHeaderView!
    
    var restaurant: Restaurant = Restaurant()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerView.headerImage.image = UIImage(named: restaurant.image)
        headerView.nameLabel.text = restaurant.name
        headerView.typeLabel.text = restaurant.type
//        headerView.restaurantLocationLabel.text = restaurant.location
        headerView.heartImageView.isHidden = (restaurant.isVisited) ? false : true
        
        navigationItem.largeTitleDisplayMode = .never
    }

}
