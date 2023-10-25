`timescale 1ns / 1ps



module axil2iob #(
   parameter AXIL_ADDR_W = 21,           // AXI Lite address bus width in bits
   parameter AXIL_DATA_W = 21,           // AXI Lite data bus width in bits
   parameter ADDR_W      = AXIL_ADDR_W,  // IOb address bus width in bits
   parameter DATA_W      = AXIL_DATA_W   // IOb data bus width in bits
) (
   // Global signals
   `include "clk_rst_s_port.vs"

   // AXI4 Lite slave interface
   `include "iob_axil_s_port.vs"

   // IOb master interface
   `include "iob_m_port.vs"
);

   //
   // COMPUTE AXIL OUTPUTS
   //

   // write address
   assign axil_awready_o = iob_ready_i;
   assign axil_awprot_o  = 3'b000;
   
   // write
   assign axil_wready_o  = iob_ready_i;

   // write response
   assign axil_bresp_o   = 2'b0;
   assign axil_bvalid_o  = 1'b1;

   // read address
   assign axil_arready_o = iob_ready_i;
   assign axil_arprot_o  = 3'b000;

   // read
   assign axil_rdata_o   = iob_rdata_i;
   assign axil_rresp_o   = 2'b0;
   assign axil_rvalid_o  = iob_rvalid_i;

   //
   // COMPUTE IOb OUTPUTS
   //
   assign iob_avalid_o   = axil_awvalid_i | axil_wvalid_i | axil_arvalid_i;
   assign iob_addr_o     = axil_awvalid_i ? axil_awaddr_i : axil_araddr_i;
   assign iob_wdata_o    = axil_wdata_i;
   assign iob_wstrb_o    = axil_wvalid_i ? axil_wstrb_i : {DATA_W / 8{1'b0}};

endmodule
