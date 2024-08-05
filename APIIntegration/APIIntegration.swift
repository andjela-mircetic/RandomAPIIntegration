//
//  APIIntegration.swift
//  APIIntegration
//
//  Created by Andjela Mircetic on 3.8.24..
//

import Foundation

public struct RandomOrgResponse<T: Decodable>: Decodable {
    let result: T
}

public struct RandomData<T: Decodable>: Decodable {
    let random: RandomResult<T>
}

public struct RandomResult<T: Decodable>: Decodable {
    let data: T
}

@objc public class RandomOrgAPI: NSObject {
    private let apiKey = "a3429d40-d454-4403-a78d-e9a8d008a3e8"
    private let baseURL = "https://api.random.org/json-rpc/4/invoke"
    
    private func makeRequest<T: Decodable>(method: String, params: [String: Any], completion: @escaping (T?) -> Void) {
        var requestParams = params
        requestParams["apiKey"] = apiKey
        let body: [String: Any] = [
            "jsonrpc": "2.0",
            "method": method,
            "params": requestParams,
            "id": 1
        ]
        
        guard let url = URL(string: baseURL),
              let httpBody = try? JSONSerialization.data(withJSONObject: body, options: []) else {
            print("Error creating request body")
            completion(nil)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = httpBody
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("No data received")
                completion(nil)
                return
            }
            
            print("Raw response data: \(String(data: data, encoding: .utf8) ?? "Invalid data")")
            
            if let response = try? JSONDecoder().decode(RandomOrgResponse<RandomData<T>>.self, from: data) {
                completion(response.result.random.data)
            } else {
                print("Error decoding response")
                completion(nil)
            }
        }.resume()
    }
    
    @objc public func generateIntegers(n: Int, min: Int, max: Int, completion: @escaping ([Int]?) -> Void) {
        let params: [String: Any] = ["n": n, "min": min, "max": max]
        makeRequest(method: "generateIntegers", params: params, completion: completion)
    }
    
    @objc public func generateIntegerSequences(n: Int, length: Int, min: Int, max: Int, completion: @escaping ([[Int]]?) -> Void) {
        let params: [String: Any] = ["n": n, "length": length, "min": min, "max": max]
        makeRequest(method: "generateIntegerSequences", params: params, completion: completion)
    }
    
    @objc public func generateDecimalFractions(n: Int, decimalPlaces: Int, completion: @escaping ([Double]?) -> Void) {
        let params: [String: Any] = ["n": n, "decimalPlaces": decimalPlaces]
        makeRequest(method: "generateDecimalFractions", params: params, completion: completion)
    }
    
    @objc public func generateGaussians(n: Int, mean: Double, standardDeviation: Double, significantDigits: Int, completion: @escaping ([Double]?) -> Void) {
        let params: [String: Any] = ["n": n, "mean": mean, "standardDeviation": standardDeviation, "significantDigits": significantDigits]
        makeRequest(method: "generateGaussians", params: params, completion: completion)
    }
    
    @objc public func generateStrings(n: Int, length: Int, characters: String, completion: @escaping ([String]?) -> Void) {
        let params: [String: Any] = ["n": n, "length": length, "characters": characters]
        makeRequest(method: "generateStrings", params: params, completion: completion)
    }
    
    @objc public func generateUUIDs(n: Int, completion: @escaping ([String]?) -> Void) {
        let params: [String: Any] = ["n": n]
        makeRequest(method: "generateUUIDs", params: params, completion: completion)
    }
    
    @objc public func generateBlobs(n: Int, size: Int, format: String, completion: @escaping ([String]?) -> Void) {
        let params: [String: Any] = ["n": n, "size": size, "format": format]
        makeRequest(method: "generateBlobs", params: params, completion: completion)
    }
    
    @objc public func verifySignature(randomData: String, signature: String, completion: @escaping (Bool) -> Void) {
        let params: [String: Any] = ["random": randomData, "signature": signature]
        makeRequest(method: "verifySignature", params: params)//, completion: completion)
                    { (result: Bool?) in
            completion(result ?? false)
        }
    }
    
    @objc public func getUsage(completion: @escaping (String?) -> Void) {
        let params: [String: Any] = [:]
        makeRequest(method: "getUsage", params: params, completion: completion)
    }
}
