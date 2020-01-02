Software applications written in multiple programming languages have become more common. These multilingual software systems introduce additional tool development challenges. One such challenge is building parsers that allow multilingual-capable tools\cite{mushtaqMultilingualSourceCode2017}. Currently, such tools use a separate parser or grammar for each supported language, or they use a limited intermediate representation (IR). IR-based tools are usually constrained to an ecosystem such as .NET or the JVM \cite{linos_metrics_2007}, while tools using multiple parsers are typically time-consuming to maintain \cite{petrinja_how_2013}.

One method of multilingual parsing uses specially constructed island grammars \cite{synytskyy_robust_2003}. These island grammars identify only the portions of documents that are of interest to the application. These island grammars are still able to function in the presence of multiple languages. However, this requires manually combining portions of grammars.
The goal of this research is as follows:

!rq (
    \item Develop an approach which reduces the effort necessary for automatically merging grammars.
)

Apropos this goal, we've designed an algorithmic procedure of normalizing grammars to a form suitable for automated merging.