//
//  StoreInAreaMapViewController.swift
//  KJY_TermProject
//
//  Created by KpuGame on 2020/06/11.
//  Copyright © 2020 KimJiYeong. All rights reserved.
//

import UIKit
import MapKit
class StoreInAreaMapViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!
    var posts = NSMutableArray()
    
    let regionRadius: CLLocationDistance = 500
    
    func centerMapOnLocation(location: CLLocation ) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    var stores : [StoreArea] = []
    
    func loadInitialData() {
        var initalLocation : CLLocation?
        for post in posts {
            let bizesNm2 = (post as AnyObject).value(forKey: "bizesNm") as! NSString as String
            let rdnmAddr   = (post as AnyObject).value(forKey: "indsLclsNm") as! NSString as String
            let XPos   = (post as AnyObject).value(forKey: "lon") as! NSString as String
            let YPos   = (post as AnyObject).value(forKey: "lat") as! NSString as String
            let lat    = (YPos as NSString).doubleValue
            let lon    = (XPos as NSString).doubleValue
            initalLocation = CLLocation(latitude: lat, longitude: lon)
            let store = StoreArea(title: bizesNm2, locationName: rdnmAddr, coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lon))
            
            stores.append(store)
            
        }
        centerMapOnLocation(location: initalLocation!)
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let location = view.annotation as! StoreArea
        let launchOptions = [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving]
        
        location.mapItem().openInMaps(launchOptions: launchOptions)
       
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotaion = annotation as? StoreArea else {return nil}
        
        let identifier = "marker"
        var view: MKMarkerAnnotationView
        
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            
        }
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        loadInitialData()
        mapView.addAnnotations(stores)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
