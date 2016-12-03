//
//  AnnictSeasonType.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/12/03.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation
enum AnnictSeasonType: CustomStringConvertible {
    case all
    case spring
    case summer
    case autumn
    case winter

    var description: String {
        return String(describing: self)
    }
}
