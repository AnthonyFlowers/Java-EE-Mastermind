package com.anthony.controller;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestInstance.Lifecycle;

import com.anthony.model.Game;
import com.anthony.model.Game.CodePeg;
import com.anthony.model.Game.KeyPeg;

@TestInstance(Lifecycle.PER_CLASS)
class MakeGuessServletTest {

	HttpServletRequest request;
	HttpServletResponse response;
	HttpSession session;
	RequestDispatcher requestDispatcher;
	Game testGame;
	MakeGuessServlet servlet;

	@BeforeEach
	void setup() {
		request = mock(HttpServletRequest.class);
		response = mock(HttpServletResponse.class);
		session = mock(HttpSession.class);
		requestDispatcher = mock(RequestDispatcher.class);
		testGame = new Game();
		session.setAttribute("game", testGame);
		when(session.getAttribute("game")).thenReturn(testGame);
		when(request.getSession()).thenReturn(session);
		when(request.getRequestDispatcher("index.jsp")).thenReturn(requestDispatcher);
		servlet = new MakeGuessServlet();
	}

	@Test
	void testDoGet() throws ServletException, IOException {
		servlet.doGet(request, response);
	}

	@Test
	void testDoPost() throws ServletException, IOException {
		servlet.doPost(request, response);
	}

	@Test
	void testGuessPegs() throws ServletException, IOException {
		setCode(new String[] { "E", "E", "E", "E" });
		servlet.doGet(request, response);
		assertEquals(1, testGame.getTurn());
		assertFalse(testGame.isGameOver());
		assertFalse(testGame.isGameWon());
	}

	@Test
	void testIncorrectGuess() throws ServletException, IOException {
		String[] code = testGame.getCode();
		CodePeg[] possible = CodePeg.values();
		String notInCode = "";
		for (CodePeg peg : possible) {
			for (String codePeg : code) {
				if (peg.toString().equals(codePeg))
					continue;
				notInCode = peg.toString();
			}
		}
		String[] badCode = new String[] { notInCode, notInCode, notInCode, notInCode };
		for (int i = 0; testGame.getRemainingTurns() > 0; i++) {
			setCode(badCode);
			servlet.doGet(request, response);
			assertNull(testGame.getResponseRow(i)[0]);
		}
		assertTrue(testGame.isGameOver());
		assertFalse(testGame.isGameWon());
	}

	@Test
	void testCorrectGuess() throws ServletException, IOException {
		String[] code = testGame.getCode();
		setCode(code);
		assertFalse(testGame.isGameOver());
		assertFalse(testGame.isGameWon());
		servlet.doGet(request, response);
		KeyPeg[] response = testGame.getResponseRow(0);
		assertEquals(4, response.length);
		assertEquals(KeyPeg.Bl, response[0]);
		assertEquals(KeyPeg.Bl, response[1]);
		assertEquals(KeyPeg.Bl, response[2]);
		assertEquals(KeyPeg.Bl, response[3]);
		assertTrue(testGame.isGameOver());
		assertTrue(testGame.isGameWon());
	}

	@Test
	void testInvalidPeg() throws ServletException, IOException {
		setCode("", "Y", "C", "M");
		servlet.doGet(request, response);
		assertNull(testGame.getGuesses().get(0)[0]);
		assertEquals(0, testGame.getTurn());
		setCode("R", "R", "@", "R");
		assertNull(testGame.getGuesses().get(0)[0]);
		servlet.doGet(request, response);
		assertEquals(0, testGame.getTurn());
		setCode("R", "R", "R", "R");
		servlet.doGet(request, response);
		assertEquals(1, testGame.getTurn());
	}

	private void setCode(String... code) {
		when(request.getParameter("guessPegOne")).thenReturn(code[0]);
		when(request.getParameter("guessPegTwo")).thenReturn(code[1]);
		when(request.getParameter("guessPegThree")).thenReturn(code[2]);
		when(request.getParameter("guessPegFour")).thenReturn(code[3]);
	}
}
