//
//  ViewController.swift
//  StuffAccount
//
//  Created by 张东东 on 2017/4/11.
//  Copyright © 2017年 张东东. All rights reserved.
//

import UIKit

let K_WIDTH = UIScreen.main.bounds.size.width
let K_HEIGHT = UIScreen.main.bounds.size.height



class ViewController: UIViewController,CircleBtnViewDelegate,UITableViewDelegate,UITableViewDataSource {
    
    var titleImageView : UIImageView?
    var leftBtn :UIButton?
    var rightBtn :UIButton?
    var dayBtn :UIButton?
    var routineBtn :UIButton?
    var addAccountBtn : UIButton?
    var accounTableView : UITableView?
    var addBtn:CircleBtnView?
    var dataSource : [AccountModel]?
    
//    fileprivate lazy var dataSource : [AccountModel]? = {
//    
//    
//    
//    }
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = NSMutableArray() as? [AccountModel]
        initUI()

    
    }



}

extension ViewController{
    
    
    
    
     //初始化界面
    fileprivate func initUI(){
        
        automaticallyAdjustsScrollViewInsets = false
        
        self.titleImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: K_WIDTH, height: 190));
        self.titleImageView?.isUserInteractionEnabled = true
        let random = String(arc4random_uniform(13)+1)
        let backImage = "background".appending(random)
        self.titleImageView?.image = UIImage.init(named: backImage, in: nil, compatibleWith: nil)
        self.view.addSubview(self.titleImageView!)
       
        setUp()
     
        
        
    }

    
    fileprivate func setUp(){
        
        self.leftBtn = UIButton.init(type: .custom)
        self.leftBtn?.frame = CGRect.init(x: 10, y: 15, width: 40, height: 40)
        self.leftBtn?.setBackgroundImage(UIImage.init(named: "btn_menu", in: nil, compatibleWith: nil), for: .normal)
        self.titleImageView?.addSubview(self.leftBtn!)
        
        
        
        self.dayBtn = UIButton.init(type: .custom)
        self.dayBtn?.frame = CGRect.init(x: 55, y: 15, width: 40, height: 40)
//        self.dayBtn?.setBackgroundImage(UIImage.init(named: "btn_menu", in: nil, compatibleWith: nil), for: .normal)
        self.dayBtn?.setTitle("1 day", for: .normal)
        self.dayBtn?.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        self.dayBtn?.setTitleColor(UIColor.white, for: .normal)
        self.dayBtn?.layer.borderWidth = 1
        self.dayBtn?.layer.borderColor = UIColor.darkGray.cgColor
        self.dayBtn?.layer.cornerRadius = 20
        self.dayBtn?.layer.masksToBounds = true
        self.titleImageView?.addSubview(self.dayBtn!)
        
        
        self.routineBtn = UIButton.init(type: .custom)
        self.routineBtn?.frame = CGRect.init(x:(K_WIDTH-80)*0.5, y: 15, width: 80, height:35)
        self.routineBtn?.setTitle("时光账本", for: .normal)
        self.routineBtn?.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        self.routineBtn?.setTitleColor(UIColor.white, for: .normal)
        self.routineBtn?.layer.borderWidth = 2
        self.routineBtn?.layer.borderColor = UIColor.white.cgColor
        self.routineBtn?.layer.cornerRadius = 15
        self.routineBtn?.layer.masksToBounds = true
        self.titleImageView?.addSubview(self.routineBtn!)


        self.rightBtn = UIButton.init(type: .custom)
        self.rightBtn?.frame = CGRect.init(x: K_WIDTH-50, y: 15, width: 40, height: 40)
        self.rightBtn?.setBackgroundImage(UIImage.init(named: "btn_message", in: nil, compatibleWith: nil), for: .normal)
        self.titleImageView?.addSubview(self.rightBtn!)

     
        let tempView = TitleView.init(frame: CGRect.init(x: 0, y: 190, width: K_WIDTH, height: 40),color:UIColor.cyan)
         self.view.addSubview(tempView)

        
        self.addBtn = CircleBtnView.view()
        self.addBtn?.frame = CGRect.init(x: (K_WIDTH-80)*0.5, y: 150, width: 80, height: 80)
        self.addBtn?.delegate = self
        self.view.addSubview(self.addBtn!)
        
        
        self.accounTableView = UITableView.init(frame: CGRect.init(x: 0, y: 236, width: K_WIDTH, height: K_HEIGHT-236), style: .plain)
        self.accounTableView?.dataSource = self
        self.accounTableView?.delegate = self
        self.accounTableView?.separatorStyle  = .none
        self.accounTableView?.rowHeight = 65
        self.accounTableView?.register(UINib.init(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "ID")
        
        self.view.addSubview(self.accounTableView!)
        
        
    }
    
    
    
    
    
}

extension ViewController{

    func  addBtnClick(view:CircleBtnView){
        
         let incomeDict:[String:String] = ["income":"100000 工资", "outcome":"", "imageName":"type_big_0"]
         let outcomeDict:[String:String] = ["income":"","outcome":"买车 320000", "imageName":"type_big_0"]
        
        let model =  AccountModel.init(dic: incomeDict)
        let model2 =  AccountModel.init(dic: outcomeDict)
        
        self.dataSource?.append(model)
        self.dataSource?.append(model2)
        
        
        
        self.accounTableView?.reloadData()
       
        
    }
    
}



extension ViewController{

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
    
        return self.dataSource?.count ?? 0
    }
    
    
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = tableView.dequeueReusableCell(withIdentifier: "ID", for: indexPath) as! HomeTableViewCell
        
        cell.model = self.dataSource?[indexPath.row]
        
        return  cell
        
    }

}



