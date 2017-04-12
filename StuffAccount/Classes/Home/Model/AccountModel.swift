//
//  AccountModel.swift
//  StuffAccount
//
//  Created by 张东东 on 2017/4/12.
//  Copyright © 2017年 张东东. All rights reserved.
//

import UIKit

class AccountModel: NSObject {
    
    
    var income: String?
    var outcome: String?
    var imageName: String?
    init(dic: [String: Any]) {
        super.init()
        setValuesForKeys(dic)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }


}
