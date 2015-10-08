module mux2to1(o,c,a,b);//a to 0, b to 1
    input [31:0] a,b;
    input c;
    output [31:0] o;
    assign o=c?b:a;
endmodule

module mux3to1(o,ctrl,a,b,c);//a to 0, b to 1
    input [31:0] a,b,c;
    input [1:0] ctrl;
    output [31:0] o;
    assign o=ctrl[1]?c:(ctrl[0]?b:a);
endmodule

module and32b(o,a,b);
    input [31:0] a,b;
    output [31:0] o;
    assign o=a&b;
endmodule

module or32b(o,a,b);
    input [31:0] a,b;
    output [31:0] o;
    assign o=a|b;
endmodule

module fa32b(s,co,a,b,ci);
    input [31:0] a,b;
    input ci;
    output [31:0] s;
    output co;
    assign {co,s}=a+b+ci;
endmodule

module alu(a,b,bi,ci,op,res,co);
    input [31:0] a,b;
    input bi,ci;
    input [1:0] op;
    output [31:0] res;
    output co;
    wire [31:0] w,x,y,z,bnot;
    assign bnot=~b;
    mux2to1 m1(w,bi,b,bnot);
    and32b a1(x,a,w);
    or32b o1(y,a,w);
    fa32b f1(z,co,a,w,ci);
    mux3to1 m2(res,op,x,y,z);
endmodule

module tb_8bit2to1mux;   
   reg [7:0] INP1, INP2;   
   reg SEL;   
   wire [7:0] out;   
   mux2to1 M1(out,SEL,INP1,INP2);   
   initial   
   begin    
      $monitor(,$time," out=%b",out);
      INP1=8'b10101010;     
      INP2=8'b01010101;     
      SEL=1'b0;     
      #100 SEL=1'b1;     
      #1000 $finish;
   end
 endmodule 

module tbALU();
   reg Binvert, Carryin; 
   reg [1:0] Operation; 
   reg [31:0] a,b; 
   wire [31:0] Result; 
   wire CarryOut; 
   alu alu1(a,b,Binvert,Carryin,Operation,Result,CarryOut);  
   initial 
   begin 
      $monitor(,$time," a=%b,b=%b,Op=%b,Bin=%b,Cin=%b,Result=%b,Cout=%b",a,b,Operation,Binvert,Carryin, Result,CarryOut);
      a=32'ha5a5a5a5; 
      b=32'h5a5a5a5a; 
      Operation=2'b00;
      Binvert=1'b0; 
      Carryin=1'b0; //must perform AND resulting in zero 
      #100 Operation=2'b01; //OR 
      #100 Operation=2'b10; //ADD 
      #100 Binvert=1'b1;//SUB 
      #200 $finish; 
    end 
endmodule 