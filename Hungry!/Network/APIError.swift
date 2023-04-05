//
//  APIError.swift
//  Hungry!
//
//  Created by Ahmed Hamam on 22/03/2023.
//

import Foundation

enum APIError: Error {
    case internalError
    case serverError
    case parsingError
    case urlBadFormmated
    case unknownError
    case errorDecoding
}
