//
//  ReachibilityManager.swift
//  FaveMovies
//
//  Created by Ahmad on 01/11/2020.
//  Copyright © 2020 Ahmad. All rights reserved.
//

import Foundation
import Alamofire

class ReachibilityManager {
    static let shared = ReachibilityManager()
    private var isNetworkAvailable = true
    private init() {}
    
    let reachabilityManager = Alamofire.NetworkReachabilityManager(host: "www.google.com")
    
    func startNetworkReachabilityObserver() {
        reachabilityManager?.startListening { status in
            switch status {
            case .notReachable:
                self.isNetworkAvailable = false
            case .unknown:
                self.isNetworkAvailable = false
            case .reachable(.ethernetOrWiFi):
                self.isNetworkAvailable = true
            case .reachable(.cellular):
                self.isNetworkAvailable = true
            }
        }
    }
        
    func isConnectedWithInternet() -> Bool {
        return isNetworkAvailable
    }
}
