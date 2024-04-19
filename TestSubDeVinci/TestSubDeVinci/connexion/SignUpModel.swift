//
//  SignUp.swift
//  TestSubDeVinci
//
//  Created by COURS on 19/04/2024.
//

import Foundation

class SignUpModel: ObservableObject {
    var storageModel = DataController.shared
    
    @Published var username: String = ""
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var password: String = ""
    @Published var passwordValidation: String = ""
    
    @Published var isAlert: Bool = false
    @Published var errorMessage: String = ""
    
    func saveUser(isAdmin: Bool) {
        guard !username.isEmpty && !firstName.isEmpty && !lastName.isEmpty && !password.isEmpty && !passwordValidation.isEmpty else {
            isAlert = true
            errorMessage = Errors.empty.errorDescription!
            return
        }
        guard password == passwordValidation else {
            isAlert = true
            errorMessage = Errors.noMatch.errorDescription!
            return
        }
        storageModel.saveUser(username: username, firstName: firstName, lastName: lastName, password: password, isAdmin: isAdmin)
    }
}
