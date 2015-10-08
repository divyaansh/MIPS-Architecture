library verilog;
use verilog.vl_types.all;
entity fulladder4b is
    port(
        s               : out    vl_logic_vector(3 downto 0);
        co              : out    vl_logic;
        x               : in     vl_logic_vector(3 downto 0);
        y               : in     vl_logic_vector(3 downto 0);
        ci              : in     vl_logic
    );
end fulladder4b;
