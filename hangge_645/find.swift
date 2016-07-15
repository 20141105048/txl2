//
//  File.swift
//  hangge_645
//
//  Created by l20141105048 on 16/7/6.
//  Copyright © 2016年 hangge.com. All rights reserved.
//

import UIKit

class find: UIViewController {
    var db:SQLiteDB!
    
    
    @IBAction func qingkong(sender: AnyObject) {
        let sql = "delete from user"
        let result = db.execute(sql)
        print(result)
    }



    @IBOutlet weak var text: UITextView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        db = SQLiteDB.sharedInstance()
        db.execute("create table if not exists user(uid integer primary key,uname varchar(20),mobile varchar(20),email varchar(20),address varchar(20))")
        
    }
    
    @IBAction func xianshi(sender: AnyObject) {
        selete()
    }

    func selete(){
        text.text=""
        
        let data = db.query("select * from user order by uname")
        
        for var x=0;x<data.count;x++
        {
            //获取最后一行数据显示
            let tuser = data[x]
            text.text! += "姓名：" + String(tuser["uname"]!) + " 电话：" + String(tuser["mobile"]!) + " 邮箱：" + String(tuser["email"]!) + " 地址：" + String(tuser["address"]!)+"\n"
        }
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //保存数据到SQLite
    
    
}











































































