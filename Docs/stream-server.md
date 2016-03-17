# StreamServer

The `StreamServer` protocol represents a server that can accept a connection and return a stream of binary data representing that connection.

```swift
public protocol StreamServer {
    func accept() throws -> Stream
}
```

## Motivation

Having an abstraction for a server reduces tight coupling and allows the consumer API to focus solely on the binary data being transmitted through the stream.