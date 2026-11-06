------------------------------------------------------------------------
-- University  : University of Alberta
-- Course      : ECE 410
-- Project     : Lab 3
-- File        : instruction_memory.vhdl
-- Authors     : Antonio Alejandro Andara Lara
-- Date        : 23-Oct-2025
------------------------------------------------------------------------
-- Description  : 1 KB instruction memory (ROM) storing a simple RISC-V program.
--                Provides 32-bit instruction fetch based on byte address.
------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY instr_mem IS
    PORT (
        address : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        data    : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE rtl OF instr_mem IS

    -- Byte-addressable ROM
    TYPE memory_data IS ARRAY (0 TO 1023) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
    CONSTANT ROM : memory_data := (
        -- Program (little-endian)
        0 => x"83", 1 => x"25", 2 => x"45", 3 => x"00",     -- lw x11, 4(x10)
        4 => x"23", 5 => x"24", 6 => x"B5", 7 => x"00",     -- sw x11, 8(x10)
        8 => x"03", 9 => x"26", 10 => x"C0", 11 => x"00",   -- lw x12, 12(x0)
        12 => x"B3", 13 => x"06", 14 => x"B6", 15 => x"00", -- add x13, x12, x11

        OTHERS => (OTHERS => '0')
    );

    SIGNAL addr_int : INTEGER := 0;

BEGIN
    addr_int <= to_integer(unsigned(address(9 DOWNTO 0))); -- Address conversion fits 1 KB of ROM

    -- read 4 consecutive bytes form one 32-bit word
    data <= ROM(addr_int + 3) &
            ROM(addr_int + 2) &
            ROM(addr_int + 1) &
            ROM(addr_int);

END ARCHITECTURE rtl;
