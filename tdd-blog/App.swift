//
//  App.swift
//  tdd-blog
//
//  Created by Scott FIsher on 4/1/24.
//

public class App {

    var _isLoggedIn: Bool = false
    
    let networkProtocol: NetworkProtocol
    
    public init(networkProtocol: NetworkProtocol) {
        self.networkProtocol = networkProtocol
    }
    
    public func login(username: String, password: String) {
        self.networkProtocol.performPost(
            url: "www.company.com",
            params: [
                "username": username,
                "password": password
            ]
        ) { statusCode, body in
            self._isLoggedIn = statusCode == 200
        }
    }
    
    public func isLoggedIn() -> Bool {
        return self._isLoggedIn
    }
    
}
