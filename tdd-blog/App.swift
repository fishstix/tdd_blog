//
//  App.swift
//  tdd-blog
//
//  Created by Scott FIsher on 4/1/24.
//

public class App {

    var _isLoggedIn: Bool = false
    
    public init() {}
    
    public func login(username: String, password: String) {
        self._isLoggedIn = true
    }
    
    public func isLoggedIn() -> Bool {
        return self._isLoggedIn
    }
    
}
