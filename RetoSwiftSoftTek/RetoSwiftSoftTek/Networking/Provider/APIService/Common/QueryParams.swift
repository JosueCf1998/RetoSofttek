//
//  QueryParams.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 9/10/24.
//

import Foundation

struct QueryParams {
    
    // MARK: - PROPERTIES
    let key: String
    let value: String
    
    // MARK: - CONSTRUCTOR
    init(
        key: String,
        value: String
    ) {
        self.key = key
        self.value = value
    }
    
}
