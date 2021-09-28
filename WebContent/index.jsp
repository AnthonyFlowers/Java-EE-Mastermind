<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Mastermind</title>
<link rel="stylesheet" href="css/mastermind.css"/>
<script src="scripts/mastermind.js"></script>
</head>
<body>
	<div class="container">
	<h1 class="title">Mastermind</h1>
	<div id="helpSection" onClick="showHelp()">
		<h3>How to play</h3>
		<p>
			This is the game Mastermind. A code has been chosen and you are to guess it. Each row 
			on the board represents a guess made. The current guess has a lighter background color.
		</p>
		<p>
			Click on each circle/code piece and select the color you would like to guess in that position.
			After you have chosen each code piece for your guess, click the "Make Guess" button. 
			You will receive feedback based on your guess if your code matches or partially matches. 
		</p>
		<p>
			To the right of your guess there will be black and white circles/key pegs that represent
			a correctly guessed color. A black key peg shows you have a correctly colored code peg in 
			the correct position. A white key peg shows you have a correctly colored code peg in an 
			incorrect position. After each turn use the the previous feedback to improve your next guess.
		</p>
		<p>Click the "Reset" button to reset the game and get another code.</p>
		<p>
			Click the "Text Mode" button to enable text mode. Text mode shows text on each peg 
			corresponding to its color.
		</p>
		<h3>Links</h3>
		<p>
			Project <a href="https://github.com/AnthonyFlowers/Mastermind">GitHub</a><br>
			Mastermind <a href="https://wikipedia.org/wiki/Mastermind_(board_game)">Wiki</a>
		</p>
	</div>
	<div class="board">
		<c:choose>
		<c:when test="${game.isGameWon()}">
			<h2 class="title win green blink">You Win!</h2>
		</c:when>
		<c:when test="${game.isGameOver()}">
			<h2 class="title lose red">You Lost :(</h2>
		</c:when>
		<c:otherwise>
			<h3 class="title">Remaining Turns: ${game.getRemainingTurns()}</h3>
		</c:otherwise>
		</c:choose>
		<c:forEach var="curRow" items="${game.guesses}" varStatus="count">
		<div class="boardRow">
		<c:choose>
		<c:when test="${game.turn == count.index && !game.isGameOver()}">
		<div class="codeSect inLine">
		<form method="post" action="makeGuess">
		<div class="codeRow inLine${game.turn == count.index ? ' curRow' : '' }${pegError ? ' blink':''}">
          <div class="dropdown">
            <input id="guessPegOne" name="guessPegOne" type="text" onclick="guessOneDropdown()" value="E" class="dropbtn guessPeg E${textMode ? ' textMode': '' }">
            <div id="guessOne" class="dropdown-content">
              <input type="text" class="R${textMode ? ' textMode': '' }" value="R" onclick="guessPegGuess('One','R')"><br>
              <input type="text" class="G${textMode ? ' textMode': '' }" value="G" onclick="guessPegGuess('One','G')"><br>
              <input type="text" class="B${textMode ? ' textMode': '' }" value="B" onclick="guessPegGuess('One','B')"><br>
              <input type="text" class="M${textMode ? ' textMode': '' }" value="M" onclick="guessPegGuess('One','M')"><br>
              <input type="text" class="C${textMode ? ' textMode': '' }" value="C" onclick="guessPegGuess('One','C')"><br>
              <input type="text" class="Y${textMode ? ' textMode': '' }" value="Y" onclick="guessPegGuess('One','Y')"><br>
              <input type="text" class="E${textMode ? ' textMode': '' }" value="E" onclick="guessPegGuess('One','E')">
            </div>
          </div>
          <div class="dropdown">
            <input id="guessPegTwo" name="guessPegTwo" type="text" onclick="guessTwoDropdown()" value="E" class="dropbtn guessPeg E${textMode ? ' textMode': '' }">
            <div id="guessTwo" class="dropdown-content">
              <input type="text" class="R${textMode ? ' textMode': '' }" value="R" onclick="guessPegGuess('Two','R')"><br>
              <input type="text" class="G${textMode ? ' textMode': '' }" value="G" onclick="guessPegGuess('Two','G')"><br>
              <input type="text" class="B${textMode ? ' textMode': '' }" value="B" onclick="guessPegGuess('Two','B')"><br>
              <input type="text" class="M${textMode ? ' textMode': '' }" value="M" onclick="guessPegGuess('Two','M')"><br>
              <input type="text" class="C${textMode ? ' textMode': '' }" value="C" onclick="guessPegGuess('Two','C')"><br>
              <input type="text" class="Y${textMode ? ' textMode': '' }" value="Y" onclick="guessPegGuess('Two','Y')"><br>
              <input type="text" class="E${textMode ? ' textMode': '' }" value="E" onclick="guessPegGuess('Two','E')">
            </div>
          </div>
          <div class="dropdown">
            <input id="guessPegThree" name="guessPegThree" type="text" onclick="guessThreeDropdown()" value="E" class="dropbtn guessPeg E${textMode ? ' textMode': '' }">
            <div id="guessThree" class="dropdown-content">
              <input type="text" class="R${textMode ? ' textMode': '' }" value="R" onclick="guessPegGuess('Three','R')"><br>
              <input type="text" class="G${textMode ? ' textMode': '' }" value="G" onclick="guessPegGuess('Three','G')"><br>
              <input type="text" class="B${textMode ? ' textMode': '' }" value="B" onclick="guessPegGuess('Three','B')"><br>
              <input type="text" class="M${textMode ? ' textMode': '' }" value="M" onclick="guessPegGuess('Three','M')"><br>
              <input type="text" class="C${textMode ? ' textMode': '' }" value="C" onclick="guessPegGuess('Three','C')"><br>
              <input type="text" class="Y${textMode ? ' textMode': '' }" value="Y" onclick="guessPegGuess('Three','Y')"><br>
              <input type="text" class="E${textMode ? ' textMode': '' }" value="E" onclick="guessPegGuess('Three','E')">
            </div>
          </div>
          <div class="dropdown">
            <input id="guessPegFour" name="guessPegFour" type="text" onclick="guessFourDropdown()" value="E" class="dropbtn guessPeg E${textMode ? ' textMode': '' }">
            <div id="guessFour" class="dropdown-content">
              <input type="text" class="R${textMode ? ' textMode': '' }" value="R" onclick="guessPegGuess('Four','R')"><br>
              <input type="text" class="G${textMode ? ' textMode': '' }" value="G" onclick="guessPegGuess('Four','G')"><br>
              <input type="text" class="B${textMode ? ' textMode': '' }" value="B" onclick="guessPegGuess('Four','B')"><br>
              <input type="text" class="M${textMode ? ' textMode': '' }" value="M" onclick="guessPegGuess('Four','M')"><br>
              <input type="text" class="C${textMode ? ' textMode': '' }" value="C" onclick="guessPegGuess('Four','C')"><br>
              <input type="text" class="Y${textMode ? ' textMode': '' }" value="Y" onclick="guessPegGuess('Four','Y')"><br>
              <input type="text" class="E${textMode ? ' textMode': '' }" value="E" onclick="guessPegGuess('Four','E')">
            </div>
          </div>
          </div>
          <input class="btnGuess" type="submit" value="Make Guess">
        </form>
        </div>
		</c:when>
		<c:otherwise>
		<div class="codeSect inLine">
		<div class="codeRow inactiveRow">
			<c:forEach var="codePiece" items="${curRow}">
			<input class="dropbtn guessPeg ${codePiece == null ? 'E' : codePiece}${textMode ? ' textMode': '' }" value="${codePiece == null ? 'E' : codePiece}">
			</c:forEach>
		</div>
		</div>
		<div class="keyPieces inLine">
			<c:forEach var="keyPiece" items="${game.getResponseRow(count.index)}">
			<c:choose>
			<c:when test="${keyPiece != null}">
			<input type="text" class="inLine ${keyPiece}${textMode ? ' textMode': '' }" value="${keyPiece}" disabled>
			</c:when>
			</c:choose>
			</c:forEach>
		</div>
		</c:otherwise>
		</c:choose>
		
		</div>
		</c:forEach>
		<div class="boardRow">
		<div class="codeSect inLine">
		<div class="codeRow inactiveRow hiddenCode">
		<c:choose>
		<c:when test="${game.isGameOver()}">
			<c:forEach var="codePiece" items="${game.getCode()}">
			<input class="dropbtn guessPeg ${codePiece == null ? 'E' : codePiece}${textMode ? ' textMode': '' }" value="${codePiece == null ? 'E' : codePiece}">
			</c:forEach>
		</c:when>
		<c:otherwise>
			<c:forEach var="codePiece" items="${game.getCode()}">
			<input class="dropbtn guessPeg hiddenCode Em${textMode ? ' textMode': '' }">
			</c:forEach>
		</c:otherwise>
		</c:choose>
		</div>
		<div class="keyPieces inLine"></div>
		</div>
		</div>
		<br>
		<div>
		<a href="resetGame"><input class="btnReset inLine" type="submit" value="Reset"></a>
		<a href="textMode"><input class="btnTextMode inLine" type="submit" value="Text Mode"></a>
		<a href="#"><input class="btnHelp" type="submit" value="Help" onClick="showHelp()"></a>
		</div>
	</div>
	</div>
</body>
</html>