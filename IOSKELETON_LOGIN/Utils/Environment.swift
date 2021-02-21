//
//  Environment.swift
//  IOSKELETON_LOGIN
//
//  Created by Rodrigo Labrador on 21/02/2021.
//

import SwiftUI

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
