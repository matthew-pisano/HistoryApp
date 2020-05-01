//
//  FirstViewController.swift
//  HistoryApp
//
//  Created by Matthew Pisano on 4/19/20.
//  Copyright © 2020 Matthew Pisano. All rights reserved.
//

import UIKit
import MapKit
//Class that controls the Map tab in the view
class FirstViewController: UIViewController, CLLocationManagerDelegate {
    //Map that shows the desired user location
    @IBOutlet weak var map: MKMapView!
    //Shows the last clicked latitude
    @IBOutlet weak var latOut: UILabel!
    //Shows the last clicked longitude
    @IBOutlet weak var longOut: UILabel!
    //The last clicked region
    @IBOutlet weak var placeOut: UILabel!
    //Tracks the zoom of the map
    var zoomLvl: Double = 1
    //Stores the last clicked latitude
    public static var lat: Double = 0.0
    //Stores the last clicked longitude
    public static var long: Double = 0.0
    //Location manager that trackes the location on the map
    let locationMgr = CLLocationManager()
    //Initalizes the loactionMgr and map zoom
    override func viewDidLoad() {
        super.viewDidLoad()
        locationMgr.delegate = self
        locationMgr.requestWhenInUseAuthorization()
        locationMgr.startUpdatingLocation()
        
        let location = CLLocation(latitude: FirstViewController.lat, longitude: FirstViewController.long)
        let region = MKCoordinateRegion( center: location.coordinate, latitudinalMeters: CLLocationDistance(exactly: 5000000*zoomLvl)!, longitudinalMeters: CLLocationDistance(exactly: 5000000*zoomLvl)!)
        map.setRegion(map.regionThatFits(region), animated: true)
    }
    /*func locationManager(_ manager: CLLocationManager,didChangeAuthorization status: CLAuthorizationStatus) {
        //map.showsUserLocation = true
        if(status == .authorizedWhenInUse){
            print("gps alowed")
            map.showsUserLocation = true
        }
        else{
            print("not allowed")
            return
        }
    }*/
    //Called when the zoomIn button is pushed, divides the zoom level by 1.2 and multiplies the current map region by the updated zoom lavel
    @IBAction func zoomIn(_ sender: Any) {
        zoomLvl /= 1.2
        let location = CLLocation(latitude: FirstViewController.lat, longitude: FirstViewController.long)
        let region = MKCoordinateRegion( center: location.coordinate, latitudinalMeters: CLLocationDistance(exactly: 5000000*zoomLvl)!, longitudinalMeters: CLLocationDistance(exactly: 5000000*zoomLvl)!)
        print("zoomIn \(zoomLvl) \(region)")
        map.setRegion(map.regionThatFits(region), animated: true)
    }
    //Called when the zoomIn button is pushed, divides the zoom level by 1.2 and multiplies the current map region by the updated zoom lavel
    @IBAction func zoomOut(_ sender: Any) {
        if(zoomLvl * 1.2 < 0.8) {
            zoomLvl *= 1.2}
        let location = CLLocation(latitude: FirstViewController.lat, longitude: FirstViewController.long)
        let region = MKCoordinateRegion( center: location.coordinate, latitudinalMeters: CLLocationDistance(exactly: 5000000*zoomLvl)!, longitudinalMeters: CLLocationDistance(exactly: 5000000*zoomLvl)!)
        print("zoomIn \(zoomLvl) \(region)")
        map.setRegion(map.regionThatFits(region), animated: true)
        
    }
    //Determines which region to display given a set of coordinates
    func place(lat: Double, long: Double){
        print("Tapped at latt: \(lat) long: \(long)")
        print("ber\(long.isLess(than: 15.0))\(long >= 12.0)\(lat.isLess( than: 53.0))\(lat >= 52.0)")
        if(long < 15.0 && long >= 12.0 && lat < 53.0 && lat >= 52.0) {print("ber\(lat < 15.0)\(lat > 12.0)");placeOut.text = "Berlin";}
        else if(long < 3.3 && long > 1.3 && lat < 49 && lat > 48) {print("Npar");placeOut.text = "Paris";}
        else if(long < 15.8 && long > 13.2 && lat < 50.8 && lat > 50.2) {print("pra");placeOut.text = "Prague";}
        else if(long < 30.3 && long > 27.3 && lat < 41.7 && lat > 40.3) {print("con");placeOut.text = "Constantinople";}
        else if(long < 7.7 && long > 3.8 && lat < 53.1 && lat > 51.1) {print("Nether");placeOut.text = "NetherLands";}
        else if(long < 32.2 && long > 29.9 && lat < 59.1 && lat > 58) {print("nov");placeOut.text = "Novgorod";}
        else if(long < 10 && long > 8.3 && lat < 50.5 && lat > 50.3) {print("hes");placeOut.text = "Hesse";}
        else if(long < 45.5 && long > -14.3 && lat < 69.7 && lat > 36.2) {placeOut.text = "Europe";}
        else if(long < 47.9 && long > -18.1 && lat < 35.2 && lat > -35.2) {placeOut.text = "Africa";}
        else if(long < 133.4 && long > 40.3 && lat < 71.4 && lat > 3.8) {placeOut.text = "Asia";}
        else if(long < 153.5 && long > 113.1 && lat < -40.3 && lat > -10.9) {placeOut.text = "Australia";}
        else {print("World");placeOut.text = "The World";}
    }
    /*func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let coords = locationMgr.location?.coordinate
        /*FirstViewController.lat = coords?.latitude
        FirstViewController.long = coords?.longitude
        latOut.text = String(FirstViewController.lat!)
        longOut.text = String(FirstViewController.long!)*/
            
    }*/
    //Called when a user taps on the map, place() is called with the current tapped coordinates are passed into it
    @IBAction func mapTap(_ sender: UITapGestureRecognizer) {
        let location = (sender).location(in: map)
        let locationCoordinate = map.convert(location, toCoordinateFrom: map)
        print("Tapped at lat: \(locationCoordinate.latitude) long: \(locationCoordinate.longitude)")
        FirstViewController.lat = locationCoordinate.latitude
        FirstViewController.long = locationCoordinate.longitude
        latOut.text = String(FirstViewController.lat)
        longOut.text = String(FirstViewController.long);
        print("Tapped at lat: \(FirstViewController.lat) long: \(FirstViewController.long)")
        place(lat: FirstViewController.lat, long: FirstViewController.long);
    }
    /*func revealRegionDetailsWithLongPressOnMap(sender: UILongPressGestureRecognizer) {
        if sender.state != UIGestureRecognizer.State.began { return }
        let touchLocation = sender.location(in: map)
        let locationCoordinate = map.convert(touchLocation, toCoordinateFrom: map)
        print("LOng Tapped at lat: \(locationCoordinate.latitude) long: \(locationCoordinate.longitude)")
        FirstViewController.lat = locationCoordinate.latitude
        FirstViewController.long = locationCoordinate.longitude
        latOut.text = String(FirstViewController.lat!)
        longOut.text = String(FirstViewController.long!)
    
    }*/
    /*func handleTap(gestureRecognizer: UILongPressGestureRecognizer){
        let location = (gestureRecognizer).location(in: map)
        let locationCoordinate = map.convert(location, toCoordinateFrom: map)
        print("Tapped at lat: \(locationCoordinate.latitude) long: \(locationCoordinate.longitude)")
        FirstViewController.lat = locationCoordinate.latitude
        FirstViewController.long = locationCoordinate.longitude
        latOut.text = String(FirstViewController.lat!)
        longOut.text = String(FirstViewController.long!)    }*/
    /*@IBAction func onTapMap(_ gestureRecognizer: UIPressGestureRecognizer) {
        let location = (gestureRecognizer).location(in: map)
        let coordinate = map.convertPoint(location, toCoordinateFromView: map)    }*/
}

