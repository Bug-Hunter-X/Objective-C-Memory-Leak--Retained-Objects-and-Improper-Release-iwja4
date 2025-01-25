# Objective-C Memory Leak: Retained Objects and Improper Release

This repository demonstrates a common Objective-C memory management error involving improper release of objects retained by another object.  The issue centers around failing to account for objects retained within the lifecycle of another object, leading to memory leaks.

## The Problem

In Objective-C, manual memory management relies on `retain`, `release`, and `autorelease` to control object lifecycles. A common pitfall occurs when an object retains other objects.  Simply releasing the primary object doesn't automatically release the objects it retains; their retain counts must be individually managed.

## Files

* `bug.m`: Illustrates the memory leak scenario involving custom retain methods and delegates.
* `bugSolution.m`: Demonstrates the correct memory management techniques to prevent the leak. 

## How to reproduce

Compile and run `bug.m` to observe the memory leak.  Analyze the memory usage using instruments to verify it.

Compile and run `bugSolution.m` to see the corrected approach.

## Solution
The solution involves ensuring that all retained objects are released either explicitly or by using autorelease pools or appropriate ownership strategies such as weak references where applicable.