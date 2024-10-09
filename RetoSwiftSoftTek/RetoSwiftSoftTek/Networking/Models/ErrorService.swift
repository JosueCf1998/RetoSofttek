//
//  ErrorService.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 7/10/24.
//

import Foundation

struct ErrorService: Error {
    
    // MARK: - PROPERTIES
    let code: String
    let title: String?
    let message: String
    
    // MARK: - CONSTRUCTOR
    init(
        code: String,
        title: String? = nil,
        message: String
    ) {
        self.code = code
        self.title = title
        self.message = message
    }
    
    // MARK: - FUNCTIONS
    func generic() -> ErrorService {
        ErrorService(code: "500", title: "Ocurrio un error inesperado", message: "Por favor intentalo nuevamente")
    }
    
}
