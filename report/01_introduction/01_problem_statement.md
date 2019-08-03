
Codebases in modern work environments are becoming increasingly multilingual. For example, a modern web application might use 5 different languages from the start (e.g. SQL, Java\texttrademark , TypeScript, HTML, CSS). Multilingual codebases pose a significant challenge to the development of code analysis tools. Especially of note is the difficulty of developing static analysis tools that work across multiple programming languages [@mushtaqMultilingualSourceCode2017]. Current approaches focus on handwriting a grammar for each language that a tool wants to support. Our goal is to find and evaluate a way to automate this process.