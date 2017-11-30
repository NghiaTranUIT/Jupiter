//
//  CatalogViewModel.swift
//  ZaloraJupiterCore
//
//  Created by NghiaTran on 11/29/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation

public protocol CatalogViewModelProtocol {
    
    var input: CatalogViewModelInput { get }
    var output: CatalogViewModelOutput { get }
}

public protocol CatalogViewModelInput {
    
}

public protocol CatalogViewModelOutput {
    
}

public typealias CatalogViewModelType = CatalogViewModelProtocol & CatalogViewModelInput & CatalogViewModelOutput

public class CatalogViewModel: CatalogViewModelType {
    
    // MARK: Type
    public var input: CatalogViewModelInput { return self }
    public var output: CatalogViewModelOutput { return self }
}
