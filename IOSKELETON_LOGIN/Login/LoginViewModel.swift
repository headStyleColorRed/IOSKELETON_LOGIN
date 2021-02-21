//
//  LoginViewModel.swift
//  IOSKELETON_LOGIN
//
//  Created by Rodrigo Labrador on 21/02/2021.
//

import Foundation

class LoginViewModel: ObservableObject {
	@Published var model = LoginModel()
	@Published var error: RequestResponse?
	
	private let manager = LoginManager()
	

}
// anita@gmail.com
// Navidad1

extension LoginViewModel {
	// MARK: - LOGIN
	func userLoginIntent(username: String, password: String) {
		guard userDataisValid(username: username, password: password, actionType: .login) else { return }
		
		manager.userLoginIntent(LoginModel(username: username, password: password)) { (response) in
			if response.code == "200" {
				print("Success!!!!")
			} else {
				self.error = RequestResponse(response: response)
			}
		} error: { (error) in
			// Handle Error
			print(error)
		}

	}
	
	// MARK: - REGISTER
	func userRegisterIntent(username: String, password: String) {
		guard userDataisValid(username: username, password: password, actionType: .signup) else { return }
		
		manager.userRegisterIntent(LoginModel(username: username, password: password)) { (response) in
			if response.code == "200" {
				print("Success!!!!")
			} else {
				self.error = RequestResponse(response: response)
			}
				
		} error: { (error) in
			// Handle Error
			print(error)
		}

	}
	
	private func userDataisValid(username: String, password: String, repeatPassword: String = "", actionType: NavigationFlow) -> Bool {
		// TODO: Must implement logic
		return true
	}
}
