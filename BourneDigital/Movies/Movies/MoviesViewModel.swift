//
//  MoviesViewModel.swift
//  BourneDigital
//
//  Created by Sai Ankitha Sreedhara on 13/10/21.
//

import Foundation
protocol MoviesRespFetchProtocol: AnyObject {
    func moviesFetched()
}
final class MoviesViewModel {
    weak var moviesRespFetchProtocolDelegate: MoviesRespFetchProtocol?
    var moviesArray = [Movie]()
    init(delegate: MoviesRespFetchProtocol) {
        moviesRespFetchProtocolDelegate = delegate
    }
    func fetchMovies() {
        NetworkManager().fetchMovies { [weak self] result in
            guard let weakself = self else { return }
            switch result {
            case let .success(movies):
                weakself.moviesArray = movies
                weakself.moviesRespFetchProtocolDelegate?.moviesFetched()
            case .failure:
                // TODO: HANDLE ERROR
                break
            }
        }
    }
}
