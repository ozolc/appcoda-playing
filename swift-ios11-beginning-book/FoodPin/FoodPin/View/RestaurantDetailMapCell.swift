//
//  RestaurantDetailMapCell.swift
//  FoodPin
//
//  Created by NosovML on 01/02/2019.
//  Copyright © 2019 NosovML. All rights reserved.
//

import UIKit
import MapKit

class RestaurantDetailMapCell: UITableViewCell {

//    @IBOutlet var mapView: UIView!
    @IBOutlet weak var mapView: MKMapView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(location: String) {
        // Get location
        let geoCoder = CLGeocoder()
        
        print(location)
        geoCoder.geocodeAddressString(location, completionHandler: { placemark, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let placemark = placemark {
                // Get the first placemark
                let placemark = placemark[0]
                
                // Add annotation
                let annotation = MKPointAnnotation()
                
                if let location = placemark.location {
                    // Display the annotation
                    annotation.coordinate = location.coordinate
                    self.mapView.addAnnotation(annotation)
                    
                    // Set the zoom level
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 250, longitudinalMeters: 250)
                    self.mapView.setRegion(region, animated: false)
                }
            }
            
        })
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
