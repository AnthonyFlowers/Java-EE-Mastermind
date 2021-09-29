package com.anthony.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.anthony.model.Game;
import com.anthony.model.Game.CodePeg;

/**
 * Servlet implementation class MakeGuessServlet
 */
@WebServlet("/makeGuess")
public class MakeGuessServlet extends HttpServlet {
	private static final long serialVersionUID = 2021_09L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MakeGuessServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pegOne = request.getParameter("guessPegOne");
		String pegTwo = request.getParameter("guessPegTwo");
		String pegThree = request.getParameter("guessPegThree");
		String pegFour = request.getParameter("guessPegFour");
		Game g = (Game) request.getSession().getAttribute("game");
		String[] codeGuess = new String[]{pegOne, pegTwo, pegThree, pegFour};
		if (g.isGameOver()) {
			request.setAttribute("gameOver", true);
		} else if (isValidCode(codeGuess)) {
			
			g.makeGuess(codeGuess);
		} else {
			request.setAttribute("pegError", true);
		}
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	private boolean isValidCode(String[] code) {
		return isPegValid(code[0]) && isPegValid(code[1]) && isPegValid(code[2]) && isPegValid(code[3]);
	}

	private boolean isPegValid(String peg) {
		if (peg == null)
			return false;
		return peg.matches("^[RGBMCYE]$");
	}

}
