//
//  AlamofireNetworkProtocol.swift
//  tdd-blog
//
//  Created by Scott FIsher on 4/1/24.
//

import Alamofire

class AlamofireNetworkProtocol: NetworkProtocol {
    
    let alamofireSession: Alamofire.Session
    
    init() {
        let config = URLSessionConfiguration.af.ephemeral
        self.alamofireSession = Alamofire.Session(configuration: config)
    }
    
    func performPost(
        url: String,
        params: [String : String],
        callback: @escaping ((Int, [AnyHashable : Any]) -> Void)
    ) {
        var urlRequest: URLRequest = try! .init(
            url: url,
            method: .post
        )
        let jsondata = try! JSONSerialization.data(
            withJSONObject: params,
            options: .prettyPrinted
        )
        urlRequest.httpBody = jsondata
        self.alamofireSession
            .request(urlRequest)
            .validate()
            .responseJSON(
                completionHandler: { response in
                    switch response.result {
                    case let .success(value):
                        guard let value = value as? [AnyHashable: Any] else {
                            callback(500, [:])
                            return
                        }
                        
                        callback(
                            response.response!.statusCode,
                            value
                        )
                    case let .failure(error):
                        callback(response.response?.statusCode ?? 500, [:])
                    }
                }
            )
    }

}
