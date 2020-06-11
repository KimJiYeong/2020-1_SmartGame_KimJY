//
//  Artworks.swift
//  KJY_TermProject
//
//  Created by KpuGame on 2020/06/11.
//  Copyright © 2020 KimJiYeong. All rights reserved.
//

import Foundation
import MapKit

import Contacts

class Artwork : NSObject, MKAnnotation {
    let title : String?
    let locationName : String
    let discipline : String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, discipline : String, coordinate : CLLocationCoordinate2D)
    {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
}
