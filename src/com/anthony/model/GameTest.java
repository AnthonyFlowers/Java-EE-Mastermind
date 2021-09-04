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
//		assertEquals(4, g.getCode().length);
		assertEquals(8, g.getGuesses().size());
//		print(g.getCode());
	}
	
	@Test
	void testGenerateResponses() {
		Game g = new Game();
//		assertEquals(4, g.getCode().length);
		assertEquals(8, g.getGuesses().size());
		assertEquals(8, g.getGuesses().size());
		
	}

	@Test
	void testMakeCorrectGuess() {
		Game g = new Game();
		g.setCodePeg(0, CodePeg.R);
		g.setCodePeg(1, CodePeg.R);
		g.setCodePeg(2, CodePeg.R);
		g.setCodePeg(3, CodePeg.R);
//		assertTrue(g.makeGuess());
	}

	@Test
	void testIncorrectGuess() {
		Game g = new Game();

		print(g.getGuessRow(0));
		g.setCodePeg(3, CodePeg.B);
//		assertFalse(g.makeGuess());
		g.setCodePeg(2, CodePeg.G);
//		assertFalse(g.makeGuess());
		g.setCodePeg(1, CodePeg.C);
//		assertFalse(g.makeGuess());
		g.setCodePeg(0, CodePeg.B);
		print(g.getGuessRow(0));
//		assertFalse(g.makeGuess());
		g.setCodePeg(0, CodePeg.C);
		print(g.getGuessRow(0));
//		assertTrue(g.makeGuess());
	}
	
	

}
