//
//  xituan.swift
//  hangge_645
//
//  Created by l20141105048 on 16/12/30.
//  Copyright © 2016年 hangge.com. All rights reserved.
//

import UIKit

class xituan: UIViewController {
    var db:SQLiteDB!
    
    @IBOutlet var q: UITextField!
    
    
    @IBOutlet var w: UITextField!
    
    
    @IBOutlet var e: UITextView!
    
    
    @IBOutlet var r: UITextView!
    
    
    @IBOutlet var a: UITextField!
    
    
    @IBOutlet var b1: UITextField!
    
    
    @IBOutlet var b2: UITextField!
   
    @IBOutlet var b3: UITextField!
    
    @IBOutlet var b4: UITextField!
    
    
    var temp=0
    var tem=0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        db = SQLiteDB.sharedInstance()
        db.execute("create table if not exists lin10(uid integer primary key,email varchar(20),address varchar(20))")
        
        db.execute("create table if not exists lin99(uid integer primary key,name11 varchar(20),name22 varchar(20),uname11 varchar(20),uname22 varchar(20),uname33 varchar(20),mobile11 varchar(20),mobile22 varchar(20),mobile33 varchar(20),mobile44 varchar(20))")
        db.execute("create table if not exists lin103(uid integer primary key,name11 varchar(20),name22 varchar(20),uname11 varchar(20),uname22 varchar(20),uname33 varchar(20),mobile11 varchar(20),mobile22 varchar(20),mobile33 varchar(20),mobile44 varchar(20))")
        
    
    
    
    }
    
    
    @IBAction func add(sender: AnyObject) {
        selete()
        
    }
    
    func selete(){
        e.text=""
        r.text=""
        let data = db.query("select * from lin10 order by email")
        
        for var x=0;x<data.count;x++
        {
            //获取最后一行数据显示
            let tuser = data[x]
            e.text! +=   String(tuser["email"]!)
            r.text! +=   String(tuser["address"]!)
                    }
        
        let sql = "delete from lin10"
        let result = db.execute(sql)
        print(result)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func add2(sender: AnyObject) {
        saveUser()
        
    }
    
    
    
    //保存数据到SQLite
    func saveUser() {
        let name11 = self.e.text!
        let name22 = self.r.text!
        
        let uname11 = self.q.text!
        let uname22 = self.w.text!
        let uname33 = self.a.text!
        
        
        let mobile11 = self.b1.text!
        let mobile22 = self.b2.text!
        let mobile33 = self.b3.text!
        let mobile44 = self.b4.text!
        //插入数据库，这里用到了esc字符编码函数，其实是调用
        
        
        let sql = "insert into lin99(name11,name22,uname11,uname22,uname33,mobile11,mobile22,mobile33,mobile44) values('\(name11)','\(name22)','\(uname11)','\(uname22)','\(uname33)','\(mobile11)','\(mobile22)','\(mobile33)','\(mobile44)')"
        
        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        print(result)
        
        let sql1 = "insert into lin103(name11,name22,uname11,uname22,uname33,mobile11,mobile22,mobile33,mobile44) values('\(name11)','\(name22)','\(uname11)','\(uname22)','\(uname33)','\(mobile11)','\(mobile22)','\(mobile33)','\(mobile44)')"
        
        print("sql: \(sql1)")
        //通过封装的方法执行sql
        let result1 = db.execute(sql1)
        print(result1)
        
    }
    
    
}

