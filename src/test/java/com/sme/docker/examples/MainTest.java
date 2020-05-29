package com.sme.docker.examples;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

/**
 * Unit test of {@link Main}.
 */
public class MainTest extends Assertions
{
    @Test
    void testEmptyArgs() throws Exception
    {
        String[] args = {};

        Main main = new Main(args);
        main.start();

        assertEquals("[]", main.getMessage());
    }

    @Test
    void testOneArg() throws Exception
    {
        String[] args = {"test"};

        Main main = new Main(args);
        main.start();

        assertEquals("[test]", main.getMessage());
    }

    @Test
    void testTwoArgs() throws Exception
    {
        String[] args = {"test1", "test2"};

        Main main = new Main(args);
        main.start();

        assertEquals("[test1, test2]", main.getMessage());
    }
}
