//
//  Networking.swift
//  CodeArt
//
//  Created by Willian Guedes on 08/11/20.
//

import Foundation

protocol NetworkSession {
    func get(from url: URL, completitionHandler: @escaping (Data?, Error?) -> Void)
    func post(with request: URLRequest, completetionHandler: @escaping (Data?, Error?) -> Void)
}

extension URLSession: NetworkSession {
    func post(with request: URLRequest, completetionHandler: @escaping (Data?, Error?) -> Void) {
        let task = dataTask(with: request) { data, _, error in
            completetionHandler(data, error)
        }
        task.resume()
    }
    
    func get(from url: URL, completitionHandler: @escaping (Data?, Error?) -> Void) {
        let task = dataTask(with: url) { data, _, error in
            completitionHandler(data, error)
        }
        task.resume()
    }
}

extension CodeArt {
    public class Networking {
        
        /// Responsible for handling all networking calls
        /// - Warning: Must create before using any public API's
        public class Manager {
            public init() {}
            
            internal var session : NetworkSession = URLSession.shared
            
            /// Calls to the live internet to retrieve Data from a specific location
            /// - Parameters:
            ///   - url: The location you wish to fetch data from
            ///   - completionHandler: Returns a result object which signifies the status of the request
            public func loadData (from url: URL, completionHandler: @escaping(NetworkResult<Data>) -> Void) {
                session.get(from: url, completitionHandler: { data, error in
                    let result = data.map(NetworkResult<Data>.success) ?? .failure(error)
                    completionHandler(result)
                })
            }
            
            
            /// Calls to the live internet to send data to a specific location
            /// - Warning: Make sure that the URL in question can accept a POST route
            /// - Parameters:
            ///   - url: The location you wish to send data to
            ///   - body: The object you wish to send over the network
            ///   - completitionHandler: Returns a result object which signifies the status  of the request
            public func sendData<I: Codable> (to url: URL, body: I, completitionHandler: @escaping (NetworkResult<Data>) -> Void) {
                var request = URLRequest(url: url)
                
                do {
                    let httpBody = try JSONEncoder().encode(body)
                    request.httpBody = httpBody
                    request.httpMethod = "POST"
                    session.post(with: request, completetionHandler: {data, error in
                        let result = data.map(NetworkResult<Data>.success) ?? .failure(error)
                        completitionHandler(result)
                    })
                } catch let error {
                    return completitionHandler(.failure(error))
                }
            }
        }
        
        public enum NetworkResult<Value> {
            case success(Value)
            case failure(Error?)
        }
        
    }
}
