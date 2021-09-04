<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Mastermind</title>
<link rel="stylesheet" href="css/mastermind.css" />
</head>
<body>
	<h1>Mastermind</h1>

	<c:choose>
		<c:when test="${game.isGameOver() && !game.isGameWon()}">
			<h2 class="red">You Lost :(</h2>
		</c:when>
		<c:when test="${game.isGameWon()}">
			<h2 class="green">You Win!</h2>
		</c:when>
		<c:otherwise>
			<h2>Turn: ${game.getTurn()+1 }</h2>
			<span>Remaining Turns: ${game.getRemainingTurns()}</span>
		</c:otherwise>
	</c:choose>
	<table class="board">
		<!-- Create rows for each guess -->
		<c:forEach var="curRow" items="${game.guesses}" varStatus="count">
			<tr class="codeRow ${game.getTurn() == count.index ? 'curRow' : ''}">
				<c:forEach var="codePiece" items="${curRow}">
					<td class="guessPeg"><input type="submit"
						class="${codePiece == null ? 'E' : codePiece}"
						value="${codePiece == null ? 'E' : codePiece}" disabled></td>
				</c:forEach>
				<td class="keyPieces inLine"><c:forEach var="keyPiece"
						items="${game.getResponseRow(count.index)}">
						<c:choose>
							<c:when test="${keyPiece != null}">
								<input type="submit" class="${keyPiece}" value="O" disabled>
							</c:when>

						</c:choose>

					</c:forEach></td>
			</tr>
		</c:forEach>
		<tr class="codeRow">
			<c:forEach var="codePos" begin="0" end="3" step="1">
				<td class="selectablePegs"><c:forEach var="codePeg"
						items="${game.getPegs()}">
						<form method="POST" action="placePeg">
							<input name="peg" type="submit" class="${codePeg}"
								value="${codePeg}" ${game.isGameOver() ? 'disabled' :''}><input
								name="color" type="hidden" value="${codePeg}"> <input
								name="codePos" type="hidden" value="${codePos}">
						</form>
					</c:forEach>
					<form method="POST" action="placePeg">
						<input name="peg" type="submit" class="E" value="E"
							${game.isGameOver() ? 'disabled' :''}><input name="color"
							type="hidden" value="E"> <input name="codePos"
							type="hidden" value="${codePos}">
					</form></td>

			</c:forEach>
			<td></td>
		</tr>

		<tr>
			<td colspan="5">
				<form method="POST" action="makeGuess">
					<input type="submit" value="Make Guess"
						${game.isGameOver() ? 'disabled' :''}> <input
						type="hidden" name="guess" value="guess">
				</form>
				<form method="POST" action="resetGame">
					<input type="submit" value="Reset Game"> <input
						type="hidden" name="reset" value="reset">
				</form>
			</td>
		</tr>
	</table>
</body>
</html>