//
//  Notification.swift
//  myTwi
//
//  Created by SaitoYuta on 2016/08/13.
//  Copyright © 2016年 SaitoYuta. All rights reserved.
//

import Foundation

public class AnnictNotification {
    
    // MARK: - Singleton
    
    struct Static {
        static let instance = AnnictNotification()
        static let queue = DispatchQueue(label: "AnnictAPI.Notification.Queue", attributes: [])
    }
    
    var cache = [UInt:[NSObjectProtocol]]()
    
    // MARK: - addObserverForName
    
    public class func on(_ target: AnyObject, name: String, queue: OperationQueue?, handler: @escaping ((Notification!) -> Void)) {
        let id = UInt(bitPattern: ObjectIdentifier(target))
        
        Static.queue.sync {
            let observer = NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: name), object: nil, queue: queue, using: handler)
            if let observers = Static.instance.cache[id] {
                Static.instance.cache[id] = observers + [observer]
            } else {
                Static.instance.cache[id] = [observer]
            }
        }
    }
    
    // MARK: - removeObserver
    
   public  class func off(_ target: AnyObject) {
        let id = UInt(bitPattern: ObjectIdentifier(target))
        
        Static.queue.sync {
            if let observers = Static.instance.cache[id] {
                for observer in observers {
                    NotificationCenter.default.removeObserver(observer)
                }
                Static.instance.cache.removeValue(forKey: id)
            }
        }
    }
    
    // MARK: - postNotificationName
    
    public class func post(_ name: String) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: name), object: nil)
    }
    
    public class func post(_ name: String, userInfo: [AnyHashable: Any]?) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: name), object: nil, userInfo: userInfo)
    }
    
}
