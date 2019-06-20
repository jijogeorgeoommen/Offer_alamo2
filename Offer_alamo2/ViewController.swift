//
//  ViewController.swift
//  Offer_alamo2
//
//  Created by JIJO G OOMMEN on 19/06/19.
//  Copyright © 2019 JIJO G OOMMEN. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage



class Model : NSObject {
    
    var id : Int
    var name : String
    var details : String?
    var start : String?
    var stop : String?
    var amount : Int
    var imageurl : String?
    
     init ( obj : NSDictionary) {
    id = obj.value(forKey: "d_id") as! Int
    name = obj.value(forKey: "d_name")as! String
    details = obj.value(forKey: "d_details")as! String
    start = obj.value(forKey: "d_start")as! String
    stop = obj.value(forKey: "d_stop")as! String
    amount = obj.value(forKey: "d_amount")as! Int
    imageurl = obj.value(forKey: "d_image")as! String
    }
    
}

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableviewoutlet: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelarray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableviewoutlet.dequeueReusableCell(withIdentifier: "OffersCellid", for: indexPath) as! OffersCell
        cell.nameoutlet.text = String(modelarray[indexPath.row].id)
        cell.idoutlet.text = modelarray[indexPath.row].name as! String
        cell.informationlabel.text = modelarray[indexPath.row].details as! String
        cell.startlabel.text = modelarray[indexPath.row].start as! String
        cell.stoplabel.text = modelarray[indexPath.row].stop as! String
        cell.amountoutlet.text =  String(modelarray[indexPath.row].amount)
        
        let imgurl = "http://sicsglobal.com/App_projects/dyetcash/uploads/deals/"
        let tempImg = modelarray[indexPath.row].imageurl
        let urlVari = URL(string: (imgurl + tempImg!))
        
        
        cell.imageoutlet.sd_setImage(with: urlVari, placeholderImage: nil, options: .progressiveLoad,  completed: nil)
        
       return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
        
    }
    
    
    var modelarray = [Model]()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        offersforyou()
        
    }
    
    func offersforyou() {
        
        let urlString = "http://sicsglobal.com/App_projects/dyetcash/api/v1/deals"
        let url = URL(string: urlString)
        Alamofire.request(url!).responseJSON { (response) in
            
           print(response)
            
         let offerdictionary = response.result.value as! NSDictionary

         let dealsarray = offerdictionary["deals"]as! NSArray

        // print(dealsarray)
            
            for i in dealsarray {
             
                self.modelarray.append(Model(obj: i as! NSDictionary))
               // print(self.modelarray)
            }
            self.tableviewoutlet.reloadData()
           
            
        }
        
    }


}

