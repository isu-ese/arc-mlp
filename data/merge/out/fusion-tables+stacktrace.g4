stackTraceLine: K_ALTER | startRule_causedByLine_packagePath_JavaWord_atLine_ellipsisLine_message | ϵ | '<init>' | '.java' | EOF | '$' | ':' | . | '...' | 'A' .. 'Z' | 'a' .. 'z' | '_' | '0' .. '9' | 'at' | '.' | 'Caused by:' | 'more' | gen_1;
K_ALTER: A L T E R;
A: 'a' | 'A';
E: 'e' | 'E';
L: 'l' | 'L';
R: 'r' | 'R';
T: 't' | 'T';
startRule_causedByLine_packagePath_JavaWord_atLine_ellipsisLine_message: stackTraceLine stackTraceLine gen_0;
classFile: startRule_causedByLine_packagePath_JavaWord_atLine_ellipsisLine_message | 'Native Method' | 'Unknown Source';
gen_1: '(' classFile;
gen_0: ϵ | ')'