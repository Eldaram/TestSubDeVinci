//
//  LogInModel.swift
//  TestSubDeVinci
//
//  Created by COURS on 19/04/2024.
//

import Foundation

class LogInModel: ObservableObject {
    var storageModel = DataController.shared
    
    @Published var username: String = ""
    @Published var password: String = ""
    
    @Published var user: User? = nil
    @Published var connected: Bool = false
    
    @Published var isAlert: Bool = false
    @Published var errorMessage: String = ""
    
    func loginUser() {
        guard !username.isEmpty && !password.isEmpty else {
            isAlert = true
            errorMessage = Errors.empty.errorDescription!
            return
        }
        user = storageModel.logIn(username: username, password: password)
        if (user != nil) {
            connected = true
        }
    }
    
    func logoutUser() {
        user = nil
        connected = false
    }
}
