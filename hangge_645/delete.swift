//
//  File.swift
//  hangge_645
//
//  Created by l20141105048 on 16/7/11.
//  Copyright © 2016年 hangge.com. All rights reserved.
//

import UIKit

class delete: UIViewController {
    
    var db:SQLiteDB!
    
    @IBOutlet var z: UITextView!
    @IBOutlet var e: UITextField!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists user(uid integer primary key,name varchar(20),mobile varchar(20),email varcher(20),address varcher(20))")
    }
    
    
    
    @IBAction func shanchu(sender: AnyObject) {
        del()
    }
    
    
    func del(){
        
        let a=e.text!
        let sql = db.query("delete from user where uname='\(a)'")
        z.text="删除成功"
        
        print(sql)
        

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

