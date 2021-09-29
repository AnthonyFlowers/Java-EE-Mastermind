package com.anthony.model;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class GameTest {
	
	@Test
	void testInitialization() {
		Game g = new Game();
		g.getCode();
	}

	@Test
	void testGenerateCodes() {
		Game g = new Game();
		String[] code = g.getCode();
		assertEquals(4, code.length);
		for(String peg: code) {
			assertTrue(peg.matches("^[RGBMCYE]$"));
		}
	}
	
	@Test
	void testGenerateResponses() {
		Game g = new Game();
		assertEquals(4, g.getCode().length);
		assertEquals(10, g.getGuesses().size());
		
	}

	@Test
	void testMakeCorrectGuess() {
		Game g = new Game();
		String[] code = g.getCode();
		assertEquals(4, code.length);
		g.makeGuess(code);
		assertTrue(g.isGameOver());
		assertTrue(g.isGameWon());
	}

	@Test
	void testIncorrectGuess() {
		Game g = new Game();
		
	}
	
	

}
