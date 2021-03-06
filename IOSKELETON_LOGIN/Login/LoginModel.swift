//
//  LoginModel.swift
//  IOSKELETON_LOGIN
//
//  Created by Rodrigo Labrador on 21/02/2021.
//

import Foundation

struct LoginModel {
	var username = String()
	var password = String()
}

struct RequestResponse: Identifiable {
	var code: String?
	var status: String?
	var data: String?
	var isError: Bool?
	var id: Int?
	
	init(response: RequestResponseDTO) {
		self.code = response.code
		self.status = response.status
		self.data = response.data
		self.isError = code != "200"
		self.id = Int(code ?? "0")
	}
	init (code: String? = "", status: String? = "", data: String? = "", isError: Bool? = false, id: Int? = 0) {
		self.code = code
		self.status = status
		self.data = data
		self.isError = isError
		self.id = id
	}
}
