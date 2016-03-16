# HTTPHeader

The `HTTPHeader` type represents a single HTTP header.

```swift
public struct HTTPHeader {
    public var name: String
    public var value: String
}
```

## Motivation

Having `HTTPHeader` as a struct allows it to conform to protocols in extensions.