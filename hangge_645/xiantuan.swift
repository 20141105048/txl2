//
//  xiantuan.swift
//  hangge_645
//
//  Created by l20141105048 on 16/12/29.
//  Copyright © 2016年 hangge.com. All rights reserved.
//

import UIKit

class xiantuan: UIViewController {
    var db:SQLiteDB!
    
    
    @IBAction func qingkong(sender: AnyObject) {
        let sql = "delete from lin"
        let result = db.execute(sql)
        print(result)
    }
    
    
    @IBOutlet var text: UITextView!
    
   
    var temp=0
    var tem=0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        db = SQLiteDB.sharedInstance()
        db.execute("create table if not exists lin5(uid integer primary key,name1 varchar(20),name2 varchar(20),uname1 varchar(20),uname2 varchar(20),uname3 varchar(20),mobile1 varchar(20),mobile2 varchar(20),mobile3 varchar(20),mobile4 varchar(20))")
        
    }
    @IBAction func add(sender: AnyObject) {
         selete()
        
    }
    
    
    func selete(){
        text.text=""
        
        let data = db.query("select * from lin order by uname")
        
        for var x=0;x<data.count;x++
        {
            //获取最后一行数据显示
            let tuser = data[x]
            text.text! += "甲：" + String(tuser["name1"]!) + String(tuser["name2"]!) + String(tuser["uname1"]!) + " vs乙：" + String(tuser["uname2"]!) + String(tuser["uname3"]!) + String(tuser["mobile1"]!) + String(tuser["mobile2"]!) + String(tuser["mobile3"]!) + String(tuser["mobile4"]!)+"\n"
            
        }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //保存数据到SQLite
    
    
}



















