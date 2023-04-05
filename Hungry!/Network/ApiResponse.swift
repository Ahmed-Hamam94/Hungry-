//
//  ApiResponse.swift
//  Hungry!
//
//  Created by Ahmed Hamam on 24/03/2023.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
