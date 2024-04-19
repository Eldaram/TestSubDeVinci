//
//  ContentView.swift
//  TestSubDeVinci
//
//  Created by Guillaume on 16/04/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var logInModel: LogInModel = LogInModel()
    @StateObject var signUpModel: SignUpModel = SignUpModel()
    
    var body: some View {
        if logInModel.connected {
            if (logInModel.isUserAdmin()) {
                Text("Grades")
                userList
            }
            else {
                Text("logged")
            }
        }
        else {
            logView
        }
    }
    
    var logView: some View {
        VStack {
            Form {
                Text("Connexion")
                TextField("Pseudonyme", text: $logInModel.username) { }
                SecureField("Mot de passe", text: $logInModel.password) { }
                Button("Me connecter") { 
                    logInModel.loginUser()
                }
            }
            Divider()
            Form {
                Text("Créer un compte")
                TextField("Pseudonyme", text: $signUpModel.username) { }
                TextField("Prénom", text: $signUpModel.firstName) { }
                TextField("Nom de famille", text: $signUpModel.lastName) { }
                SecureField("Mot de passe", text: $signUpModel.password) { }
                SecureField("Confirmer le mot de passe", text: $signUpModel.passwordValidation) { }
                Button("Créer mon compte") { 
                    signUpModel.saveUser(isAdmin: false)
                }
            }
        }
        .padding()
        .alert(logInModel.errorMessage, isPresented: $logInModel.isAlert) { }
        .alert(signUpModel.errorMessage, isPresented: $signUpModel.isAlert) { }
    }
    
    var userList: some View {
        VStack {
            List (logInModel.getAllStudents(), id: \.id) { user in
                Text("\(Utils.extractString(str: user.firstName)) \(Utils.extractString(str: user.lastName)) \(Utils.extractInt16(num: user.grade))")
            }
            Button("Déconnexion") {
                logInModel.logoutUser()
            }
        }
    }
}

#Preview {
    ContentView()
}
