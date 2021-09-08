//
//  NetworkMonitorService.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 6/9/21.
//

import Foundation
import Network

final class NetworkMonitorService{
    static let shared = NetworkMonitorService()
    
    private let queue = DispatchQueue.global()
    private let monitor: NWPathMonitor
    
    public private(set) var isConnected : Bool = false
    public private(set) var connectionType : ConnectionType = .unknown
    
    enum ConnectionType{
        case wifi
        case celluler
        case ethernet
        case unknown
    }
    
    private init(){
        monitor = NWPathMonitor()
    }
    
    public func startMonitoring(){
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = {[weak self] path in
            self?.isConnected = path.status == .satisfied
            self?.getConnection(path)
//            print(self?.isConnected ?? "N/A")
        }
    }
    
    public func stopMonitoring(){
        monitor.cancel()
    }
    
    private func getConnection(_ path : NWPath){
        if path.usesInterfaceType(.wifi) {
            connectionType = .wifi
        }
        else if path.usesInterfaceType(.cellular){
            connectionType = .celluler
        }
        else if path.usesInterfaceType(.wiredEthernet){
            connectionType = .ethernet
        }
        else {
            connectionType = .unknown
        }
    }
}
