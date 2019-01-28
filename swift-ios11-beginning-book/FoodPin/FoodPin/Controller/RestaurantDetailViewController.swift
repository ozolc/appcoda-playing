//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by Maksim Nosov on 26/01/2019.
//  Copyright © 2019 NosovML. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    
//    @IBOutlet var restaurantImageView: UIImageView!
//    @IBOutlet var restaurantNameLabel: UILabel!
//    @IBOutlet var restaurantTypeLabel: UILabel!
//    @IBOutlet var restaurantLocationLabel: UILabel!
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var headerView: RestaurantDetailHeaderView!
    
    var restaurant: Restaurant = Restaurant()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerView.heartImageView.image = UIImage(named: restaurant.image)
        headerView.nameLabel.text = restaurant.name
        headerView.typeLabel.text = restaurant.type
//        headerView.restaurantLocationLabel.text = restaurant.location
        headerView.heartImageView.isHidden = (restaurant.isVisited) ? false : true
        
        navigationItem.largeTitleDisplayMode = .never
    }

}
