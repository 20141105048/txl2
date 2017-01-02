//
//  tuanxian.swift
//  hangge_645
//
//  Created by l20141105048 on 16/12/30.
//  Copyright © 2016年 hangge.com. All rights reserved.
//


import UIKit

class tuanxian: UIViewController {
    var db:SQLiteDB!
    
    @IBOutlet var text: UITextView!
    
    
    
    
    
    var temp=0
    var tem=0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        db = SQLiteDB.sharedInstance()
        db.execute("create table if not exists lin20(uid integer primary key,uname1 varchar(20),uname2 varchar(20),uname3 varchar(20),uname11 varchar(20),uname22 varchar(20),uname33 varchar(20),dan1 varchar(20),dan2 varchar(20),dan3 varchar(20),dan11 varchar(20),dan22 varchar(20),dan33 varchar(20),jieguo1 varchar(20),jieguo2 varchar(20),jieguo3 varchar(20))")
        
        db.execute("create table if not exists lin22(uid integer primary key,uname12 varchar(20),uname21 varchar(20),uname112 varchar(20),uname221  varchar(20),dan12 varchar(20),dan21 varchar(20),dan112 varchar(20),dan221 varchar(20),jieguo12 varchar(20),jieguo21 varchar(20))")
        
        
        
    }
    
    @IBAction func add3(sender: AnyObject) {
        
        let sql = "delete  from lin20"
        let result = db.execute(sql)
        print(result)
        
        
        let sql1 = "delete  from lin22"
        let result1 = db.execute(sql1)
        print(result1)
        
        let sql2 = "delete  from lin31"
        let result2 = db.execute(sql2)
        print(result2)
        
        
        
    }
    
    
    
       @IBAction func add(sender: AnyObject) {
        selete()
    }
    
    func selete(){
        text.text=""
        
        let data = db.query("select * from lin20,lin22,lin31")
        
        for var x=0;x<data.count;x++
        {
            //获取最后一行数据显示
            let tuser = data[x]
            text.text! += "团队1 ："  + String(tuser["email"]!) + "VS" + "团队2 ：" + String(tuser["email"]!) + "单打1： 甲：" + String(tuser["uname1"]!) + " vs乙：" + String(tuser["uname11"]!) + " 比分：" + String(tuser["dan1"]!) + " ： " + String(tuser["dan11"]!) + String(tuser["jieguo1"]!)+"\n" + "单打2： 甲：" + String(tuser["uname2"]!) + " vs乙：" + String(tuser["uname22"]!) + " 比分：" + String(tuser["dan2"]!) + " ： " + String(tuser["dan22"]!) + String(tuser["jieguo2"]!)+"\n" + "单打3： 甲：" + String(tuser["uname1"]!) + " vs乙：" + String(tuser["uname11"]!) + " 比分：" + String(tuser["dan2"]!) + " ： " + String(tuser["dan22"]!) + String(tuser["jieguo2"]!)+"\n" + "双打1： 甲：" + String(tuser["uname12"]!) + " vs乙：" + String(tuser["uname112"]!) + " 比分：" + String(tuser["dan12"]!) + " ： " + String(tuser["dan112"]!) + String(tuser["jieguo12"]!)+"\n" + "双打2： 甲：" + String(tuser["uname21"]!) + " vs乙：" + String(tuser["uname221"]!) + " 比分：" + String(tuser["dan21"]!) + " ： " + String(tuser["dan221"]!) + String(tuser["jieguo2"]!)+"\n"
            

        }
        
    }
    
    
    
       
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //保存数据到SQLite
    
    
}






























