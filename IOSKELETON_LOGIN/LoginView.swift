//
//  LoginView.swift
//  IOSKELETON_LOGIN
//
//  Created by Rodrigo Labrador on 19/02/2021.
//

import SwiftUI

enum InputTypes {
	case user
	case password
	case repeatPassword
}

enum NavigationFlow {
	case login
	case signin
}

public struct LoginView: View {
	public var body: some View {
		NavigationView {
			Login()
				.preferredColorScheme(.dark)
				.navigationBarHidden(true)
		}
	}
	
	public init() {}
}

struct Login: View {
	@State var userName = String()
	@State var password = String()
	
	var body: some View {
		HStack {
			VStack(alignment: .leading) {
				// Logo
				Logo()
				
				// Presentation
				PresentScreen()
				
				// Inputs
				InputField(type: .user)
				InputField(type: .password)
				
				// Submit
				SubmitButton(type: .login)
				
				
				Spacer(minLength: 0)
			}
			Spacer(minLength: 0)
		}
		.background(Color("Background", bundle: LOGIN_BUNDLE.bundle).ignoresSafeArea(.all, edges: .all))
	}
}

// MARK: - Logo
struct Logo: View {
	var body: some View {
		HStack {
			Spacer()
			Image("agile", bundle: LOGIN_BUNDLE.bundle)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 250)
			Spacer()
		}
	}
}

// MARK: - Screen Presentation
struct PresentScreen: View {
	var body: some View {
		VStack(alignment: .leading, spacing: 12, content: {
			Text("Login")
				.font(.title)
				.fontWeight(.bold)
				.foregroundColor(.white)
			Text("Please sign in to continue").foregroundColor(Color.white.opacity(0.5))
		}).padding(20)
	}
}

// MARK: - Inputs
struct InputField: View {
	@State var fieldValue = String()
	let iconName: String
	let textFieldName: String
	
	var body: some View {
		VStack {
			HStack {
				Image(systemName: iconName).font(.title2).foregroundColor(.white)
				TextField(textFieldName, text: $fieldValue)
			}
		}
		.padding()
		.background(Color.white.opacity(fieldValue.isEmpty ? 0 : 0.12))
		.cornerRadius(15)
		.padding(.horizontal, 20)
		.padding(.vertical, 5)
	}
	
	init(type: InputTypes) {
		switch type {
		case .user:
			iconName = "envelope"
			textFieldName = "EMAIL"
		case .password:
			iconName = "lock"
			textFieldName = "PASSWORD"
		case .repeatPassword:
			iconName = "envelope"
			textFieldName = "EMAIL"
		}
	}
}

// MARK: - Submit Button
struct SubmitButton: View {
	let submitLabel: String
	
	var body: some View {
		
		Spacer()
		HStack {
			Spacer()
			Text(submitLabel)
				.fontWeight(.heavy)
				.foregroundColor(.black)
				.padding(.vertical)
				.frame(width: UIScreen.main.bounds.width - 150)
				.background(Color("Submit"))
			Spacer()
		}
		
	}
	
	init(type: NavigationFlow) {
		switch type {
		case .login:
			submitLabel = "LOGIN"
		case .signin:
			submitLabel = "SIGN IN"
		}
	}
}








struct LoginView_Previews: PreviewProvider {
	static var previews: some View {
		LoginView()
	}
}
