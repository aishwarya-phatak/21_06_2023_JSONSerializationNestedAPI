//
//  Product.swift
//  21_06_2023_JSONSerializationNestedAPI
//
//  Created by Vishal Jagtap on 02/08/23.
//

import Foundation

//struct APIResponseForProducts{
//    var products : [Product]
//}

struct Product{
    var productId : Int
    var productTitle : String
    var productPrice : Double
    var productDescription : String
    var productCategory : String
    var productImage : String?
    var productRating : Rating
}

struct Rating {
    var productRate : Double
    var productCount : Int
}
