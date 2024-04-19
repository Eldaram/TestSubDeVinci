//
//  signUp.swift
//  TestSubDeVinci
//
//  Created by COURS on 19/04/2024.
//

import SwiftUI

struct SignUpView : View {
    @StateObject var signUpModel: SignUpModel = SignUpModel()
    
    var body: some View {
        VStack {
            Form {
                TextField("Pseudonyme", text: $signUpModel.username) { }
                TextField("Prénom", text: $signUpModel.firstName) { }
                TextField("Nom de famille", text: $signUpModel.lastName) { }
                SecureField("Mot de passe", text: $signUpModel.password) { }
                SecureField("Confirmer le mot de passe", text: $signUpModel.passwordValidation) { }
            }.scrollContentBackground(.hidden)
            Button (action: {signUpModel.saveUser(isAdmin: false)}) {
                ZStack {
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .fill(LinearGradient(colors: [.blue, .purple, .blue], startPoint: .bottomLeading, endPoint: .topTrailing))
                        .frame(width: 300, height: 40)
                    Text("Créer mon compte").foregroundStyle(.white)
                }
            }
        }.alert(signUpModel.errorMessage, isPresented: $signUpModel.isAlert) { }
            .navigationTitle("Créer un compte")
    }
}

#Preview {
    SignUpView()
}
