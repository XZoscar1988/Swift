//
//  FirstViewController.swift
//  MySwiftDemo
//
//  Created by xuwei8 on 2017/2/20.
//  Copyright © 2017年 oscar. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var cellCls:[String]?
    var tableView:UITableView? {
        willSet(newTableView) {
            print(UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier:"").self)
        }
        didSet {
            print(tableView ?? "xx")
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.cellCls = ["1","2","x"]
        
        self.tableView = UITableView(frame:self.view.frame, style: UITableViewStyle.plain);
        self.tableView!.delegate = self;
        self.tableView!.dataSource = self;
        
        self.view.addSubview(self.tableView!)
        self.tableView!.register(UITableViewCell.self, forCellReuseIdentifier:"identify")
        
        let view1 = UIImageView()
        view1.backgroundColor = UIColor(red:100/255, green:200/255, blue:0, alpha:1)
        view1.contentMode = UIViewContentMode.scaleAspectFit
        self.view.addSubview(view1)
        view1.autoPinEdgesToSuperviewEdges()
        
        view1.sd_setImage(with: NSURL(string: "http://static.googleadsserving.cn/pagead/imgad?id=CICAgKCLt5y2TxDYBRhaMghKNMsewbRebA") as URL!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.cellCls?.count)!;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identify:String = "identify"
        
        let cell = tableView.dequeueReusableCell(withIdentifier:identify, for:indexPath)
        cell.textLabel?.text = self.cellCls?[indexPath.row];
        
        return cell
        
    }
}

