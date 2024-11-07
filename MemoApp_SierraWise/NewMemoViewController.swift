//
//  NewMemoViewController.swift
//  MemoApp_SierraWise
//
//  Created by Sierra Wise on 9/19/24.
//

import UIKit

class NewMemoViewController: UIViewController {

    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func save(_ sender: Any) {
        
        let content = UNMutableNotificationContent()
        content.title = "Display"
        content.subtitle = "Pressed Save Button"
        content.body = "SUCCESS!"
        content.badge = 0
        
        //Time Interval Trigger
        let TimeIntervalTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.2, repeats: false)
        
        //Calendar Notification Trigger
        //var dateComponents = DateComponents()
        //dateComponents.calendar = Calendar.current
        
        //dateComponents.weekday = 4 //Tuesday
        //dateComponents.hour = 11
        
        //let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        //let uuidString = UUID().uuidString
        
        let request = UNNotificationRequest(identifier: "timerdone", content: content, trigger: TimeIntervalTrigger)
        
        notificationCenter.add(request, withCompletionHandler: nil)
        
        guard let memo = memoTextView.text, memo.count > 0 else{
            alert(message: "There is no text");
            return
        }
//        let newMemo = Memo(content: memo)
//       Memo.dummyMemoList.append(newMemo)
        DataManager.shared.saveMemo(memo)
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBOutlet weak var memoTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("1.viewDidLoad")
        print("===================")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("2.viewWilAppear")
        print("===================")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("3.viewDidAppear")
        print("===================")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("4.viewWillDisappear")
        print("===================")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("5.viewDidDisappear")
        print("===================")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
