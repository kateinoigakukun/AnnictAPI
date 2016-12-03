//
//  Array+join.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/12/03.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation

extension Array {
    func join(_ str: String) -> String {
        return self.reduce(""){
            if $0 == "" { return "\($1)" }
            return "\($0)\(str)\($1)"
        }
    }
}
