//
//  StoreArea.swift
//  KJY_TermProject
//
//  Created by KpuGame on 2020/06/11.
//  Copyright © 2020 KimJiYeong. All rights reserved.
//

import Foundation
import MapKit
import Contacts

class StoreArea : NSObject, MKAnnotation {
    let title : String?
    let locationName : String
    let coordinate: CLLocationCoordinate2D
    
        var subtitle : String? {
        return locationName
    }
    init(title: String, locationName: String, coordinate : CLLocationCoordinate2D)
    {
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate
        
        super.init()
    }
    func mapItem() -> MKMapItem {
        let addressDict = [CNPostalAddressStreetKey : subtitle!]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDict)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        
        return mapItem
    }
}

