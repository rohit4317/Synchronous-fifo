`timescale 1ns/1ps

module tb_sync_fifo;
    reg clk, rst, wr_en, rd_en;
    reg [7:0] din;
    wire [7:0] dout;
    wire full, empty;

    sync_fifo #(.DATA_WIDTH(8), .DEPTH(8), .ADDR_WIDTH(3)) dut (
        .clk(clk), .rst(rst), .wr_en(wr_en), .rd_en(rd_en),
        .din(din), .dout(dout), .full(full), .empty(empty)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0; rst = 1; wr_en = 0; rd_en = 0; din = 0;
        repeat (2) @(posedge clk);
        rst = 0;

        @(negedge clk); wr_en = 1; din = 8'hA5;
        @(negedge clk); din = 8'h3C;
        @(negedge clk); wr_en = 0;
        $display("After writes: full=%b empty=%b", full, empty);

        @(negedge clk); rd_en = 1;
        @(posedge clk); #1; $display("Read data 1 = %h", dout);
        @(posedge clk); #1; $display("Read data 2 = %h", dout);
        @(negedge clk); rd_en = 0;
        $display("After reads: full=%b empty=%b", full, empty);

        $finish;
    end
endmodule
