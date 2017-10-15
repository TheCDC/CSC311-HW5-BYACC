%%

%class Scanner
%unicode
%line
%column
%byaccj

END=\R
PUNCT=[\.,!?]
ARTICLE=(the|The|an|An|a)
VERB=(study|sleep|play|throw|write|eat)
NOUN=(book|laptop|candy|pen|box)
ADJECTIVE=(cute|clever|smart|witty|tired|blue|red)
ADVERB=(willfully|abruptly|endlessly|delightfully|lightly|beautifully)
PREPOSITION=(before|into|on|above|by|along)


%{
	/* return the current line number.*/
	public int getLine() {
		return yyline;
	}

	public int getColumn() {
		return yycolumn;
	}

%}

%%

{END}				{System.out.println("END\t"+yytext()); return Parser.END ;}
{PUNCT}				{System.out.println("PUNCT\t"+yytext()); return Parser.PUNCT ;}
{ARTICLE}			{System.out.println("ARTICLE\t"+yytext()); return Parser.ARTICLE ;}
{VERB}				{System.out.println("VERB\t"+yytext()); return Parser.VERB ;}
{NOUN}				{System.out.println("NOUN\t"+yytext()); return Parser.NOUN ;}
{ADJECTIVE}			{System.out.println("ADJECTIVE\t"+yytext()); return Parser.ADJECTIVE ;}
{ADVERB}			{System.out.println("ADVERB\t"+yytext()); return Parser.ADVERB ;}
{PREPOSITION}		{System.out.println("PREPOSITION\t"+yytext()); return Parser.PREPOSITION ;}
\s 					{}
