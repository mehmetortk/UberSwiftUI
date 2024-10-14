//
//  LocationSearchViewModel.swift
//  UberSwiftUI
//
//  Created by Mehmet eren Ortak on 14.10.2024.
//

import Foundation
import MapKit

class LocationSearchViewModel: NSObject, ObservableObject{
    
    //Mark: - Properties

    @Published var results = [MKLocalSearchCompletion]()
    private let searchCompleter = MKLocalSearchCompleter()
    var queryFragment: String = ""{
        didSet{
            print("DEBUG: Query fragment is \(queryFragment)")
        }
    }
    
    override init(){
        super.init()
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment
    }
    
}

    //Mark: - MKLocalSearchCompleterDelegate

extension LocationSearchViewModel: MKLocalSearchCompleterDelegate{
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}
