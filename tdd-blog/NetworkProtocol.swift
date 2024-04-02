//
//  NetworkProtocol.swift
//  tdd-blog
//
//  Created by Scott FIsher on 4/1/24.
//

public protocol NetworkProtocol {
    func performPost(
        url: String,
        params: [String: String],
        callback: @escaping ((Int, [AnyHashable: Any]) -> Void)
    )
}
