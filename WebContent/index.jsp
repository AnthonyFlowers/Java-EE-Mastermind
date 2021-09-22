<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Mastermind</title>
<link rel="stylesheet" href="css/mastermind.css?uncache=19"/>
<script src="scripts/mastermind.js?uncache=1"></script>
</head>
<body>
	<h1 class="title">Mastermind</h1>
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
		<br>
		<div>
		<a href="resetGame"><input class="btnReset inLine" type="submit" value="Reset"></a>
		<a href="textMode"><input class="btnTextMode inLine" type="submit" value="Text Mode"></a>
		</div>
	</div>
</body>
</html>