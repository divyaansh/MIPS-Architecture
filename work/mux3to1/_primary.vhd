library verilog;
use verilog.vl_types.all;
entity mux3to1 is
    port(
        o               : out    vl_logic_vector(31 downto 0);
        ctrl            : in     vl_logic_vector(1 downto 0);
        a               : in     vl_logic_vector(31 downto 0);
        b               : in     vl_logic_vector(31 downto 0);
        c               : in     vl_logic_vector(31 downto 0)
    );
end mux3to1;
