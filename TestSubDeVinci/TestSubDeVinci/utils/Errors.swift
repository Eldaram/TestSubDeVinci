//
//  utils:Errors.swift
//  TestSubDeVinci
//
//  Created by COURS on 19/04/2024.
//

import Foundation

enum Errors: String, LocalizedError {
    case noData = "There are no data"
    case noError = "There is no error." // For tests
    case decodingError = "Error while decoding"
    case invalidURL = "Not the right adress."
    case invalidStatusCode = "Invalid Status."
    case errorGenerated = "Error appeared"
    case empty = "Text empty"
    case isNil = "Url is nil"
    case strangeCaracters = "Strange Caracters"
    case noConnection = "No internet connection"
    case noMatch = "Strings don't match"
    case wrongCredentials = "Credentials doesn't work..."
    case usernameExist = "Username already exist"
    
    var errorDescription: String? {
        switch self {
            case .noData:
                return "Aucune donnée n'est renvoyée."
            case .noError:
                return "Tout va bien, pas d'erreur."
            case .decodingError:
                return "Le fichier renvoyé est endommagé."
            case .invalidURL:
                return "L'adresse internet est non conforme."
            case .invalidStatusCode:
                return "Le statut est invalide."
            case .errorGenerated:
                return "Erreur au moment de la requête réseau."
            case .empty:
                return "Vous n'avez rien écrit"
            case .isNil:
                return "L'url est à 'nil'"
            case .strangeCaracters:
                return "N'écrivez pas de caractères spéciaux"
            case .noConnection:
                return "Assurez-vous d'avoir une connexion internet pour enregister de nouveaux appareils"
            case .noMatch:
                return "Les valeurs entrés ne conresspondent pas"
            case .wrongCredentials:
                return "Le mot de passe ou le nom d'utilisteurs n'existent pas."
            case .usernameExist:
                return "Ce nom d'utilisateur existe déjà."
        }
    }
    var failureReason: String? {
        switch self {
            case .noData: return "Pas de données"
            case .noError:
                return "Pas d'erreur"
            case .decodingError:
                return "Erreur au décodage"
            case .invalidURL:
                return "Mauvaise adresse"
            case .invalidStatusCode:
                return "Statut invalide"
            case .errorGenerated:
                return "Erreur requête réseau"
            case .empty:
                return "Manque d'informations"
            case .isNil:
                return "Problème d'url"
            case .strangeCaracters:
                return "Pas de caractères spéciaux"
            case .noConnection:
                return "Pas de connexion"
            case .noMatch: 
                return "Ne correspond pas"
            case .wrongCredentials:
                return "Mauvais identifiants."
        case .usernameExist:
            return "Utilisateur déjà existant"
        }
    }
}
