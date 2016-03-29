public enum Body {
    case buffer(Data)
    case stream(Stream)
}

extension Body {
    public var buffer: Data {
        mutating get {
            switch self {
            case .buffer(let data):
                return data
            case .stream(let stream):
                let data = Drain(stream).data
                self = .buffer(data)
                return data
            }
        }

        set(data) {
            self = .buffer(data)
        }
    }

    public var isBuffer: Bool {
        switch self {
        case .buffer: return true
        default: return false
        }
    }

    public var stream: Stream {
        mutating get {
            switch self {
            case .stream(let stream):
                return stream
            case .buffer(let data):
                let stream = Drain(data)
                self = .stream(stream)
                return stream
            }
        }

        set(stream) {
            self = .stream(stream)
        }
    }

    public var isStream: Bool {
        switch self {
        case .stream: return true
        default: return false
        }
    }
}
