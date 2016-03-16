# Data

The `Data` type represents binary data as a collection of bytes.

> An alternative name could be `Buffer`.

```swift
public struct Data {
    public var bytes: [Byte]
}
```

## Motivation

Binary data types facilitate standardization of low level operations, especially when interfacing with C API.

```swift
let bytesWritten = data.withUnsafeBufferPointer {
    write(fd, $0.baseAddress, $0.count)
}
```

`Data` could be simply a typealias:

```swift
typealias Data = [Byte]
```

But that wouldn't allow it to conform to protocols. Wrapping `[Byte]` in a `struct` gives much more freedom.

```swift
extension Data: CustomStringConvertible {
    public var description: String {
        return (try? String(data: self)) ?? hexDescription
    }
}
```

## Alternative

An alternative would be to store the binary data using raw pointes.

```swift
public struct Data {
    var bytes: UnsafeMutablePointer<Void>
    var length: Int
}
```