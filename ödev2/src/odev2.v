module tekram

   #(parameter ADDR_WIDTH =4,
    parameter DATA_WIDTH =16,
    parameter DEPTH =16
)

       (input               clk,
        input [ADDR_WIDTH-1:0] addr,
        inout [DATA_WIDTH-1:0] data,
        input              cs,wr,oe
  );

 reg [DATA_WIDTH-1:0] data_out;
 reg [DATA_WIDTH -1:0] mem;
 

 always @ (posedge clk) begin
    if (cs && wr)
        mem[addr] <= data;
 end

 always @ (negedge clk) begin
    if (cs && !wr && oe)
        data_out <= mem[addr];
        
 end 


 assign data= cs && oe && !wr ? data_out : 16'hz;
endmodule