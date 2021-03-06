//
//  User.swift
//  ListaTelefonica
//
//  Created by Lilian Amorim on 18/07/2018.
//  Copyright © 2018 lais amorim menezes. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class User: Object, Mappable {
    
    var id = RealmOptional<Int>()
    // Double, Float, Int, Bool -> RealmOpntion<>()
    
    @objc dynamic var email: String?
    @objc dynamic var accessToken: String?
    @objc dynamic var client: String?
    @objc dynamic var uid: String?
    
    required convenience init?(map :Map){
       self.init()
    }
    
    override static func primaryKey() -> String?{
        return "id"
    }
    
    func mapping(map: Map){
        
        self.id <- map["id"]
        self.email <- map["email"]
    }
    
}
extension User{
    func setHeaderParams(header: [AnyHashable: Any]?){
        
        guard let header = header else{
            return
        }
        if let uid = header["Uid"] as? String{
            self.uid = uid
        }
        if let client = header["Client"] as? String {
        self.client = client
        }
        if let accessToken = header["Access-Token"] as? String{
            self.accessToken = accessToken
        }
    }
}
