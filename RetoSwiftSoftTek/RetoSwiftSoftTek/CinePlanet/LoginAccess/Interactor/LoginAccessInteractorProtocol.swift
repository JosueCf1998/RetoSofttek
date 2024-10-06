//
//  LoginAccessInteractorProtocol.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 6/10/24.
//

import Foundation

protocol LoginAccessInteractorProtocol {
    
    // MARK: - FUNCTIONS
    func authenticate(username: String, password: String, completion: @escaping (Bool) -> Void)
    
}
