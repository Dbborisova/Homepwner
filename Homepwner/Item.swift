//
//  Item.swift
//  Homepwner
//
//  Created by Desislava Borisova on 11/22/21.
//

import UIKit

class Item: NSObject{
    var name: String
    var valueInDollars: Int
    var dataCreated: Date
    
    init(name: String, valueInDollars: Int){
        self.name = name
        self.valueInDollars = valueInDollars
        self.dataCreated = Date()
        
        super.init()
    }
    
    convenience init(random: Bool = false) {
        if random{
            let adjectives = ["Fluffy", "Rusty", "Shiney"]
            let nouns = ["Bear", "Spork", "Mac"]
            
            var idx = arc4random_uniform(UInt32(adjectives.count))
            let randomAdjective = adjectives[Int(idx)]
            
            idx = arc4random_uniform(UInt32(nouns.count))
            let randomNoun = nouns[Int(idx)]
            
            let randomName = "\(randomAdjective) \(randomNoun)"
            let randomValue = Int(arc4random_uniform(100))
            
            self.init(name: randomName, valueInDollars: randomValue)
        }
        else
        {
            self.init(name: "", valueInDollars: 0)
            
        }
    }
}
