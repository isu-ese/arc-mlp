The primary paradigm of software application development has been moving steadily away from the homogenous single language and single technology approach and towards a heterogenous multilingual and multi-technology approach for sometime now [@http://zotero.org/users/1776655/items/B8D2E2AR]. Simultaneosly the use of static and dynamic analysis tools as a standard part of a developer's and organizations toolkit has seen rapid growth. Yet, such tools such as SpotBugs^[[https://spotbugs.github.io](https://spotbugs.github.io)], PMD^[[https://pmd.github.io](https://pmd.github.io)], Parasoft dotTEST^[[https://www.parasoft.com/products/dottest](https://www.parasoft.com/products/dottest)], Pylint^[[https://www.pylint.org](https://www.pylint.org)], etc. have been designed with a single language or family of languages in mind. Services and software issue accumulation tools such as SonarQube^[[https://www.sonarqube.org](https://www.sonarqube.org)] have shown that there is a need for static and dynamic analysis tools to be capable of crossing the boundaries of languages. The typical design paradigm for such tools involves the inclusion of multiple languages via plugins (or some other technique) which requires the use of one or more (language specific) parsers to extract knowledge from the code. Unfortunately, this causes two main issues: 1.) A maintenance nightmare for the inclusion and integration of multiple parsers. 2.) A maintenance headache as languages continue to update and change.