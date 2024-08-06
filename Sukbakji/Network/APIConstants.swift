//
//  APIConstants.swift
//  Sukbakji
//
//  Created by jaegu park on 8/5/24.
//

import Foundation

struct APIConstants {
    // MARK: - Base URL
    static let baseURL = "http://54.180.165.121:8080/api"
    
    static let joinURL = baseURL + "/auth"
    
    static let userURL = baseURL + "/user"
    
    static let boardURL = baseURL + "/board"
    
    static let boardpostURL = baseURL + "/posts"
    
    static let calendarURL = baseURL + "/calender"
}
