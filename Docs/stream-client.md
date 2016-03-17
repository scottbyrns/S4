# StreamClient

The `StreamClient` protocol represents a client that can start a connection and return a stream of binary data representing that connection.

```swift
public protocol StreamClient {
    func connect() throws -> Stream
}
```

## Motivation

Having an abstraction for a client reduces tight coupling and allows the consumer API to focus solely on the binary data being transmitted through the stream.