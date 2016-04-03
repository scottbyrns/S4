/**
    Represents the body of the HTTP message.
    
    An HTTP message body contains the bytes of data that 
    are transmitted immediately following the headers.
 
    - buffer:   Simplest type of HTTP message body.
                Represents a `Data` object containing
                a byte array.
 
    - receiver: Contains a `Stream` that can be drained
                in chunks to access the body's data.
 
    - sender:   Contains a closure that accepts a `Stream`
                object to which the body's data should be sent.

*/
public enum Body {
    case buffer(Data)
    case receiver(Stream)
    case sender(Stream throws -> Void)
}

extension Body {
    /**
        Converts the body's contents into a `Data` buffer.
        
        If the body is a receiver or sender type,
        it will be drained.
    */
    public var buffer: Data {
        mutating get {
            switch self {
            case .buffer(let data):
                return data
            case .receiver(let receiver):
                let data = Drain(receiver).data
                self = .buffer(data)
                return data
            case .sender(let sender):
                let drain = Drain()
                do {
                    drain.closed = false
                    try sender(drain)
                    return drain.data
                } catch {
                    return drain.data
                }
            }
        }

        set(data) {
            self = .buffer(data)
        }
    }

    ///Returns true if body is case `buffer`
    public var isBuffer: Bool {
        switch self {
        case .buffer: return true
        default: return false
        }
    }

    /**
        Converts the body's contents into a `Stream`
        that can be received in chunks.
    */
    public var receiver: Stream {
        mutating get {
            switch self {
            case .receiver(let receiver):
                return receiver
            case .buffer(let data):
                let stream = Drain(data)
                self = .receiver(stream)
                return stream
            case .sender(let sender):
                let drain = Drain()
                do {
                    drain.closed = false
                    try sender(drain)
                } catch {
                    return Drain()
                }
                return drain
            }
        }

        set(stream) {
            self = .receiver(stream)
        }
    }

    ///Returns true if body is case `receiver`
    public var isReceiver: Bool {
        switch self {
        case .receiver: return true
        default: return false
        }
    }

    /**
        Converts the body's contents into a closure
        that accepts a `Stream`.
    */
    public var sender: (Stream throws -> Void) {
        mutating get {
            switch self {
            case .buffer(let data):
                print("got data \(data)")
                return { sender in
                    try sender.send(data)
                }
            case .receiver(let receiver):
                return { sender in
                    let data = Drain(receiver).data
                    try sender.send(data)
                }
            case .sender(let sender):
                return sender
            }
        }

        set(sender) {
            self = .sender(sender)
        }
    }

    ///Returns true if body is case `sender`
    public var isSender: Bool {
        switch self {
        case .sender: return true
        default: return false
        }
    }
}