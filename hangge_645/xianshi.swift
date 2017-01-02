//
//  xianshi.swift
//  hangge_645
//
//  Created by l20141105048 on 16/12/26.
//  Copyright © 2016年 hangge.com. All rights reserved.
//

import UIKit

class xianshi: UIViewController {
    var db:SQLiteDB!
    
    
    @IBAction func qingkong(sender: AnyObject) {
        let sql = "delete from lin1"
        let result = db.execute(sql)
        print(result)
    }
    
    
    @IBOutlet var text: UITextView!
   
    var temp=0
    var tem=0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        db = SQLiteDB.sharedInstance()
        db.execute("create table if not exists lin1(uid integer primary key,uname varchar(20),uname2 varchar(20),mobile varchar(20),mobile2 varchar(20),email varchar(20),address varchar(20),jieguo varchar(20))")
    }
    
    @IBAction func xianshi(sender: AnyObject) {
         selete()    }
    
    func selete(){
        text.text=""
        
        let data = db.query("select * from lin1 order by uname")
        
        for var x=0;x<data.count;x++
        {
            //获取最后一行数据显示
            let tuser = data[x]
            text.text! += "甲：" + String(tuser["uname"]!) + "/" + String(tuser["uname2"]!) + " vs乙：" + String(tuser["mobile"]!) + "/" + String(tuser["mobile2"]!) +  " 比分：" + String(tuser["email"]!) + " ： " + String(tuser["address"]!) + String(tuser["jieguo"]!)+"\n"
            
        }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //保存数据到SQLite
    
    
}















































