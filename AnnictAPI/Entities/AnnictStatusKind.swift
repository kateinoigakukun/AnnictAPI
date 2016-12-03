//
//  AnnictStatusKind.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/12/03.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation

public enum AnnictStatusKind: CustomStringConvertible {
    case wanna_watch
    case watching
    case watched
    case on_hold
    case stop_watching
    case no_select

    public var description: String {
        return String(describing: self)
    }
}
