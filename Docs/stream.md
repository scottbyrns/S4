# Stream

The `Stream` protocol represents a bi-directional stream of binary data.

```swift
public protocol Stream {
    var closed: Bool { get }
    func close() -> Bool
    func receive() throws -> Data
    func send(data: Data) throws
    func flush() throws
}
```

## Motivation

With an abstraction for a stream we can avoid tight coupling and get the advantage of composition. One could, for example, wrap a raw `TCP` stream in an `SSL` stream that encrypts/decrypts the binary data coming from the raw stream.

```swift
public final class SSLStream: Stream {
    private let context: SSLContext
    private let rawStream: Stream

    public init(context: SSLContext, rawStream: Stream) throws {
        ...
    }
}
```

The API consuming the stream doesn't need to know how the binary data is created. It only needs the binary data.