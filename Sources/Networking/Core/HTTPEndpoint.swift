//
//  Copyright © 2022 Tomasz Załoga. All rights reserved.
//

import Foundation

protocol HTTPEndpoint {
    associatedtype Response: Decodable
    
    var url: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String] { get }
    var query: [String: String] { get }
    
    func decode(_ data: Data) throws -> Response
}

extension HTTPEndpoint {
    var headers: [String: String] { [:] }
    var query: [String: String] { [:] }
    
    func decode(_ data: Data) throws -> Response {
        let decoder = JSONDecoder()
        return try decoder.decode(Response.self, from: data)
    }
}
