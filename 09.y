%{
import java.io.*;
import java.util.*;
/*  
All of the below productions that do not have associated 
actions are using the DEFAULT action -- $$ = $1 
*/

%}


%token ARTICLE VERB NOUN ADJECTIVE ADVERB PREPOSITION END PUNCT
%start sentence

%%

sentence:	nphrase VERB ending
			| nphrase VERB vmodifier ending
			| nphrase VERB nphrase ending
			;

ending:	PUNCT END
		;

nphrase:	modifiednoun
			| ARTICLE modifiednoun
			;
modifiednoun:	NOUN
				| nmodifier modifiednoun
				;

nmodifier: ADJECTIVE
			| ADVERB vmodifier
			;

vmodifier:	ADVERB
			| ADVERB vmodifier
			| PREPOSITION nphrase
			;

%%

/* Byacc/J expects a member method int yylex(). We need to provide one
   through this mechanism. See the jflex manual for more information. */

	/* reference to the lexer object */
	private Scanner lexer;
	
	/* interface to the lexer */
	private int yylex() {
		int retVal = -1;
		try {
			retVal = lexer.yylex();
		} catch (IOException e) {
			System.err.println("IO Error:" + e);
		}
		return retVal;
	}
	
	/* error reporting */
	public void yyerror (String error) {
		System.err.println("Error : " + error + " at line " + lexer.getLine() + " column: " + lexer.getColumn());
	}

	/* constructor taking in File Input */
	public Parser (Reader r) {
		lexer = new Scanner (r);
	}

	public static void main (String [] args) throws IOException {
		Parser yyparser = new Parser(new FileReader(args[0]));
		yyparser.yyparse();
	}
	
