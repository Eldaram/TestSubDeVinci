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
    @Published var grade: Int16 = 0
    
    @Published var user: User? = nil
    @Published var connected: Bool = false
    @Published var testPassed: Bool = false
    
    @Published var isAlert: Bool = false
    @Published var errorMessage: String = ""
    
    func loginUser() {
        guard !username.isEmpty && !password.isEmpty else {
            isAlert = true
            errorMessage = Errors.empty.errorDescription!
            return
        }
        user = storageModel.logIn(username: username, password: password)
        guard let _user: User = user else {
            isAlert = true
            errorMessage = Errors.wrongCredentials.errorDescription!
            return
        }
        testPassed = _user.passed
        connected = true
        
    }
    
    func logoutUser() {
        user = nil
        connected = false
        grade = 0
        testPassed = false
    }
    
    func isUserAdmin() -> Bool {
        guard let _user: User = user else {
            return false
        }
        return _user.isAdmin
    }
    
    func getAllStudents() -> [User] {
        return storageModel.getAllStudents()
    }
    
    func saveGrade() {
        storageModel.saveGrade(username: username, grade: grade)
        testPassed = true
    }
}
