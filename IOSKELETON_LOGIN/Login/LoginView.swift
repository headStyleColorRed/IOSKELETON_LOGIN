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
	case signup
}

// MARK: - Environment
public struct PrimaryColor: EnvironmentKey {
	public static var defaultValue: Color = { return Color("Background", bundle: LOGIN_BUNDLE.bundle) }()
}
public struct SecondaryColor: EnvironmentKey {
	public static var defaultValue: Color = { return Color("Submit", bundle: LOGIN_BUNDLE.bundle) }()
}



public extension EnvironmentValues {
	var primaryColor: Color {
		get { self[PrimaryColor.self] }
		set { self[PrimaryColor.self] = newValue }
	}
	
	var secondaryColor: Color {
		get { self[SecondaryColor.self] }
		set { self[SecondaryColor.self] = newValue }
	}
}


// MARK: - Main view
public struct LoginView: View {
	@State var userName = String()
	@State var password = String()
	@State var repeatPassword = String()
	@State var currentView: NavigationFlow = .signup
	@Environment(\.primaryColor) var primaryColor
	
	public var body: some View {
		HStack {
			VStack(alignment: .leading) {
				// Logo
				Logo()
				
				// Presentation
				PresentScreen(currentScreent: currentView)
				
				// Inputs
				InputField(userFromParent: $userName, inputType: .user)
				InputField(userFromParent: $password, inputType: .password)
				if currentView == .signup {
					InputField(userFromParent: $repeatPassword, inputType: .repeatPassword)
				}
				
				// Submit
				SubmitButton(currentScreen: currentView, action: { submitAction() })
				
				// Navigation
				Spacer(minLength: 0)
				ActionNavigation(currentScreen: currentView, changeNavigation: changeNavigation)
				
			}
			Spacer(minLength: 0)
		}
		.background(primaryColor.ignoresSafeArea(.all, edges: .all))
	}
	
	private func submitAction() {
		print("User: \(userName), and password: \(password)")
	}
	
	private func changeNavigation() {
		currentView = currentView == .login ? .signup : .login
	}

	
	public init() {}
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
		}.padding()
	}
}

// MARK: - Screen Presentation
struct PresentScreen: View {
	let currentScreent: NavigationFlow
	
	var headerTitleText: String {
		currentScreent == .login ? "Login" : "Sign up"
	}
	var subHeaderText: String {
		currentScreent == .login ? "Please log in to continue" : "Please sign up to continue"
	}
	
	var body: some View {
		VStack(alignment: .leading, spacing: 12, content: {
			Text(headerTitleText)
				.font(.title)
				.fontWeight(.bold)
				.foregroundColor(.white)
			Text(subHeaderText).foregroundColor(Color.white.opacity(0.5))
		}).padding(20)
	}
}

// MARK: - Inputs
struct InputField: View {
	@Binding var userFromParent: String
	
	let inputType: InputTypes
	
	var body: some View {
		VStack {
			HStack {
				Image(systemName: icon()).font(.title2).foregroundColor(.white).frame(width: 30)
				if inputType == .user {
					TextField(textlabel(), text: $userFromParent)
				} else {
					SecureField(textlabel(), text: $userFromParent)
				}
			}
		}
		.padding()
		.background(Color.white.opacity(userFromParent.isEmpty ? 0 : 0.12))
		.cornerRadius(15)
		.padding(.horizontal, 20)
		.padding(.vertical, 5)
	}
	
	func icon() -> String {
		switch inputType {
		case .user:
			return "envelope"
		case .password:
			return "lock"
		case .repeatPassword:
			return "lock"
		}
	}
	
	func textlabel() -> String {
		switch inputType {
		case .user:
			return "EMAIL"
		case .password:
			return "PASSWORD"
		case .repeatPassword:
			return "REPEAT PASSWORD"
		}
	}
}

// MARK: - Submit Button
struct SubmitButton: View {
	@Environment(\.secondaryColor) var secondaryColor
	let currentScreen: NavigationFlow
	let submitAction: () -> Void
	
	
	var submitLabel: String {
		currentScreen == .login ? "LOGIN" : "SIGN UP"
	}
	
	var body: some View {
		
		Spacer()
		VStack {
			HStack {
				Spacer()
				Text(submitLabel)
					.fontWeight(.heavy)
					.foregroundColor(.white)
					.padding(.vertical)
					.frame(width: UIScreen.main.bounds.width - 150)
					.background(secondaryColor)
					.clipShape(Capsule())
					.onTapGesture(count: 1) {
						submitAction()
					}
				Spacer()
			}
			if currentScreen == .login {
				Button("Forgot password?") {
					print("Forgot password indeed")
				}
				.padding(.top, 5)
				.foregroundColor(secondaryColor)
			}

		}
	}
	
	init(currentScreen: NavigationFlow, action: @escaping () -> Void) {
		self.currentScreen = currentScreen
		submitAction = action
	}
}

// MARK: - Change Navigation
struct ActionNavigation: View {
	@Environment(\.secondaryColor) var secondaryColor
	let currentScreen: NavigationFlow
	let changeNavigation: () -> Void
	
	var descriptionLabel: String {
		currentScreen == .login ? "Don't have an account?" : "Do you have already an account?"
	}
	var actionButtonLabel: String {
		currentScreen == .login ? "Sign up" : "Log in"
	}
	
	var body: some View {
		HStack {
			Spacer()
			Text(descriptionLabel)
			Button(actionButtonLabel) {
				changeNavigation()
			}.foregroundColor(secondaryColor)
			Spacer()
		}
	}
}







struct LoginView_Previews: PreviewProvider {
	static var previews: some View {
		LoginView()
	}
}
