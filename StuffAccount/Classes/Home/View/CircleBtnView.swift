//
//  CircleBtnView.swift
//  StuffAccount
//
//  Created by 张东东 on 2017/4/12.
//  Copyright © 2017年 张东东. All rights reserved.
//




import UIKit


protocol CircleBtnViewDelegate{

    func addBtnClick(view:CircleBtnView)
}

class CircleBtnView: UIView {
    
   var delegate : CircleBtnViewDelegate?
    @IBOutlet weak var addBtn: UIButton!
    
    class func view() -> CircleBtnView {
    
        return Bundle.main.loadNibNamed("CircleBtnView", owner: self, options: nil)!.first as! CircleBtnView
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = self.frame.size.width*0.5
        self.layer.masksToBounds = true
//        self.addBtn.layer.setAffineTransform(CGAffineTransform.init(rotationAngle: CGFloat(Double.pi*0.25)))
        
    }
    
    @IBAction func addBtnClick(_ sender: UIButton) {
        // ? 代表判断了代理是否实现
        delegate?.addBtnClick(view: self)
        
    }

}
