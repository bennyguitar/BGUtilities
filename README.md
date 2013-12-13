![Banner](https://raw.github.com/bennyguitar/BGUtilities/master/Images/banner.png)

## About

After growing tired of always writing a lot of (what felt like) boilerplate Objective-C over and over again, I decided to make a bunch of useful utilities to make my life easier, and by proxy, yours too. This is an ever-growing repository of useful functions that should help you in development. I encourage you to read through their implementation so that you understand what's happening in the background and don't get comfortable with an extremely abstracted up representation of those functions.

## Installation

All of the important classes are located in the <code>Classes</code> top-level directory in this repository. These are the ones you'll need:

* <code>NSString+BGStringUtilities.{h,m}</code>
* <code>UIView+BGViewUtilities.{h,m}</code>
* <code>BGSystemUtilities.{h,m}</code>
* <code>BGUtilities.h</code>

The last class, <code>BGUtilities.h</code> is an aggregate of all of the classes above it, meaning you only have to <code>#import "BGUtilities.h"</code> in any classes you'd like to get all of the methods in this suite.

**Cocoapods**

Cocoapods coming soon.

## License

BGUtilities is licensed under the standard MIT License:

**Copyright (C) 2013 by Benjamin Gordon**

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
