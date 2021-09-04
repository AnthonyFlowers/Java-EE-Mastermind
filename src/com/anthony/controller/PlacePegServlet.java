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
 * Servlet implementation class PlacePegServlet
 */
@WebServlet("/placePeg")
public class PlacePegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PlacePegServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String peg = request.getParameter("color");
		String pos = request.getParameter("codePos");
		
		CodePeg selectedPeg = peg.matches("[RGBMCY]")
				? CodePeg.valueOf(request.getParameter("color"))
				: null;
		Integer codePos = pos.matches("[0-3]") ? Integer.parseInt(request.getParameter("codePos")) : null;

		if (codePos != null && (selectedPeg != null || peg.equals("E"))) {
			Game g = (Game) request.getSession().getAttribute("game");
			g.setCodePeg(codePos, selectedPeg);
		}
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
