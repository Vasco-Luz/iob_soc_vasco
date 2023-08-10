`timescale 1 ns / 1 ps
`include "iob_utils.vh"
`include "iob_soc_boot_conf.vh"
`include "iob_soc_boot_swreg_def.vh"
`include "iob_soc_conf.vh"

module iob_soc_boot #(
    `include "iob_soc_boot_params.vs"
) (
    `include "iob_soc_boot_io.vs"
);

    `include "iob_soc_boot_swreg_inst.vs"

    assign boot_ctrl_o = CTR;




   
    /*//cpu interface: rdata, rvalid and ready
    //assign iob_rdata_o = {{(DATA_W-1){1'b0}},boot_o}; //fixme
    iob_reg #(1,0) rvalid_reg (clk_i, arst_i, cke_i, iob_avalid_i & ~(|iob_wstrb_i), iob_rvalid_o);
    //assign iob_ready_o = 1'b1; //fixme
        
    //boot control register: {cpu_reset, boot, preboot}
    wire                       bootctr_wr = iob_avalid_i & (iob_addr_i == `IOB_SOC_BOOT_CTR_ADDR) |iob_wstrb_i; 
    iob_reg_e #(2,1) bootnxt (clk_i, arst_i, cke_i, boot_wr, iob_wdata_i[1:0], CTR);



    //create CPU reset pulse
    wire                       cpu_rst_req;
    assign cpu_rst_req = iob_avalid_i & (|iob_wstrb_i) & iob_wdata_i[2];
    
    iob_pulse_gen #(
        .START(0),
        .DURATION(100)
        ) 
    reset_pulse
      (
       .clk_i(clk_i),
       .arst_i(arst_i),
       .cke_i(cke_i),
       .start_i(cpu_rst_req),
       .pulse_o(cpu_rst_o)
       );
 
 
    //
    //INSTANTIATE ROM
    //
    iob_rom_dp #(
        .DATA_W(DATA_W),
        .ADDR_W(`IOB_SOC_BOOTROM_ADDR_W-1),
        .HEXFILE("iob_soc_boot.hex") //todo iob_soc_rom.hex
        )
    sp_rom0 
      (
       .clk_i(clk_i),
 
       //instruction memory interface
       .r_en_a_i(ibus_avalid_i),
       .addr_a_i(ibus_addr_i),
       .r_data_a_o(ibus_rdata_o),
 
       //data memory interface
       .r_en_b_i(dbus_avalid_i),
       .addr_b_i(iob_addr_i)
       //.r_data_b_o(iob_rdata_o) //fixme
       
       );*/

endmodule
