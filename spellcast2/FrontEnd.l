%{
#define YYSTYPE void*
#include "FrontEnd.tab.h"

#include <cstring>
#include <cstdlib>
#include <string.h>

static char* sc2_strdup(const char* s) {
#ifdef _MSC_VER
  return _strdup(s);
#else
  return strdup(s);
#endif
}

%}

%option yylineno
%option noyywrap

%%

"//"[^\n]*            ;

"whirl"                { return WhirlToken; }
"portal"               { return PortalToken; }
"wonder"               { return WonderToken; }
"minor_image"          { return MinorImageToken; }
"illusion"             { return IllusionToken; }
"crave"                { return CraveToken; }
"detect"               { return DetectToken; }
"focus"                { return FocusToken; }
"wish"                 { return WishToken; }
"in"                   { return InToken; }

"=="                   { return EqualEqual; }

#[A-Za-z_][A-Za-z0-9_]* {
                          yylval = (void*)sc2_strdup(yytext);
                          return VarIdent;
                        }

[0-9]+                 {
                          yylval = (void*)sc2_strdup(yytext);
                          return IntLiteral;
                        }

\n+                    { return EOL; }

<<EOF>>               {
              static int emitted = 0;
              if (emitted) {
                return 0;
              }
              emitted = 1;
              return EOL;
            }

[ \t\r]+               ;

.                      { return *yytext; }

%%
