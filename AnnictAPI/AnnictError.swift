//
//  AnnictError.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/12/01.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation
import APIKit

public enum AnnictError: Error {
    case parseError

    /// Error of `URLSession`.
    case connectionError(Error)

    /// Error while creating `URLReqeust` from `Request`.
    case requestError(Error)

    /// Error while creating `Request.Response` from `(Data, URLResponse)`.
    case responseError(Error)

}
