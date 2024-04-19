//
//  DataController.swift
//  TestSubDeVinci
//
//  Created by COURS on 19/04/2024.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    static var shared = DataController()
        
    let container = NSPersistentContainer(name: "Users")
    
    var viewContext: NSManagedObjectContext {
        return container.viewContext
    }
    
    private init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
        saveUser(username: "JMartin", firstName: "Jean", lastName: "Martin", password: "12345ABC", isAdmin: true)
        saveUser(username: "MDupont", firstName: "Marie", lastName: "Dupont", password: "J@imeLesM0tsDeP@sseDifficiles", isAdmin: true)
    }
    
    func saveUser(username: String, firstName: String, lastName: String, password: String, isAdmin: Bool) {
        let registeredUser = User(context: viewContext)
        registeredUser.id = UUID()
        registeredUser.username = username
        registeredUser.firstName = firstName
        registeredUser.lastName = lastName
        registeredUser.password = password
        registeredUser.isAdmin = isAdmin
        
        
        do {
            try viewContext.save()
            print("Saved !")
        } catch {
            print("Je n'ai pas réussi à sauvegarder les données: \(error)")
        }
    }
    
    func logIn(username: String, password: String) -> User?{
        let userList: [User] = getAllUsers()
        guard let user: User = userList.first(where: {(user:User) in user.username == username}) else {
            print("No user named \(username)")
            return nil
        }
        
        if (user.password == password) {
            print("Login with \(user.firstName ?? "ERROR")")
            return user
        }
        
        print("Wrong password, right is \(user.password ?? "ERROR")")
        return nil
    }
    
    /*
    func remove(user: User) {
        viewContext.delete(user)
        do {
            try viewContext.save()
        } catch {
            print("Je n'ai pas réussi à sauvegarder les données: \(error)")
        }
    }
    */
    func getAllUsers() -> [User] {
        let request = NSFetchRequest<User>(entityName: "User")
        
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
    }
}
