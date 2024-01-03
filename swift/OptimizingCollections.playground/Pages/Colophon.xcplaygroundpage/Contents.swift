/*:
 [Previous page](@previous)

 # How This Book Was Made 
 
 
 This book was generated by *bookie*, my tool for creating books about Swift.
 (*Bookie* is of course the informal name for a bookmaker, so the name is a perfect fit.)
 
 Bookie is a command-line tool written in Swift that takes Markdown text files
 as input and produces nicely formatted Xcode Playground, GitHub-flavored
 Markdown, EPUB, HTML, LaTeX, and PDF files, along with a standalone Swift
 package containing all the source code. It knows how to generate playgrounds,
 Markdown, and source code directly; the other formats are generated by
 [pandoc][pandoc] after converting the text into pandoc's own Markdown
 dialect.
 
 [pandoc]: https://pandoc.org
 
 To verify code samples, bookie extracts all Swift code samples into a special
 Swift package (carefully annotated with `#sourceLocation` directives) and
 builds the package using the Swift Package Manager. The resulting command-line app is
 then run to print the return value of all lines of code that are to be
 evaluated. This output is then split, and each individual result is inserted
 into printed versions of the book after its corresponding line of code:
*/
func factorial(_ n: Int) -> Int {
    return (1 ... max(1, n)).reduce(1, *)
}
factorial(4)
factorial(10)
/*:
 (In playgrounds, such output is generated dynamically, but the printout has to
 be explicitly included in the other formats.)
 
 Syntax coloring is done using [SourceKit], like in Xcode. SourceKit uses the
 official Swift grammar, so contextual keywords are always correctly
 highlighted:
*/
var set = Set<Int>() // "set" is also a keyword for defining property setters
set.insert(42)
set.contains(42)
/*:
 [SourceKit]: https://github.com/apple/swift/tree/master/tools/SourceKit
 
 Ebook and print versions of this book are typeset in [*Tiempos Text* by the Klim
 Type Foundry][tiempos]. Code samples are set in [Laurenz Brunner's excellent *Akkurat*][akkurat].
 
 [tiempos]: https://klim.co.nz/blog/tiempos-design-information/
 [akkurat]: https://lineto.com/The+Fonts/All+Fonts/Akkurat/
 
 Bookie is not (yet?) free/open source software; you need to contact us directly
 if you're interested in using it in your own projects.

 [Next page](@next)
*/