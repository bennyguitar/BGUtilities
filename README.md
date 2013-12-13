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

## Table of Contents

* [NSString](#nsstring)
* [UIView](#uiview)
* [System Methods](#system-methods)
* [License](#license)

## NSString

There's a lot of cool things you can do with NSString, but the only problem is that sometimes you have to dig down and use some other NSObject classes to do them. Here is a growing list of methods that I think should help any iOS developer handle NSString manipulations.

**Contains Searches**

The two methods <code>contains:</code> and <code>containsAnyInArray:</code> are the methods used to check for existence of substring(s) inside of an NSString. These comparisons are case-insensitive, so capital letters register the same as lowercase. Here's how you use them:

```objc
NSString *mainString = @"Contains";

BOOL containsSubString = [mainString contains:@"Con"];
BOOL containsAnySubString = [mainString containsAnyInArray:@[@"BG",@"Con"]];
```

**Regular Expressions**

Regular Expressions can be very powerful tools despite the insanely disgusting syntax. With that said, here is the main method for evaluating a string using regex:

```objc
BOOL evaluate = [@"HelloWorld" evaluateWithRegex:@"{2,10}"];
```

Beyond just stock regular expression evaluation, there is also a convenience method for determing if an email address is valid too.

```objc
BOOL isValid = [@"benjamin.gordon@intermarkgroup.com" isValidEmail];
```

**Words**

Sometimes you want to evaluate text as if it conceptually contains words, and then act on them. There are a few convenience methods here as well for determining the number of words any NSString contains.

```objc
NSString *sentence = @"This sentence contains 6 unique words words.";
NSArray *words = [sentence words];
NSSet *uniqueWords = [sentence uniqueWords];
NSInteger *wordCount = [sentence numberOfWords];
```

Beyond these shorthand methods, there is also a main method used to enumerate all of the words inside of a sentence:

```objc
NSString *sentence = @"This sentence contains 6 unique words words.";
[sentence enumerateWordsUsingBlock:^(NSString *word, NSInteger index, BOOL *stop){
  // Do something with word here.
  // Set stop = YES to break the enumeration loop.
}];
```

## UIView

Coming soon.

## System Methods

Coming soon.

## License

BGUtilities is licensed under the standard MIT License:

**Copyright (C) 2013 by Benjamin Gordon**

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
