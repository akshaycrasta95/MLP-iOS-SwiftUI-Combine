//
//  Network.swift
//  MLP-1
//
//  Created by Akshay.Crasta on 19/12/22.
//

import Foundation

class NetworkManager {
    var urlSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    static let shared = NetworkManager()
    
    var people: [Person] = []
    var errorMessage = ""
    
    func getPeopleData(urlString: String?, completion: @escaping ([Person]?, CustomError) -> Void) {
        dataTask?.cancel()
        guard let url = URL(string: urlString ?? "") else { return }
        
        dataTask = urlSession.dataTask(with: url) { [weak self] data, response, error in
            if let _ = error {
                completion(nil, .error)
                return
            }
            
            guard let data = data else {
                completion(nil, .error)
                return
            }
            
            do {
                let peopleData = try JSONDecoder().decode(PeopleData.self, from: data)
                completion(peopleData.people, .noError)
            } catch {
                completion(nil, .error)
            }
        }
        dataTask?.resume()
    }
}


enum CustomError: String, Error {
    
    case error = "error"
    case noError
}
