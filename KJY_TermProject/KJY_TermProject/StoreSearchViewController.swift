//
//  ViewController.swift
//  HospitalMap
//
//  Created by KpuGame on 2020/05/15.
//  Copyright © 2020 KimJiYeong. All rights reserved.
//
//상권 검색 코드 - 병원정보 코드 참고해서 좀 더 구성해야할 듯
//코드 내에서 데이터 저장한뒤에 그 데이터 내에서 저장해서 불러오던지 vs 어떻게든 코드 읽는거 알아오던지 2개인듯
import UIKit
import AVFoundation
import Speech

class StoreSearchViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
  
  
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBAction func doneToStoreSearchViewContorller(segue: UIStoryboardSegue)
    {
        
    }
    //상권 정보 url
    /*
     상권 정보 URL
     http://apis.data.go.kr/B553077/api/open/sdsc/storeZoneOne?serviceKey=d1dnU5KOcFu3kxN0WqezfuNwFhRQbxC1WsHisyn3peY%2FOnnDX5yEoSBr10CoTjvj46PevWSgiJTwhdAm%2FJPTxw%3D%3D&
     */
    
    var pickerDataSource = ["서울특별시", "부산광역시", "대구광역시", "인천광역시", "광주광역시","대전광역시","울산광역시" , "세종특별자치시","경기도","강원도" ,"충청북도", "충청남도" , "전라북도", "전라남도" , "경상북도", "경상남도", "제주특별자치도"]
 
    var sgguCd : String = "110023" //디폴트 시군구 코드 - 광진구
    var key : Int = 0
    var sUrl = SearchURL()
    @IBOutlet weak var transcribeButton: UIButton!
      @IBOutlet weak var stopButton: UIButton!
      @IBOutlet weak var myTextView: UITextView!
      @IBAction func startTranscribing(_ sender: Any) {
          transcribeButton.isEnabled = false
          stopButton.isEnabled = true
          try! startSession()
      }
      @IBAction func stopTranscribing(_ sender: Any) {
          if audioEngine.isRunning {
                 audioEngine.stop()
                 speechRecogitionRequest?.endAudio()
                 transcribeButton.isEnabled = false
             }
          //텍스트 내용에 따라 자동저긍로 번역함
          switch (self.myTextView.text) {
          case "서울특별시" : self.pickerView.selectRow(0,    inComponent: 0, animated: true)
              break
          case "부산광역시" : self.pickerView.selectRow(1,    inComponent: 0, animated: true)
              break
          case "대구광역시" : self.pickerView.selectRow(2,    inComponent: 0, animated: true)
              break
          case "인천광역시" : self.pickerView.selectRow(3,    inComponent: 0, animated: true)
              break
          default:
              break
          }
             
      }
    
    //Mark: 음성인식
     
      //영어 한글 모두 인식하고 싶다면
      //private let speechRecognizer = SFSpeechRecognizer()
      //private let speechRecognizer = SFSpeechRecognizer()!
      private let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "ko-KR"))!
      
      private var speechRecogitionRequest: SFSpeechAudioBufferRecognitionRequest?
      private var speechRecogitionTask : SFSpeechRecognitionTask?
      //AV 인스턴트를 사용하여 오디오를 오디오 버퍼로 스트리밍
      private let audioEngine = AVAudioEngine()
      
      func startSession() throws {
          if let recognitionTask = speechRecogitionTask {
              recognitionTask.cancel()
              self.speechRecogitionTask = nil
          }
          //메서드는 오디오 녹음 세션을 구성
          let audioSession = AVAudioSession.sharedInstance()
          try audioSession.setCategory(AVAudioSession.Category.record)
          
          //이전에 선언 된 변수에 개체를 할당해야함
          speechRecogitionRequest = SFSpeechAudioBufferRecognitionRequest()
          
          //그런 다음에 개체가 성공적으로 만들어 졌는지 확인하기 위한 테스트가 수행됩니다.
          //생성이 실패한 경우 예외가 throw 됩니다.
          guard let recognitionRequest = speechRecogitionRequest else { fatalError("SFSpeechAudioBufferRecognitionRequest object creation failed")}
          //오디오 엔진의 대한 참조를 가져와서 상수에 할당합니다.
          //입력 노드를 사용할 수 없는 경우 치명적인 오류가 발생합니ㅏㄷ.
          let inputNode = audioEngine.inputNode
          recognitionRequest.shouldReportPartialResults = true
              
          //인식 작업이 초기화
          //인식 요청 객체로 초기화 된 인식 테스크를 생성합니다.
          //처리기가 호출 될 때 마다 오류 개체와 함께 최신 버전의 텍스트가 포함된 객체가 전달됩니다.
         speechRecogitionTask = speechRecognizer.recognitionTask(with: recognitionRequest) {result, error in
         var finished = false
              if let result = result {
                  self.myTextView.text = result.bestTranscription.formattedString
                  finished = result.isFinal
          }
              if error != nil || finished {
                  self.audioEngine.stop()
                  inputNode.removeTap(onBus: 0)
                  
                  self.speechRecogitionRequest = nil
                  self.speechRecogitionTask = nil
                  self.transcribeButton.isEnabled = true
              }
              
          }
          //인식 작업을 구성하고 나서 이 단계에 실행 엔진을 설정하느 ㄴ것
          let recordingFormat = inputNode.outputFormat(forBus: 0)
          inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) {
              (buffer : AVAudioPCMBuffer, when: AVAudioTime) in self.speechRecogitionRequest?.append(buffer)
          }
          
          audioEngine.prepare()
          try audioEngine.start()
      }
      
      func authorizeSR() {
          SFSpeechRecognizer.requestAuthorization {authStatus in OperationQueue.main.addOperation {
              switch authStatus {
              case .authorized:
                  self.transcribeButton.isEnabled = true
              case .denied:
                  self.transcribeButton.isEnabled = false
                  self.transcribeButton.setTitle("Speech recognition access denied by user", for: .disabled)
                  
            case .restricted:
                   self.transcribeButton.isEnabled = false
                   self.transcribeButton.setTitle("Speech recognition restricted on device", for: .disabled)
              
              case .notDetermined:
                 self.transcribeButton.isEnabled = false
                 self.transcribeButton.setTitle("Speech recognition not authorized", for: .disabled)
                  
                  }
              }
          }
      }


    // MARK: - Table view data source
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component : Int) -> String? {
        return pickerDataSource[row]
    }
   
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 0 {
            key = 11 //서울
        }
        else if row == 1 {
            key = 26 //부산
        }
        else if row == 2 {
            key = 27 //대구
        }
        else if row == 3 {
            key = 28 //인천
        }
        else if row == 4 {
            key = 29 //광주
        }
        else if row == 5 {
            key = 30 //대전
        }
        else if row == 6 {
            key = 31 //울산
        }
        else if row == 7 {
            key = 36 //세종
        }
        else if row == 8 {
            key = 41 //경기
        }
        else if row == 9 {
            key = 42 //강원
        }
        else if row == 10 {
            key = 43 //충북
        }
        else if row == 11 {
            key = 44 //충남
        }
        else if row == 12 {
            key = 45 //전북
        }
        else if row == 13 {
            key = 46 //전남
        }
        else if row == 14 {
            key = 47 //경북
        }
        else if row == 15 {
            key = 48 //경남
        }
        else //==3==
        {
            key = 50 //제주 코드
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "segueToStoreSearchTableView" {
            if let navController = segue.destination as? UINavigationController {
                if let storeTableViewController = navController.topViewController as? StoreTableViewController {
                    storeTableViewController.url = self.sUrl.returnURL(ctprvnCD: key)
                }
            }
        }

      
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerView.delegate = self;
        self.pickerView.dataSource = self;
    
        
    }


}

