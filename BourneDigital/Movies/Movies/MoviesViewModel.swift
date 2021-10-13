//
//  MoviesViewModel.swift
//  BourneDigital
//
//  Created by Sai Ankitha Sreedhara on 13/10/21.
//

import Foundation
import OpenCombine

final class MoviesViewModel {
    let moviesRetrieved = PassthroughSubject<[Movie],Error>()
    
    func fetchMovies(){
        NetworkManager().fetchMovies { [weak self] result in
            guard let weakself = self else { return }
            switch result{
            case .success(let movies):
                weakself.moviesRetrieved.send(movies)
            case .failure:
                // TODO: HANDLE ERROR
                break
                
            }
        }
    }
}
