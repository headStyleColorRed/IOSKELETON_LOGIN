//
//  FirebaseLoginManager.swift
//  IOSKELETON_LOGIN
//
//  Created by Rodrigo Labrador on 24/02/2021.
//

import Foundation
import Firebase

class FirebaseLoginManager: LoginManager {
	var baseURL: String
	
	init(baseUrl: String) {
		self.baseURL = baseUrl
	}
	
	func userLoginIntent(_ userLoginData: LoginModel, succes: @escaping (RequestResponseDTO) -> (), error: @escaping (String?) -> ()) {
		Auth.auth().signIn(withEmail: userLoginData.username, password: userLoginData.password) { (authResult, firebaseError) in
			if let err = firebaseError as NSError? {
				switch AuthErrorCode(rawValue: err.code) {
				case .operationNotAllowed:
					error("Indicates that email and password accounts are not enabled. Enable them in the Auth section of the Firebase console.")
				case .userDisabled:
					error("The user account has been disabled by an administrator.")
				case .wrongPassword:
					error("The password is invalid or the user does not have a password.")
				case .invalidEmail:
					error("Indicates the email address is malformed.")
				default:
					error("Error: \(err.localizedDescription)")
				}
			} else {
				guard let userInfo = Auth.auth().currentUser, let email = userInfo.email else {
					error("Sign-up correct but data corrupted")
					return
				}
				succes(RequestResponseDTO(JSON: ["code": "200", "status": "Login succesfull", "data" : email])!)
			}
		}
	}
	
	func userRegisterIntent(_ userLoginData: LoginModel, succes: @escaping (RequestResponseDTO) -> (), error: @escaping (String?) -> ()) {
		Auth.auth().createUser(withEmail: userLoginData.username, password: userLoginData.password) { authResult, firebaseError in
			if let err = firebaseError as NSError? {
				switch AuthErrorCode(rawValue: err.code) {
				case .operationNotAllowed:
					error("The given sign-in provider is disabled for this Firebase project. Enable it in the Firebase console, under the sign-in method tab of the Auth section.")
				case .emailAlreadyInUse:
					error("The email address is already in use by another account.")
				case .invalidEmail:
					error("The email address is badly formatted.")
				case .weakPassword:
					error("The password must be 6 characters long or more.")
				default:
					error("Error: \(err.localizedDescription)")
				}
			} else {
				guard let newUserInfo = Auth.auth().currentUser, let email = newUserInfo.email else {
					error("Sign-up correct but data corrupted")
					return
				}
				succes(RequestResponseDTO(JSON: ["code": "200", "status": "Register succesfull", "data" : email])!)
			}
		}
	}
}
