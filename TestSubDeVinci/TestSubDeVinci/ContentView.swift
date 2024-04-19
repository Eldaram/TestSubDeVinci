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
            VStack {
                if (logInModel.isUserAdmin()) {
                    Text("Notes")
                    userList
                }
                else {
                    if (logInModel.testPassed) {
                        studentResults
                    }
                    else {
                        Text("Questionaire")
                        studentQuestions
                    }
                }
                Button("Déconnexion") {
                    logInModel.logoutUser()
                    questionNum = 0
                }
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
        List (logInModel.getAllStudents(), id: \.id) { user in
            Text("\(Utils.extractString(str: user.firstName)) \(Utils.extractString(str: user.lastName)) - \(user.passed ? Utils.extractInt(num: user.grade) : "Non noté")")
        }
    }
    
    @State private var selected: possibleAnswers = .one
    @State private var questionNum = 0
    
    var studentQuestions: some View {
        VStack {
            Text("Question \(questionNum + 1)/\(Model.questions.count)")
            Text("Note \(logInModel.grade)/\(Model.questions.count)")
            Form {
                Text(Model.questions[questionNum].statement)
                Picker(selection: $selected, label: Text("Réponse")) {
                    Text(Model.questions[questionNum].proposal[0]).tag(possibleAnswers.one)
                    Text(Model.questions[questionNum].proposal[1]).tag(possibleAnswers.two)
                    Text(Model.questions[questionNum].proposal[2]).tag(possibleAnswers.three)
                }
                Button ("Suivant") {
                    
                    logInModel.grade += Model.questions[questionNum].answer == selected ? 1 : 0
                    selected = possibleAnswers.one
                    if (questionNum + 1 < Model.questions.count) {
                        questionNum += 1
                    }
                    else {
                        logInModel.saveGrade()
                    }
                }
            }
        }
    }
    
    var studentResults: some View {
        VStack {
            Text("Bravo ! Vous avez complété le quesitionaire")
            Text(logInModel.username)
            Text("\(logInModel.user?.grade ?? 0)/10")
        }
    }
}

#Preview {
    ContentView()
}
