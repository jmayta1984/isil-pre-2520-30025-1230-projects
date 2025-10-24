//
//  SigninResponseDto.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 23/10/25.
//

import Foundation

nonisolated struct SigninResponseDto: Decodable {
    let token: String
    let firstName: String
    let lastName: String
    let email: String
}
