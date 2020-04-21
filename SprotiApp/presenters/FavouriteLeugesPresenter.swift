//
//  FavouriteLeugesPresenter.swift
//  SprotiApp
//
//  Created by saraMohamed on 4/20/20.
//  Copyright © 2020 saraMohamed. All rights reserved.
//

import Foundation
class FavouriteLeugePresenter {
    var favouriteLeugeDelegate: FavouriteLeugesDelegate
    var network:DatabaseServiceProtocol
    
    init (favouriteLeugeDelegate: FavouriteLeugesDelegate){
        self.favouriteLeugeDelegate = favouriteLeugeDelegate 
        network = DatabaseService.INSTANCE
    }
    
    func fetchFavouriteLeuges() {
        network.fetchAllFavouriteLeuges(delegate: favouriteLeugeDelegate)
}
}

