# Header

The `Header` type represents a single HTTP header.

```swift
public struct Header {
    public var name: String
    public var value: String
}
```

## Motivation

Having `Header` as a struct allows it to conform to protocols in extensions.