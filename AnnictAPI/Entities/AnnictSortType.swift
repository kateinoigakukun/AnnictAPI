//
//  AnnictSortType.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/12/03.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation

public enum AnnictSortType: CustomStringConvertible {
    case asc
    case desc

    public var description: String {
        return String(describing: self)
    }
}
