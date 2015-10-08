module halfadder1b(s,c,x,y);
    input x,y;
    output s,c;
    xor(s,x,y);
    and(c,x,y);
endmodule

module fulladder1b(s,c,x,y,z);
    input x,y,z;
    output s,c;
    wire p,q,r;
    halfadder1b ha1(p,q,x,y);
    halfadder1b ha2(s,r,p,z);
    or(c,q,r);
endmodule

module fulladder4b(s,co,x,y,ci);
    input [3:0] x,y;
    input ci;
    output [3:0] s;
    output co;
    wire [2:0] c;
    fulladder1b fa0(s[0],c[0],x[0],y[0],ci);
    fulladder1b fa1(s[1],c[1],x[1],y[1],c[0]);
    fulladder1b fa2(s[2],c[2],x[2],y[2],c[1]);
    fulladder1b fa3(s[3],co,x[3],y[3],c[2]);
endmodule

module testbench;
    reg [3:0] a,b;
    reg ci;
    wire [3:0] s;
    wire co;
    fulladder4b fa4(s,co,a,b,ci);
    initial
       begin
           $monitor(,$time," a=%b b=%b ci=%b, co=%b s=%b",a,b,ci,co,s);
           #0 a=4'b0110;b=4'b0110;ci=1'b0;
           #2 a=4'b1100;b=4'b1110;ci=1'b1;
           #2 $finish;
       end
endmodule

