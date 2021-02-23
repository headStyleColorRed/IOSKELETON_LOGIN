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
	@Published var loading = Bool()
	
	private let manager = LoginManager()
	

}
// anita@gmail.com
// Navidad1

extension LoginViewModel {
	// MARK: - LOGIN
	func userLoginIntent(username: String, password: String) {
		guard userDataisValid(username: username, password: password, actionType: .login) else { return }
		
		loading = true
		manager.userLoginIntent(LoginModel(username: username, password: password)) { (response) in
			self.loading = false
			if response.code == "200" {
				print("Success!!!!")
			} else {
				self.error = RequestResponse(response: response)
			}
		} error: { (error) in
			self.loading = false
			print(error)
		}

	}
	
	// MARK: - REGISTER
	func userRegisterIntent(username: String, password: String) {
		guard userDataisValid(username: username, password: password, actionType: .signup) else { return }
		
		loading = true
		manager.userRegisterIntent(LoginModel(username: username, password: password)) { (response) in
			self.loading = false
			if response.code == "200" {
				print("Success!!!!")
			} else {
				self.error = RequestResponse(response: response)
			}
				
		} error: { (error) in
			self.loading = false
			print(error)
		}

	}
	
	private func userDataisValid(username: String, password: String, repeatPassword: String = "", actionType: NavigationFlow) -> Bool {
		// TODO: Must implement logic
		return true
	}
}
