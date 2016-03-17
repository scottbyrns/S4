// Based on established protocols declared https://www.w3.org/Protocols/rfc2616/rfc2616-sec9.html

public enum Method {
    case Delete
    case Get
    case Head
    case Post
    case Put
    case Connect
    case Options
    case Trace
    case Patch
    case Other(method: String)
}

extension Method: Hashable {
    public var hashValue: Int {
        switch self {
        case .Delete:          return 0
        case .Get:             return 1
        case .Head:            return 2
        case .Post:            return 3
        case .Put:             return 4
        case .Connect:         return 5
        case .Options:         return 6
        case .Trace:           return 7
        case .Patch:           return 8
        case .Other(let method): return 9 + method.hashValue
        }
    }
}

public func ==(lhs: Method, rhs: Method) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

extension Method {
    init(_ rawValue: String) {
      let method = rawValue.uppercaseString
      switch method {
      case "DELETE":
          self = .Delete
      case "GET":
          self = .Get
      case "HEAD":
          self = .Head
      case "POST":
          self = .Post
      case "PUT":
          self = .Put
      case "CONNECT":
          self = .Connect
      case "OPTIONS":
          self = .Options
      case "TRACE":
          self = .Trace
      case "PATCH":
          self = .Patch
      default:
          self = .Other(method: method)
      }
    }
}

extension Method: CustomStringConvertible {
    public var description: String {
        switch self {
        case .Delete:          return "DELETE"
        case .Get:             return "GET"
        case .Head:            return "HEAD"
        case .Post:            return "POST"
        case .Put:             return "PUT"
        case .Connect:         return "CONNECT"
        case .Options:         return "OPTIONS"
        case .Trace:           return "TRACE"
        case .Patch:           return "PATCH"
        case .Other(let method): return method.uppercaseString
        }
    }
}
