//
//  AnnictActivityAction.swift
//  Alphannict
//
//  Created by SaitoYuta on 2017/03/09.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import Foundation

public enum AnnictActivityAction {
    case create_record
    case create_multiple_records
    case create_status

    public static func create(from: String) throws -> AnnictActivityAction {
        switch from {
        case "create_record":
            return .create_record
        case "create_multiple_records":
            return .create_multiple_records
        case "create_status":
            return .create_status
        default:
            throw AnnictError.parseError
        }
    }
}
