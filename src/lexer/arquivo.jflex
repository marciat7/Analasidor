package lexer;

%%

%class MiniJava
%public
%standalone
%unicode
%line
%column

comentario = "/*" ~"*/"
espaco = [ \n\t\r]
letra = [A-Z]|[a-z]
digito = [0-9]
sinais = ( "-" | "+" | "" )
natural = ({digito} | [1-9]{digito}+)
inteiro = {sinais}{natural}
float = {inteiro}"."{digito}+(("E" | "e"){sinais}?{natural}?)?
id = ({letra} | _ )({letra} | {digito} | _ )*


%%

 // Keywords
boolean
| class
| do
| else
| extends
| false
| for
| if
| int
| new
| public
| return
| static
| this
| true
| void
| while
{System.out.println("Keyword: " + yytext().toString());}

// Delimiter
"("
| ")"
| "{"
| "}"
| "["
| "]"
{System.out.println("Delimiter: " + yytext().toString());}

// Operators
"||"
| "&&"
| "=="
| "!="
| "<"
| "<="
| ">"
| ">="
| "+"
| "-"
| "*"
| "/"
| "%"
| "!"
{System.out.println("Operator: " + yytext().toString());}

// Others
";"
| "."
| "="
{System.out.println("Other: " + yytext().toString());}

{espaco}
{/* Do nothing */}

{comentario}
{System.out.println("Comentario");}

{inteiro}
{System.out.println("inteiro: " + yytext().toString());}

{float}
{System.out.println("Float: " + yytext().toString());}

{id}
{System.out.println("id: " + yytext().toString());}