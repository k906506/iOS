//
//  ViewController.swift
//  Basic_06
//
//  Created by 고도 on 2022/09/13.
//

import UIKit
import AudioToolbox

enum TimerStatus {
    case start
    case pause
    case end
}

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    var duration = 60
    var timerStatus : TimerStatus = .end
    var timer : DispatchSourceTimer?
    var currentSeconds = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureStartButton()
    }
    
    @IBAction func tapStartButton(_ sender: UIButton) {
        self.duration = Int(self.datePicker.countDownDuration) // DatePicker에서 설정한 시간을 초 단위로 변경
        
        switch self.timerStatus {
        case .end :
            debugPrint("end")
            self.currentSeconds = self.duration
            self.timerStatus = .start
            self.setTimerInfoViewVisible(isHidden: false)
            self.datePicker.isHidden = true
            self.startButton.isSelected = true
            self.cancelButton.isEnabled = true
            self.startTimer()
        case .start:
            debugPrint("start")
            self.timerStatus = .pause
            self.startButton.isSelected = false
            self.timer?.suspend()
        case .pause:
            debugPrint("pause")
            self.timerStatus = .start
            self.startButton.isSelected = true
            self.timer?.resume()
        default:
            break
        }
    }
    
    @IBAction func tapCancelButton(_ sender: UIButton) {
        switch self.timerStatus {
        case .start, .pause:
            self.stopTimer()
            
        default:
            break
        }
    }
    
    func setTimerInfoViewVisible(isHidden : Bool) {
        self.timerLabel.isHidden = isHidden
        self.progressView.isHidden = isHidden
    }
    
    func configureStartButton() {
        self.startButton.setTitle("시작", for: .normal)
        self.startButton.setTitle("일시정지", for: .selected)
    }
    
    func startTimer() {
        if self.timer == nil {
            self.timer = DispatchSource.makeTimerSource(flags: [], queue: .main)
            self.timer?.schedule(deadline: .now(), repeating : 1)
            self.timer?.setEventHandler(handler: { [weak self] in
                guard let self = self else { return }
                self.currentSeconds -= 1
                var hour = self.currentSeconds / 3600
                let minute = (self.currentSeconds % 3600) / 60
                let second = (self.currentSeconds % 3600) % 60
                
                self.timerLabel.text = String(format: "%02d:%02d:%02d", hour, minute, second)
                self.progressView.progress = Float(self.currentSeconds) / Float(self.duration)
                
                if self.currentSeconds <= 0 {
                    self.stopTimer()
                    AudioServicesPlaySystemSound(1005)
                }
            })
            self.timer?.resume()
        }
    }
    
    func stopTimer() {
        if self.timerStatus == .pause {
            self.timer?.resume()
        }
        self.timerStatus = .end
        self.cancelButton.isEnabled = false
        self.setTimerInfoViewVisible(isHidden: true)
        self.datePicker.isHidden = false
        self.startButton.isSelected = false
        self.timer?.cancel()
        self.timer = nil
    }
}

