# CustomDataStore

The `CustomDataStore` protocol represents a type that can hold custom data.

```swift
public protocol CustomDataStore {
    var storage: Storage { get set }
}
```

## Motivation

Having a `Storage` property makes it possible to add optional stored properties on extensions.