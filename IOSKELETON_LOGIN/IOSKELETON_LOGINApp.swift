//
//  IOSKELETON_LOGINApp.swift
//  IOSKELETON_LOGIN
//
//  Created by Rodrigo Labrador on 19/02/2021.
//

import SwiftUI
import Firebase

@main
struct IOSKELETON_LOGINApp: App {
	init() {
	  FirebaseApp.configure()
	}
	
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
