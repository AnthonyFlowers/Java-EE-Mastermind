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

import com.anthony.model.Game;

class ResetGameServletTest {

	HttpServletRequest request;
	HttpServletResponse response;
	HttpSession session;
	RequestDispatcher requestDispatcher;
	Game testGame;
	ResetGameServlet servlet;

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
		servlet = new ResetGameServlet();
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
	void testResetGame() throws ServletException, IOException {
		testGame.makeGuess(new String[] { "R", "R", "R", "R" });
		assertEquals(1, testGame.getTurn());
		servlet.doPost(request, response);
		assertEquals(0, testGame.getTurn());
	}

}
