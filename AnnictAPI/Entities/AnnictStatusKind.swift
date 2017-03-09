//
//  AnnictStatusKind.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/12/03.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation

public enum AnnictStatusKind {
    case wanna_watch
    case watching
    case watched
    case on_hold
    case stop_watching
    case no_select

    public var description: String {
        return String(describing: self)
    }

    public static func create(from: String) throws -> AnnictStatusKind {
        switch from {
        case "wanna_watch":
            return .wanna_watch
        case "watching":
            return .watching
        case "watched":
            return .watched
        case "on_hold":
            return .on_hold
        case "stop_watching":
            return .stop_watching
        case "no_select":
            return .no_select
        default:
            throw AnnictError.parseError
        }
    }
}
