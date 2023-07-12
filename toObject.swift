import Foundation
import SwiftyJSON
import ObjectMapper

extension JSON {
    
    func toObject<T: Mappable>(mappableType: T.Type) -> T? {
        if let rawString = self.rawString() {
            return Mapper<T>().map(JSONString: rawString)
        }
        return nil
    }

}
