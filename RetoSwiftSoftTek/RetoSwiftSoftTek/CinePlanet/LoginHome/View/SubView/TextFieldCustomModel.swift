//
//  TextFieldCustomModel.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 7/10/24.
//

import Foundation

struct TextFieldCustomModel {
    
    // MARK: - PROPERTIES
    var validation: ValidationState = .none
    var errorMessage: String
    var text: String
    
}

enum ValidationState {
    
    // MARK: - CASES
    case none, success, error
    
}
