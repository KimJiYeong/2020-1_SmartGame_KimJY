import UIKit
//제 8강 강의처럼 변경해야함 --....일단 과제 먼저 해야지
class TestDataSource :NSObject{
    let tipCalc = TipCalculatorModel(total: 33.25, taxPct: 0.06)
    var possibleTips = [Int:(tipAmt:Double, total: Double)]()
    var sortedkeys:[Int] = []
    
    override init()
    {possibleTips = tipCalc.returnPossibleTips()
        sortedkeys= Array(possibleTips.keys).sorted()
        super.init()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedkeys.
    }
}

class TipCalculatorModel {
 
  var total: Double
  var taxPct: Double
  var subtotal: Double {
    get {
      return total / (taxPct + 1)
    }
  }
 
  init(total: Double, taxPct: Double) {
    self.total = total
    self.taxPct = taxPct
    //subtotal = total/(taxPct + 1)
  }
 
    func calcTipWithTipPct(tipPct: Double) -> (tipAmt: Double, total:Double) {
    let tipAmt = subtotal * tipPct
        _ = total + tipAmt
    return (subtotal, tipPct)
  }
 
  func returnPossibleTips() -> [Int: Double] {
 
    let possibleTipsInferred = [0.15, 0.18, 0.20]
 
    //빈 dic 변수 선언
    var retval = [Int: (tipAmt:Double, total:Double)]()
    //3개의 팁 퍼센트에 대한 팁을 계산하고 Dictionary add
    for possibleTip in possibleTipsInferred {
      let intPct = Int(possibleTip*100)
        retval[intPct] = calcTipWithTipPct(tipPct: possibleTip)
    }
    return retval
 
  }
 
}

