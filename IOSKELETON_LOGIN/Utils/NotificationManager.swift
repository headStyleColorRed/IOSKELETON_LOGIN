//
//  NotificationManager.swift
//  IOSKELETON_LOGIN
//
//  Created by Rodrigo Labrador on 23/02/2021.
//

import Foundation

public extension Notification.Name {
	static var login = Notification.Name("login")
}

public struct LoginNotification {
	public var isSuccess: Bool
	public var userName: String
}
