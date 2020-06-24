//
//  SearchURL.swift
//  KJY_TermProject
//
//  Created by KpuGame on 2020/06/18.
//  Copyright © 2020 KimJiYeong. All rights reserved.
//

import Foundation
//가독성과 연동을 위한 UI 목록
class SearchURL {
    var url2 : String = ""
    
    init() {
        print("기본 생성자 호출")
        
    }
    
    func returnURL(ctprvnCD: Int) -> String?
    {
        let api : String = "http://apis.data.go.kr/B553077/api/open/sdsc/storeZoneInAdmi?"
        let serKey : String = "&ServiceKey=d1dnU5KOcFu3kxN0WqezfuNwFhRQbxC1WsHisyn3peY%2FOnnDX5yEoSBr10CoTjvj46PevWSgiJTwhdAm%2FJPTxw%3D%3D"
       //let url : String  = api + "divId=ctprvnCd&" + "key=" + ctprvnCD + "&" + serKey
        var url : String = ""
        url = api
        url += "divId=ctprvnCd&"
        url += ("key=" + String(ctprvnCD))
        url += serKey
        return url
    }
    func returnURL_string(ctprvnCD: String) -> String?
      {
          let api : String = "http://apis.data.go.kr/B553077/api/open/sdsc/storeZoneInAdmi?"
          let serKey : String = "&ServiceKey=d1dnU5KOcFu3kxN0WqezfuNwFhRQbxC1WsHisyn3peY%2FOnnDX5yEoSBr10CoTjvj46PevWSgiJTwhdAm%2FJPTxw%3D%3D"
         //let url : String  = api + "divId=ctprvnCd&" + "key=" + ctprvnCD + "&" + serKey
          var url : String = ""
          url = api
          url += "divId=ctprvnCd&"
          url += ("key=" + ctprvnCD)
          url += serKey
          return url
      }
    func returnStoreListURL(v_trarNo : String) -> String?
    {
        let api : String = "http://apis.data.go.kr/B553077/api/open/sdsc/storeListInArea?"
        let serKey : String = "&ServiceKey=d1dnU5KOcFu3kxN0WqezfuNwFhRQbxC1WsHisyn3peY%2FOnnDX5yEoSBr10CoTjvj46PevWSgiJTwhdAm%2FJPTxw%3D%3D"
       //let url : String  = api + "divId=ctprvnCd&" + "key=" + ctprvnCD + "&" + serKey
        var url : String = ""
        url = api
        url += "key="
       url += v_trarNo
        url += serKey
        return url
    }
  
    func returnStoreZoneOneURL(v_trarNo : String) -> String?   //storeZoneOne
       {
           let api : String = "http://apis.data.go.kr/B553077/api/open/sdsc/storeZoneOne?"
           let serKey : String = "&ServiceKey=d1dnU5KOcFu3kxN0WqezfuNwFhRQbxC1WsHisyn3peY%2FOnnDX5yEoSBr10CoTjvj46PevWSgiJTwhdAm%2FJPTxw%3D%3D"
          //let url : String  = api + "divId=ctprvnCd&" + "key=" + ctprvnCD + "&" + serKey
           var url : String = ""
           url = api
           url += "key="
          url += v_trarNo
           url += serKey
           return url
       }
     
}


