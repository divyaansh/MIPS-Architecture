library verilog;
use verilog.vl_types.all;
entity and32b is
    port(
        o               : out    vl_logic_vector(31 downto 0);
        a               : in     vl_logic_vector(31 downto 0);
        b               : in     vl_logic_vector(31 downto 0)
    );
end and32b;
