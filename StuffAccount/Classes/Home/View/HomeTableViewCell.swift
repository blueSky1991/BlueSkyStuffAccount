//
//  HomeTableViewCell.swift
//  StuffAccount
//
//  Created by 张东东 on 2017/4/12.
//  Copyright © 2017年 张东东. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var rightDesc: UILabel!
    @IBOutlet weak var leftDesc: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    
    var  model : AccountModel?{
    
        didSet{
        
            if (model?.income?.isEmpty)!{
                self.leftDesc.isHidden = true
            }else{
                self.leftDesc.isHidden = false
                self.leftDesc.text = model?.income
                
            }
            
            
            if (model?.outcome?.isEmpty)!{
                self.rightDesc.isHidden = true
            }else{
                self.rightDesc.isHidden = false
                self.rightDesc.text = model?.outcome
                
            }

            self.img.image = UIImage.init(named: (model?.imageName)!)
            
        }
    
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
