//
//  TestNetworkEnvironment.swift
//  tdd-blogTests
//
//  Created by Scott FIsher on 4/1/24.
//

import tdd_blog

class TestNetworkEnvironment: NetworkProtocol {

    func performPost(
        url: String,
        params: [String: String],
        callback: ((Int, [AnyHashable: Any]) -> Void)
    ) {
        guard
            url == "www.company.com/auth",
            let username = params["username"],
            let password = params["password"],
            username == "test@company.com",
            password == "abc123" else {
            callback(403, [:])
            return
        }
        
        callback(200, ["auth": "token"])
    }
    
}
