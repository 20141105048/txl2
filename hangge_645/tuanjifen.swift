//
//  tuanjifen.swift
//  hangge_645
//
//  Created by l20141105048 on 16/12/30.
//  Copyright © 2016年 hangge.com. All rights reserved.
//


import UIKit

class tuanjifen: UIViewController {
    var db:SQLiteDB!
    
    @IBOutlet var e: UITextView!
    
    @IBOutlet var r: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        db = SQLiteDB.sharedInstance()
        db.execute("create table if not exists lin9(uid integer primary key,uname varchar(20),mobile varchar(20))")
         db.execute("create table if not exists lin10(uid integer primary key,email varchar(20),address varchar(20))")
         db.execute("create table if not exists lin31(uid integer primary key,email varchar(20),address varchar(20))")
    
    
    
    }
    
    @IBAction func add(sender: AnyObject) {
        selete()
        saveUser()
    
    }
    
    func selete(){
        e.text=""
        r.text=""
        let data = db.query("select * from lin12 order by uname")
        let data1 = db.query("select * from lin13 order by email")
        
                    //获取最后一行数据显示
        for var x=0;x<data.count;x++
        {
            //获取最后一行数据显示
            let tuser = data[x]
            e.text! +=   String(tuser["uname"]!)
            
        }
        
        let sql = "delete from lin12"
        let result = db.execute(sql)
        print(result)
        
        for var x=0;x<data1.count;x++
        {
            //获取最后一行数据显示
            let tuser1 = data1[x]
            r.text! +=   String(tuser1["email"]!)
                   }
        
        let sql1 = "delete from lin13"
        let result1 = db.execute(sql1)
        print(result1)
        
    
    }
    
    func saveUser() {
        
        let email = self.e.text!
        
        let address = self.r.text!
          //插入数据库，这里用到了esc字符编码函数，其实是调用
        
        let sql = "insert into lin31(email,address) values('\(email)','\(address)')"
        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        print(result)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
