//
//  TestEnvironment.swift
//  tdd-blogTests
//
//  Created by Scott FIsher on 4/1/24.
//

import tdd_blog

class TestEnvironment {

    var app: App!
    
    func launchApp() {
        self.app = .init(
            networkProtocol: TestNetworkEnvironment.init()
        )
    }
    
    func login() {
        self.app.login(
            username: "test@company.com",
            password: "abc123"
        )
    }
    
    func loginWithIncorrectCredentials() {
        self.app.login(
            username: "test@company.com",
            password: "password"
        )
    }
    
    func isLoggedIn() -> Bool {
        return self.app.isLoggedIn()
    }
    
}
