//-------------------------------------------------------------------------
//      Donkey Kong Country                                              --
//      Jeongmin Park, Shivani Mouleewaran                               --
//      Spring 2017                                                      --                                        
//      ECE 385 Final Project                                            --
//-------------------------------------------------------------------------

module StaticFrame( input               CLOCK_50,
						  input        [3:0]  KEY,          //Key 0 is used as reset
						  output logic [6:0]  HEX0, HEX1,
						  
						  //PS2 interface
						  input logic PS2_CLK,
						  input logic PS2_DAT,
						  
						  // VGA Interface 
						  output logic [7:0]  VGA_R,        //VGA Red
													 VGA_G,        //VGA Green
													 VGA_B,        //VGA Blue
						  output logic        VGA_CLK,      //VGA Clock
													 VGA_SYNC_N,   //VGA Sync signal
													 VGA_BLANK_N,  //VGA Blank signal
													 VGA_VS,       //VGA virtical sync signal
													 VGA_HS,       //VGA horizontal sync signal
							
						  // SDRAM Interface for Nios II
						  output logic [12:0] DRAM_ADDR,    //SDRAM Address 13 Bits
						  inout  wire  [31:0] DRAM_DQ,      //SDRAM Data 32 Bits
						  output logic [1:0]  DRAM_BA,      //SDRAM Bank Address 2 Bits
						  output logic [3:0]  DRAM_DQM,     //SDRAM Data Mast 4 Bits
						  output logic        DRAM_RAS_N,   //SDRAM Row Address Strobe
													 DRAM_CAS_N,   //SDRAM Column Address Strobe
													 DRAM_CKE,     //SDRAM Clock Enable
													 DRAM_WE_N,    //SDRAM Write Enable
													 DRAM_CS_N,    //SDRAM Chip Select
													 DRAM_CLK,      //SDRAM Clock
						
						  // SRAM Buffer Interface
						  inout wire [15:0] buffer_DQ,
						  output logic [19:0] buffer_ADDR,
						  output logic buffer_LB,
										   buffer_UB,
										   buffer_CE,
										   buffer_OE,
										   buffer_WE,
										  
						 // Flash Memory Interface
						 inout wire [7:0] FL_DQ,
						 input logic FL_RY,
						 output logic [22:0] FL_ADDR,
						 output logic FL_CE_N,
										  FL_OE_N,
										 
										  FL_RST_N,
										  FL_WE_N,
										  FL_WP_N
);
    
    //Clock and reset signals
	 logic Reset_h, Clk;
    assign Clk = CLOCK_50;
    assign {Reset_h} = ((~(KEY[0])) | dead);  // The push buttons are active low

	 logic dead;
	 
	 //PS2 keyboard logic variables
	 logic [7:0] keycode;
	 logic pressed;
	 
	 logic [3:0] background_out;
	 logic [15:0] img1;
	 logic [15:0] img2;
	 logic [18:0] readadd; 
	 logic [9:0] DrawX, DrawY;
	 
	 logic [18:0] framenum;
	 logic [3:0] DKmotion;
	
	 logic [18:0] tempadd;
	 logic [9:0] DKX, DKY;
	 logic [15:0] tempkeycode;
	 assign DKX = 10'd70;
	 assign DKY = 10'd280;
	 logic [7:0] height;
	 assign height = 8'd100;
	 logic [7:0] width;
	 assign width = 8'd62;
	
	 logic DK_X;
	 logic DK_Y;
	
	 logic [24:0] counter_logic;
	 
	 //assign tempkeycode = 16'h0000; temp keycode assigned for debugging purposes
	 
	 logic[18:0] sprite_addr;
	 logic [3:0] sprite0;
	 logic [3:0] sprite1;
	 logic [3:0] sprite2;
	 logic [3:0] sprite3;
	 logic [3:0] sprite_out;
    logic [3:0] walk1_sprite;
    logic [3:0] walk2_sprite;
	 logic [3:0] jump1_sprite;
	 logic [3:0] jump2_sprite;
	 logic [3:0] shock1_sprite;
	 logic [3:0] shock2_sprite;
	 
	 logic BGsel;
	 logic [3:0] BGout1;
	 logic [3:0] BGout2;
	 logic [3:0] BGout;
	 logic [18:0] BG_add;
	 
	 logic [22:0] BG_temp_add; 
	 
	 logic [22:0] tempy;
	 assign tempy[9:0] = DrawY;
	 
	 //Flash memory logic variables
	 assign FL_CE_N = 1'd0;
	 assign FL_OE_N = 1'd0;
	 assign FL_WE_N = 1'd1;
 	 assign FL_RST_N = 1'd1;
	 assign FL_WP_N = 1'd1;


	 logic [15:0] outX, outY, oldX, oldY;
	 logic [3:0] No;
	 
	 //Candy Kong logic variables
	 logic [18:0] candy_frame;
	 logic [18:0] candy_addr;
	 logic [3:0] candy_out;
	 logic [15:0] candy_img;
	 
	 //banana logic variables
	 logic [18:0] banana_frame;
	 logic [18:0] banana_addr1;
	 logic [2:0] banana_out1;
	 logic [15:0] banana_img1;
	 logic [18:0] banana_addr2;
	 logic [2:0] banana_out2;
	 logic [15:0] banana_img2;
	 logic [18:0] banana_addr3;
	 logic [2:0] banana_out3;
	 logic [15:0] banana_img3;
	 logic [18:0] banana_addr4;
	 logic [2:0] banana_out4;
	 logic [15:0] banana_img4;
	 logic [18:0] banana_addr5;
	 logic [2:0] banana_out5;
	 logic [15:0] banana_img5;
	 logic [4:0] bananas;
	 logic [2:0] banana_num;
	 
	 //font sprites logic variables
	 logic [18:0] text_addr;
	 logic [2:0] text_out;
	 logic [15:0] text_img;
	 
	 //logic [3:0] No;
	 //PS2 Keyboard
	 
	 death DK_death(.Y(oldY), .out(dead));

	 keyboard PKeyboard(.Clk(Clk), .psClk(PS2_CLK),.psData(PS2_DAT), .reset(Reset_h), .keyCode(keycode), .press(pressed));
	 

	 addcheck ac (.in(buffer_ADDR), .X(DrawX), .Y(DrawY));
	 BGAddr BAadd(.DrawX(DrawX), .DrawY(DrawY), .outX(outX), .out(BG_temp_add));
	

	 Control_Logic_Static CL(.*, .clk(Clk), .reset(Reset_h), .bufferadd(buffer_ADDR), .keycode(keycode), .press(pressed), .frameX(DrawX), .frameY(DrawY),
						.DK_X(DK_X), .DK_Y(DK_Y), .no(No),
						.frame_num(framenum),.DK_motion(DKmotion), .BGadd(BG_add), .counter_out(counter_logic));
	 
	 //Candy Kong sprite configuration	 
	 Candy_Control_Logic candy(.clk(Clk), .reset(Reset_h), .keycode(keycode), .press(pressed), .frame_num(candy_frame));
	 Candy Candy_mem(.read_address(candy_addr), .Clk(Clk), .data_Out(candy_out));
	 Candy_Transform sugar(.in(candy_out),.out(candy_img));
	 
	 RealBackground RBG (.*, .Clk(Clk), .reset(Reset_h), .read_address((BG_temp_add / 22'd2)), .data_out(FL_DQ), .out_add(FL_ADDR), .out1(BGout1), .out2(BGout2), .sel(BGsel));	
	 Mux2_1 BGmux(.in1(BGout1), .in2(BGout2), .sel(BGsel), .out(BGout));
	 ColorTransformBG CTBG(.in(BGout),.out(img1));
	 
	 DKreg dD(.Clk(Clk), .Reset(Reset_h),
             .smallD(outX),
				 .bigD(outY),                                                
				 .smallD_out(oldX),
				 .bigD_out(oldY));
	 
	 //Donkey Kong background-based motion mapping	 
	 mapping2 Marauder(.*,
							.reset(Reset_h),
							.state(dummy_state),
							.prevX(oldX),
							.prevY(oldY),
							.counter(counter_logic),
							.DKmotion(DKmotion),
							.keycode(keycode),
							.press(pressed),
							.num(framenum),
							.X(outX),
							.Y(outY),
							.no(No));
	 
	 //Banana sprites configuration
	 Banana_Control_Logic BCL(.clk(Clk),.reset(Reset_h),.frame_num(banana_frame));
	 BananaAddr  BA(.*, .X(outX),
							 .DrawX(DrawX), .DrawY(DrawY), .framenum(banana_frame),
							 .out1(banana_addr1), .out2(banana_addr2), .out3(banana_addr3), .out4(banana_addr4), .out5(banana_addr5));
	 Banana Bananamem1(.read_address(banana_addr1), .Clk(Clk), .data_Out(banana_out1));
	 Banana_ColorTransform BCT1(.in(banana_out1), .out(banana_img1));
	 Banana Bananamem2(.read_address(banana_addr2), .Clk(Clk), .data_Out(banana_out2));
	 Banana_ColorTransform BCT2(.in(banana_out2), .out(banana_img2));
	 Banana Bananamem3(.read_address(banana_addr3), .Clk(Clk), .data_Out(banana_out3));
	 Banana_ColorTransform BCT3(.in(banana_out3), .out(banana_img3));
	 Banana Bananamem4(.read_address(banana_addr4), .Clk(Clk), .data_Out(banana_out4));
	 Banana_ColorTransform BCT4(.in(banana_out4), .out(banana_img4));
	 Banana Bananamem5(.read_address(banana_addr5), .Clk(Clk), .data_Out(banana_out5));
	 Banana_ColorTransform BCT5(.in(banana_out5), .out(banana_img5));
	 BananaCount Banana_count(.clk(Clk), .reset(Reset_h),  .X(outX), .Y(outY), .out(bananas));
	 BananaNum Banana_N(.bi(bananas), .deci(banana_num));
	 
	 //Font sprites configuration
	 TextAddr Text_A(.*, .DrawX(DrawX), .DrawY(DrawY), .framenum(banana_num), .out(text_addr)); //font sprite address calculator
	 Text Textmem1(.read_address(text_addr), .Clk(Clk), .data_Out(text_out)); //font sprite on chip mem
	 Text_ColorTransform TCF(.in(text_out), .out(text_img)); //font sprite data

	 
	 IdleDirection ID(.*, .DrawX(DrawX), .DrawY(DrawY), .DKX(DKX), .DKY(outY), .outX(outX), .framenum(framenum), .candy_frame(candy_frame), 
							.motion(DKmotion), .out(sprite_addr), .candy_out(candy_addr));
	 
	 Idle I (.read_address(sprite_addr), .Clk(Clk), .data_Out(sprite0));
	 
	 Walk1 WR1 (.read_address(sprite_addr), .Clk(Clk), .data_Out(walk1_sprite));
	 Walk2 WR2 (.read_address(sprite_addr), .Clk(Clk), .data_Out(walk2_sprite));
	 
	 Jump1 J1 (.read_address(sprite_addr), .Clk(Clk), .data_Out(jump1_sprite));
	 Jump2 J2 (.read_address(sprite_addr), .Clk(Clk), .data_Out(jump2_sprite));

	 Shock1 S1 (.read_address(sprite_addr), .Clk(Clk), .data_Out(shock1_sprite));
	 Shock2 S2 (.read_address(sprite_addr), .Clk(Clk), .data_Out(shock2_sprite));
	 
	 walkMux WM(.in1(walk1_sprite), .in2(walk2_sprite), .frame(framenum) ,.out(sprite1));
	 
	 jumpMux JM(.in1(jump1_sprite), .in2(jump2_sprite), .frame(framenum) ,.out(sprite2));
	 
	 jumpMux SM(.in1(shock1_sprite), .in2(shock2_sprite), .frame(framenum) ,.out(sprite3));

	 spriteMUX MUX1 (.in0(sprite0), .in1(sprite1), .in2(sprite2), .in3(sprite3), .sel(DKmotion), .out(sprite_out));
	 
	 DK_Transform DKColor (.*, .in(sprite_out),.out(img2));
	 
	 //Print sprites to the screen
	 PrintImg PI ( .*, .bg(img1), .img(img2), .candy(candy_img), .text(text_img), .banana1(banana_img1), .banana2(banana_img2), .banana3(banana_img3) , .banana4(banana_img4),
						.banana5(banana_img5), .bananas(bananas), .DrawX(DrawX), .DrawY(DrawY), .DK_X(DKX), .DK_Y(outY), .outX(outX),
					  .H(height), .W(width), .sel(DKmotion) ,.out(buffer_DQ));
	 
	 //NIOS II setup
    nios_system niossytem(
						.buffer_out_DQ(buffer_DQ),    
						.buffer_out_ADDR(buffer_ADDR),  
						.buffer_out_LB_N(buffer_LB),  
						.buffer_out_UB_N(buffer_UB),  
						.buffer_out_CE_N(buffer_CE),  
						.buffer_out_OE_N(buffer_OE),  
						.buffer_out_WE_N(buffer_WE),  
						
						.clk_clk(Clk),          
						.reset_reset_n(KEY[0]),    
						
						
						.sdram_clk_clk(DRAM_CLK),    
						.sdram_wire_addr(DRAM_ADDR),  
						.sdram_wire_ba(DRAM_BA),   
						.sdram_wire_cas_n(DRAM_CAS_N), 
						.sdram_wire_cke(DRAM_CKE),   
						.sdram_wire_cs_n(DRAM_CS_N),  
						.sdram_wire_dq(DRAM_DQ),   
						.sdram_wire_dqm(DRAM_DQM),  
						.sdram_wire_ras_n(DRAM_RAS_N), 
						.sdram_wire_we_n(DRAM_WE_N),  	
						
		
						.vga_out_CLK(VGA_CLK),      
						.vga_out_HS(VGA_HS),       
						.vga_out_VS(VGA_VS),      
						.vga_out_BLANK(VGA_BLANK_N),   
						.vga_out_SYNC(VGA_SYNC_N),    
						.vga_out_R(VGA_R),       
						.vga_out_G(VGA_G),       
						.vga_out_B(VGA_B)         
	);
	 
	 //Hex Drivers for Debugging
    HexDriver hex_inst_0 (keycode[3:0], HEX0);
    HexDriver hex_inst_1 (keycode[7:4], HEX1);
	 
    
endmodule
