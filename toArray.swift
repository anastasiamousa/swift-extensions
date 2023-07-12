import Foundation
import SwiftyJSON
import ObjectMapper

extension JSON {
    
    func toArray<T: Mappable>(mappableType: T.Type) -> [T]? {
        if let rawString = self.rawString() {
            return Mapper<T>().mapArray(JSONString: rawString)
        }
        return nil
    }

}
