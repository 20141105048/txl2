//
//  File.swift
//  hangge_645
//
//  Created by l20141105048 on 16/7/11.
//  Copyright © 2016年 hangge.com. All rights reserved.
//

import UIKit

class select: UIViewController {
    @IBOutlet var x: UITextField!
    @IBOutlet var q: UITextView!
    
    var db:SQLiteDB!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists user(uid integer primary key,name varchar(20),mobile varchar(20),email varcher(20),address varcher(20))")
    }
    
    
    
    @IBAction func chaxun(sender: AnyObject) {
        sel()
    }
    
    
        func sel(){
            q.text=""
            let a=x.text!
        let sql = db.query("select * from user where uname='\(a)'")
            for var j=0;j<sql.count;j++
            {
                //获取最后一行数据显示
                let tuser = sql[j]
                q.text! += "姓名：" + String(tuser["uname"]!) + " 电话：" + String(tuser["mobile"]!) + " 邮箱：" + String(tuser["email"]!) + " 地址：" + String(tuser["address"]!)
            }
                
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

