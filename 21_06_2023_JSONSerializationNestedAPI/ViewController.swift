//
//  ViewController.swift
//  21_06_2023_JSONSerializationNestedAPI
//
//  Created by Vishal Jagtap on 02/08/23.
//

import UIKit

class ViewController: UIViewController {

    var url : URL?
    var urlResuest : URLRequest?
    var urlSession : URLSession?
    var products : [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var urlString = "https://fakestoreapi.com/products"
        url = URL(string: urlString)
        
        urlResuest = URLRequest(url: url!)
        urlResuest?.httpMethod = "GET"
        
        urlSession = URLSession(configuration: .default)
        
        parseJSON(urlRequest: urlResuest!, urlSession: urlSession!)
    }
    
    
    func parseJSON(urlRequest : URLRequest, urlSession : URLSession){
        
        var dataTask = urlSession.dataTask(with: urlResuest!){ data, response, error in
            
            let jsonResponse = try! JSONSerialization.jsonObject(with: data!) as! [[String : Any]]
            
            print(response)
            for eachJSONOBject in jsonResponse{
                let productObject = eachJSONOBject
                let id = productObject["id"] as! Int
                let title = productObject["title"] as! String
                let price = productObject["price"] as! Double
                let description = productObject["description"] as! String
                let category = productObject["category"] as! String
                
                let rating = productObject["rating"] as! [String:Any]
                let rate = rating["rate"] as! Double
                let count = rating["count"] as! Int
                
                let newRating = Rating(productRate: rate,
                                       productCount: count
                )
                
                let newProduct = Product(
                    productId: id,
                    productTitle: title,
                    productPrice: price,
                    productDescription: description,
                    productCategory: category,
                    productImage: nil,
                    productRating: newRating
                    )
                
                self.products.append(newProduct)
                
            }
        }
        dataTask.resume()
    }


}
