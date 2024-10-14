//
//  UberMapViewRepresentable.swift
//  UberSwiftUI
//
//  Created by Mehmet eren Ortak on 14.10.2024.
//

import SwiftUI
import MapKit

//code inside the UberMapViewRepresentable does not know anything about the mapViewDelegate all those stuff being handled by the coordinator and the context object below gives the access for coordinator and then we make the coordinator. The coordinator itself in the extension class this class has all the MKMapView functionality and it communicates with the parent class uberMapViewRepresentable 
struct UberMapViewRepresentable: UIViewRepresentable {
    //all the functions below are part of UIViewRepresentable protocol and they provide you to view map 
    let mapView = MKMapView()
    
    //we initialize the class LocationManager which ask permission for users device and also updates the realtime location
    let locationManager = LocationManager()
    
    //this function below is in charge of making our mapview so we can see it on the screent
    func makeUIView(context: Context) -> some UIView {
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        return mapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    //this function below confronts to the MKMapView Delegate Protocol
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
    
    
}

extension UberMapViewRepresentable {
    //this coordinator is like a middleman between swiftUIView and UIKit functionality. We need it because we wanna use some functionality that UIkit does have and swiftUI doesn't
    class MapCoordinator: NSObject, MKMapViewDelegate {
        let parent: UberMapViewRepresentable
        init(parent: UberMapViewRepresentable) {
            self.parent = parent
            super.init()
        }
     
        //start location and zooming
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            let region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            )
            parent.mapView.setRegion(region, animated: true)
        }
    }
    
}
