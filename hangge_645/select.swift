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
    
    @IBOutlet var s: UITextField!
    @IBOutlet var a: UITextView!
    
    @IBOutlet var d: UITextField!
    
    @IBOutlet var f: UITextView!
    var db:SQLiteDB!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists user(uid integer primary key,name varchar(20),mobile varchar(20),email varcher(20),address varcher(20))")
    }
    
    @IBAction func add2(sender: AnyObject) {
        sel3()
        
    }
    
    @IBAction func add(sender: AnyObject) {
        sel1()
    }
    
    
    @IBAction func chaxun(sender: AnyObject) {
        sel()
    }
    
    func sel1(){
        a.text=""
        let b=s.text!
        let sql = db.query("select * from lin where uname='\(b)'")
        for var z=0;z<sql.count;z++
        {
            //获取最后一行数据显示
            let tuser = sql[z]
            a.text! += "甲：" + String(tuser["uname"]!) + " vs乙：" + String(tuser["mobile"]!) + " 比分：" + String(tuser["email"]!) + " ： " + String(tuser["address"]!) + String(tuser["jieguo"]!)+"\n"
        }
        
    }
    
    func sel3(){
        f.text=""
        let c=d.text!
        let sql = db.query("select * from lin20,lin22,lin31 where email='\(c)'")
        for var v=0;v<sql.count;v++
        {
            //获取最后一行数据显示
            let tuser = sql[v]
            f.text! += "团队1"  + String(tuser["email"]!) + "VS" + "团队2" + String(tuser["email"]!) + "单打1： 甲：" + String(tuser["uname1"]!) + " vs乙：" + String(tuser["uname11"]!) + " 比分：" + String(tuser["dan1"]!) + " ： " + String(tuser["dan11"]!) + String(tuser["jieguo1"]!)+"\n" + "单打2： 甲：" + String(tuser["uname2"]!) + " vs乙：" + String(tuser["uname22"]!) + " 比分：" + String(tuser["dan2"]!) + " ： " + String(tuser["dan22"]!) + String(tuser["jieguo2"]!)+"\n" + "单打3： 甲：" + String(tuser["uname1"]!) + " vs乙：" + String(tuser["uname11"]!) + " 比分：" + String(tuser["dan2"]!) + " ： " + String(tuser["dan22"]!) + String(tuser["jieguo2"]!)+"\n" + "双打1： 甲：" + String(tuser["uname12"]!) + " vs乙：" + String(tuser["uname112"]!) + " 比分：" + String(tuser["dan12"]!) + " ： " + String(tuser["dan112"]!) + String(tuser["jieguo12"]!)+"\n" + "双打2： 甲：" + String(tuser["uname21"]!) + " vs乙：" + String(tuser["uname221"]!) + " 比分：" + String(tuser["dan21"]!) + " ： " + String(tuser["dan221"]!) + String(tuser["jieguo2"]!)+"\n"
            

        }
        
    }
    
    
        func sel(){
            q.text=""
            let a=x.text!
            let sql = db.query("select * from lin1 where uname='\(a)'")
           
            
            for var j=0;j<sql.count;j++
            {
                //获取最后一行数据显示
                let tuser = sql[j]
                q.text! += "甲：" + String(tuser["uname"]!) + "/" + String(tuser["uname2"]!) + " vs乙：" + String(tuser["mobile"]!) + "/" + String(tuser["mobile2"]!) +  " 比分：" + String(tuser["email"]!) + " ： " + String(tuser["address"]!) + String(tuser["jieguo"]!)+"\n"
            }
                
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

