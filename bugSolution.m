The solution involves carefully managing the retain counts of objects and ensuring proper release.

```objectivec
- (void)someMethod {
    MyObject *obj = [[MyObject alloc] init];
    [obj someMethodThatRetainsAnObject];
    [obj release]; //Releases obj
    // Explicitly release the object retained by obj if needed
    id retainedObject = [obj getRetainedObject];
    if(retainedObject) {
        [retainedObject release];
    }
}

@interface MyObject : NSObject {
    id <MyObjectDelegate> _delegate;
}
@property (nonatomic, assign) id <MyObjectDelegate> delegate; //Change to assign
@end

- (void)someMethod {
  MyObject *obj = [[MyObject alloc] init];
  obj.delegate = someDelegateObject;
  [obj release]; //Correct, delegate will not be retained
}
```

In the improved example, the use of `assign` for the delegate property prevents retaining the delegate.  Alternatively, using `weak` in ARC would handle this automatically.  For objects explicitly retained within methods, they need to be explicitly released before the containing object is released.