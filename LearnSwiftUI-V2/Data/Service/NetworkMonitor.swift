//
//  Networkmonitor.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 7/9/21.
//

import Foundation
import Network

class NetworkMonitor : ObservableObject{
    @Published var isConnect : Bool = true
    
    func monitorNetwork(){
        let monitor : NWPathMonitor = NWPathMonitor()
        let queue = DispatchQueue(label: "Monitor")
        
        monitor.pathUpdateHandler = {
            path in
            
            if path.status == .satisfied {
                DispatchQueue.main.async {
                    self.isConnect = true
                }
            }else if path.status == .requiresConnection{
                DispatchQueue.main.async {
                    self.isConnect = false
                }
            }else{
                DispatchQueue.main.async {
                    self.isConnect = false
                }
            }
        }
        monitor.start(queue: queue)
    }
}
