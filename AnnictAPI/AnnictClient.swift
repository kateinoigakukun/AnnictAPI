//
//  AnnictClient.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/12/01.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation
import APIKit
import Result

class AnnictClient: Session {
    init(accessToken: String) {
        let configuration = URLSessionConfiguration.default
        let adapter = AnnictSessionAdapter(accessToken: accessToken, configuration: configuration)
        super.init(adapter: adapter)
    }
}
