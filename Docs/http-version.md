# HTTPVersion

The `HTTPVersion` type represents an HTTP version.

```swift
public struct HTTPVersion {
    public let major: Int
    public let minor: Int
}
```

## Motivation

HTTP version is needed to handle protocol differences properly.