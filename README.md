# URLSessionRegression [![pipeline status](https://gitlab.com/optimisedlabs/URLSessionRegression/badges/master/pipeline.svg)](https://gitlab.com/optimisedlabs/URLSessionRegression/commits/master)

Regression: Reusing an URLSession on Swift 4.x causes constant CPU time.

See [SR-6555](https://bugs.swift.org/browse/SR-6555).

## Steps to reproduce

Using Swift 4.1.2 under Ubuntu 14.04.5 LTS:
1. Leave `top` running in one session
2. In a new session `swift build`
3. `swift run`
4. Observe after first HTTP response CPU time drops back to zero
5. However, after second HTTP response CPU is using constant time

## Expected behaviour

CPU time is not constantly used.

## Workaround

Recreate URLSession for each `dataTask(with:)`, by commenting out line 4 and uncommenting line 7.

## Swift versions affected

* Swift version 4.0 (swift-4.0-RELEASE)
* Swift version 4.0.2 (swift-4.0.2-RELEASE)
* Swift version 4.0.3 (swift-4.0.3-RELEASE)
* Swift version 4.1 (swift-4.1-RELEASE)
* Swift version 4.1.1 (swift-4.1.1-RELEASE)
* Swift version 4.1.2 (swift-4.1.2-RELEASE)
* Swift version 4.2-dev (LLVM 70f121e1f0, Clang 4c555650a6, Swift bb9532c588)

## Swift versions unaffected

* Swift version 3.1.1 (swift-3.1.1-RELEASE)

## Misc

* Target is x86_64-unknown-linux-gnu
* Have tried Ubuntu 16.04, but it exhibits the same behaviour
