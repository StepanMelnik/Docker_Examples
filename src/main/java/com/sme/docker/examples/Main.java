package com.sme.docker.examples;

import java.util.Arrays;

/**
 * The main entry point to start application.
 */
public final class Main
{
    private final String[] args;
    private String message;

    public Main(String[] args)
    {
        this.args = args;
    }

    /**
     * Start application.
     */
    void start()
    {
        message = Arrays.toString(args);
    }

    /**
     * Fetch a message sent to JVM.
     * 
     * @return Returns a message of JVM arguments.
     */
    public String getMessage()
    {
        return message;
    }

    /**
     * Main method to start application.
     * 
     * @param args The list of arguments.
     */
    public static void main(String[] args)
    {
    	Main main = new Main(args);
    	main.start();
        System.out.println(main.getMessage());
    }
}
