parser: Parser.java Scanner.java
	javac -classpath "" *.java

Scanner.java: 09.jflex
	jflex 09.jflex

Parser.java: 09.y
	byaccj -J 09.y

clean:
	rm *.class *.java