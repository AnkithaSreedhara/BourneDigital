//
//  NetworkManager.swift
//  BourneDigital
//
//  Created by Sai Ankitha Sreedhara on 13/10/21.
//
import Foundation
class NetworkManager {
    func fetchMovies(completionHandler: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = ApiConstants.moviesURLPath else {
            // TODO: CREATE NEW ERROR TYPE
            //            completionHandler(.failure(let error))
            return
        }

        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            if let error = error {
                print("Error with fetching films: \(error)")
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                  (200 ... 299).contains(httpResponse.statusCode)
            else {
                print("Error with the response, unexpected status code: \(String(describing: response))")
                // TODO: CREATE NEW ERROR TYPE AND FAILURE COMPLETION HANDLER
                return
            }

            if let data = data,
               let respSummary = try? JSONDecoder().decode(Response.self, from: data)
            {
                completionHandler(.success(respSummary.movies))
            }
        })
        task.resume()
    }
}
