//
//  SignupRequestDto.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 23/10/25.
//

struct SignupRequestDto: Encodable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
