import UIKit

func reformatDate(_ date: String) -> String {
    
    let date = date.components(separatedBy: " ")
    
    guard date.count > 0 else { return "" }
    
    let monthsArray = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    let month = date[1]
    let monthIndex =  monthsArray.firstIndex(of: month)!
    let monthString =  monthIndex < 9 ? "0\(monthIndex + 1)" : "\(monthIndex + 1)"

        
    let dayValue = date[0].components(separatedBy: NSCharacterSet.decimalDigits.inverted).first    
    var dayString: String = ""
    if let nonOptionalDayValue = dayValue, let intDayValue = Int(nonOptionalDayValue) {
        dayString = intDayValue <= 9 ? "0\(nonOptionalDayValue)" : "\(nonOptionalDayValue)"
    }
        
    return "\(date[2])-\(monthString)-\(dayString)"
}


print(reformatDate("20th Oct 2052"))
