//
//  AnnictSeasonType.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/12/03.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation
public enum AnnictSeasonType {
    case all
    case spring
    case summer
    case autumn
    case winter

    public var description: String {
        return String(describing: self)
    }
}
