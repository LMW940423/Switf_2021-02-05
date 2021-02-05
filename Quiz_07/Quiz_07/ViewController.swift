//
//  ViewController.swift
//  Quiz_07
//
//  Created by 이민우 on 2021/02/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblPickerTime: UILabel!
    
    let timeSelector : Selector = #selector(ViewController.updateTime) // 현재 ViewController에 있는 updateTime이라는 함수를 이용!
    let interval = 1.0 // 시간 interval 1초
    var switchNum = 0 // 이미지 계속 변경하기 위한 변수
    var countNum = 0 // 60초 카운트 변수
    var currentTimeText = ""
    var pickerTimeText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // interval : 시간 간격, target : 실행시킬 곳, selector : 실행할 함수?, userinfo : ?, repeats : 반복할지 안할지?
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func DatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm"
        lblPickerTime.text = "선택시간 : \(formatter.string(from: datePickerView.date))" // DatePicker에서 date를 가져온다! (년도,월,일 등 다 가져올 수 있을 듯!)
        countNum = 0 // 초기화
    }
    
    @objc func updateTime(){
        let date = NSDate() // NS : Next Step // OS로 부터 Date를 가져오는 것
        let formatter = DateFormatter()
        
        formatter.locale = Locale(identifier: "ko") // 한국 지역에 맞추기
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm:ss" // yyyy(년도) - mm(월) - dd(일) EEE(요일) a((오전/오후)) hh(시간):mm(분):ss(초)
        // a를 제거하고 hh를 HH로 바꾸면 24시간 방식으로 바뀐다!
        lblCurrentTime.text = "현재시간 : \(formatter.string(from: date as Date))"
        
        runAlarm() // view 색깔 변경하는 함수
    }
    
    // 현재 시간과 선택된 시간이 일치할 떄 alarm 실행!
    func runAlarm(){
        currentTimeText = lblCurrentTime.text!
        pickerTimeText = lblPickerTime.text!
        
        if pickerTimeText == "시간을 선택해주세요."{
            
        }else if(countNum < 61){
            let currentTiemRange = currentTimeText.index(currentTimeText.endIndex, offsetBy: -2)..<currentTimeText.endIndex // 현재시간의 초를 제거하기 위한 범위 지정
            
            currentTimeText.removeSubrange(currentTiemRange) // 현재시간에서 초 제거
            
            // 각 시간들의 공통 부분만 뽑아낸 것 (현재시간, 선택시간 제거)
            let currentTime = currentTimeText.split(separator: ":")[1] + currentTimeText.split(separator: ":")[2]
            let pickerTime = pickerTimeText.split(separator: ":")[1] + pickerTimeText.split(separator: ":")[2]

            if currentTime == pickerTime{ // 현재시간과 선택시간이 같을 때
                countNum += 1
                if countNum == 1{
                    runAlert()
                }
                // 1초마다 번갈아가며 컬러 바꾸기
                if(switchNum == 0){
                    switchNum = 1
                    view.backgroundColor = UIColor.blue
                }else{
                    switchNum = 0
                    view.backgroundColor = UIColor.red
                }
            }else{ // 만약 두 시간이 달라졌다면 (분) 다시 원래 색으로 돌아옴
                view.backgroundColor = UIColor.white
            }
        }
        
    }
    
    func runAlert() {
        let alertController = UIAlertController(title: "알림!", message: "설정된 시간입니다!", preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: { [self]ACTION in
            countNum = 61
            view.backgroundColor = UIColor.white
        })
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
}

