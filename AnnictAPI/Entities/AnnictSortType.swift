//
//  AnnictSortType.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/12/03.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation

enum AnnictSortType: CustomStringConvertible {
    case asc
    case desc

    var description: String {
        return String(describing: self)
    }
}
