------------------------------------------------------------------------
-- University  : University of Alberta
-- Course      : ECE 410
-- Project     : Lab 3
-- File        : data_memory.vhdl
-- Authors     : Antonio Alejandro Andara Lara
-- Date        : 23-Oct-2025
------------------------------------------------------------------------
-- Description  : 1 KB data memory with 32-bit read/write interface.
--                Supports synchronous writes and asynchronous reads.
------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY data_mem IS
    PORT (
        address    : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        write_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        data       : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        write_en   : IN STD_LOGIC;
        clock      : IN STD_LOGIC
    );
END ENTITY;

ARCHITECTURE rtl OF data_mem IS

    TYPE memory_data IS ARRAY (0 TO 1023) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL RAM : memory_data := (
        -- Test values (little-endian)
        4 => x"78", 5 => x"56", 6 => x"34", 7 => x"12",     -- Address 4: 0x12345678
        8 => x"EF", 9 => x"BE", 10 => x"AD", 11 => x"DE",   -- Address 8: 0xDEADBEEF
        12 => x"11", 13 => x"11", 14 => x"11", 15 => x"11", -- Address 12: 0x11111111
        OTHERS => (OTHERS => '0')

    );

    SIGNAL addr_int : INTEGER := 0;

BEGIN

    -- Convert 32-bit address to integer
    addr_int <= to_integer(unsigned(address(9 DOWNTO 0))); -- 1 KB = 10-bit addressing

    -- Synchronous write
    PROCESS (clock)
    BEGIN
        IF rising_edge(clock) THEN
            -- TODO: implement byte-wise write operation
            -- Write 32-bit word to memory in little-endian byte order 
        END IF;
    END PROCESS;

    -- Combinational read
    -- TODO: reconstruct 32-bit word from four bytes in little-endian order
    data <= -- your expression here

    END ARCHITECTURE rtl;
