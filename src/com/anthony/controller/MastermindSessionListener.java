package com.anthony.controller;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.anthony.model.Game;


/**
 * Application Lifecycle Listener implementation class MastermindListener
 *
 */
@WebListener
public class MastermindSessionListener implements HttpSessionListener {

    /**
     * Default constructor. 
     */
    public MastermindSessionListener() {
    }

	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    public void sessionCreated(HttpSessionEvent se)  { 
    	se.getSession().setAttribute("game", new Game());
    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent se)  { 
    }
	
}
