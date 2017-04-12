//
//  TitleView.swift
//  StuffAccount
//
//  Created by 张东东 on 2017/4/11.
//  Copyright © 2017年 张东东. All rights reserved.
//

import UIKit

class TitleView: UIView {


    var expenditure : UILabel?
    var earning : UILabel?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    convenience  init(frame: CGRect, color : UIColor) {
         self.init(frame: frame)
        
        self.backgroundColor = color
        
        
        initUI()
    }

    
    
    
    override func layoutSubviews() {
        self.expenditure?.frame =  CGRect.init(x: 10, y: 0, width: 100, height: 40)
        self.earning?.frame = CGRect.init(x: K_WIDTH-120, y: 0, width: 100, height: 40)
    }

}


extension TitleView{
    
    fileprivate func initUI(){
    
        self.expenditure = UILabel.init()
        self.expenditure?.textColor = UIColor.gray
        self.expenditure?.font = UIFont.systemFont(ofSize: 14)
        self.expenditure?.textAlignment = .left
        self.expenditure?.text = "当月收入\n300000"
        self.expenditure?.numberOfLines = 0
        self.addSubview(self.expenditure!)
        
        
        self.earning = UILabel.init()
        self.earning?.textColor = UIColor.gray
        self.earning?.font = UIFont.systemFont(ofSize: 14)
        self.earning?.text = "当月支出\n300000"
        self.earning?.textAlignment = .right
        self.earning?.numberOfLines = 0
        addSubview(self.earning!)

    
    }

}



