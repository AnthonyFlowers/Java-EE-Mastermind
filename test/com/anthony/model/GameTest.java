package com.anthony.model;

import static org.junit.jupiter.api.Assertions.*;

import java.util.Arrays;

import org.junit.jupiter.api.Test;

import com.anthony.model.Game.CodePeg;

class GameTest {

	void print(String string) {
		System.out.println(string);
	}
	
	void print(CodePeg[] array) {
		System.out.println(Arrays.toString(array));
	}

	@Test
	void testGenerateCodes() {
		Game g = new Game();
		assertEquals(10, g.getGuesses().size());
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
		CodePeg[] code = g.getCode();
		assertEquals(4, code.length);
		g.setCodePeg(0, code[0]);
		g.setCodePeg(1, code[1]);
		g.setCodePeg(2, code[2]);
		g.setCodePeg(3, code[3]);
		g.makeGuess();
		assertTrue(g.isGameOver());
		assertTrue(g.isGameWon());
	}

	@Test
	void testIncorrectGuess() {
		Game g = new Game();
		
	}
	
	

}
