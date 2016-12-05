//
//  Enum+String.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/12/04.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation

protocol EnumStringConvertible {}
extension EnumStringConvertible where Self: Hashable {
    var string: String {
        return String(describing: self)
    }
}
