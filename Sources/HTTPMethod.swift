public enum HTTPMethod {
    case Delete
    case Get
    case Head
    case Post
    case Put
    case Connect
    case Options
    case Trace
    case Copy
    case Lock
    case MkCol
    case Move
    case PropFind
    case PropPatch
    case Search
    case Unlock
    case Bind
    case Rebind
    case Unbind
    case ACL
    case Report
    case MkActicity
    case Checkout
    case Merge
    case MSearch
    case Notify
    case Subscribe
    case Unsubscribe
    case Patch
    case Purge
    case MkCalendar
    case Link
    case Unlink
    case Raw(method: String)
}

extension HTTPMethod: Hashable {
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
        case .Copy:            return 8
        case .Lock:            return 9
        case .MkCol:           return 10
        case .Move:            return 11
        case .PropFind:        return 12
        case .PropPatch:       return 13
        case .Search:          return 14
        case .Unlock:          return 15
        case .Bind:            return 16
        case .Rebind:          return 17
        case .Unbind:          return 18
        case .ACL:             return 19
        case .Report:          return 20
        case .MkActicity:      return 21
        case .Checkout:        return 22
        case .Merge:           return 23
        case .MSearch:         return 24
        case .Notify:          return 25
        case .Subscribe:       return 26
        case .Unsubscribe:     return 27
        case .Patch:           return 28
        case .Purge:           return 29
        case .MkCalendar:      return 30
        case .Link:            return 31
        case .Unlink:          return 32
        case .Raw(let method): return 33 + method.hashValue
        }
    }
}

public func ==(lhs: HTTPMethod, rhs: HTTPMethod) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

extension HTTPMethod: CustomStringConvertible {
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
        case .Copy:            return "COPY"
        case .Lock:            return "LOCK"
        case .MkCol:           return "MKCOL"
        case .Move:            return "MOVE"
        case .PropFind:        return "PROPFIND"
        case .PropPatch:       return "PROPPATCH"
        case .Search:          return "SEARCH"
        case .Unlock:          return "UNLOCK"
        case .Bind:            return "BIND"
        case .Rebind:          return "REBIND"
        case .Unbind:          return "UNBIND"
        case .ACL:             return "ACL"
        case .Report:          return "REPORT"
        case .MkActicity:      return "MKACTIVITY"
        case .Checkout:        return "CHECKOUT"
        case .Merge:           return "MERGE"
        case .MSearch:         return "MSEARCH"
        case .Notify:          return "NOTIFY"
        case .Subscribe:       return "SUBSCRIBE"
        case .Unsubscribe:     return "UNSUBSCRIBE"
        case .Patch:           return "PATCH"
        case .Purge:           return "PURGE"
        case .MkCalendar:      return "MKCALENDAR"
        case .Link:            return "LINK"
        case .Unlink:          return "UNLINK"
        case .Raw(let method): return method.uppercaseString
        }
    }
}
