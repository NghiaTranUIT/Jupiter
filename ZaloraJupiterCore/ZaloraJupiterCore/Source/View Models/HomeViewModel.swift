//
//  HomeViewModel.swift
//  ZaloraJupiterCore
//
//  Created by NghiaTran on 11/28/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation

protocol HomeViewModelProtocol {
    
    var input: HomeViewModelInput { get }
    var output: HomeViewModelOutput { get }
}

protocol HomeViewModelInput {
    
}

protocol HomeViewModelOutput {
    
}

typealias HomeViewModelType = HomeViewModelProtocol & HomeViewModelInput & HomeViewModelOutput

class HomeViewModel: HomeViewModelType {
    
    // MARK: View model
    var input: HomeViewModelInput { return self }
    var output: HomeViewModelOutput { return self }
    
    init() {
        
    }
}
