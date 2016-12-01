//
//  URL+Parse.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/12/01.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation

extension URL {
    var queryItem: [String: String] {
        let splitedQuery = self.query?
            .components(separatedBy: CharacterSet(charactersIn: "&"))

        var params: [String:String] = [:]
        splitedQuery?.forEach{ item in
            let item = item.components(separatedBy: CharacterSet(charactersIn: "="))
            params[item[0]] = item[1]
        }
        return params
    }
    
}
