library verilog;
use verilog.vl_types.all;
entity fulladder1b is
    port(
        s               : out    vl_logic;
        c               : out    vl_logic;
        x               : in     vl_logic;
        y               : in     vl_logic;
        z               : in     vl_logic
    );
end fulladder1b;
