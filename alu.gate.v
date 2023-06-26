/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP2
// Date      : Fri Apr 21 17:05:56 2023
/////////////////////////////////////////////////////////////


module alu_DW01_addsub_0 ( A, B, CI, ADD_SUB, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI, ADD_SUB;
  output CO;

  wire   [9:0] carry;
  wire   [8:0] B_AS;
  assign carry[0] = ADD_SUB;

  FADDX1 U1_7 ( .A(A[7]), .B(B_AS[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  FADDX1 U1_6 ( .A(A[6]), .B(B_AS[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  FADDX1 U1_5 ( .A(A[5]), .B(B_AS[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  FADDX1 U1_4 ( .A(A[4]), .B(B_AS[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  FADDX1 U1_3 ( .A(A[3]), .B(B_AS[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  FADDX1 U1_2 ( .A(A[2]), .B(B_AS[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  FADDX1 U1_1 ( .A(A[1]), .B(B_AS[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1]) );
  FADDX1 U1_0 ( .A(A[0]), .B(B_AS[0]), .CI(carry[0]), .CO(carry[1]), .S(SUM[0]) );
  XOR3X1 U1_8 ( .IN1(A[8]), .IN2(carry[0]), .IN3(carry[8]), .Q(SUM[8]) );
  XOR2X1 U1 ( .IN1(B[7]), .IN2(carry[0]), .Q(B_AS[7]) );
  XOR2X1 U2 ( .IN1(B[6]), .IN2(carry[0]), .Q(B_AS[6]) );
  XOR2X1 U3 ( .IN1(B[5]), .IN2(carry[0]), .Q(B_AS[5]) );
  XOR2X1 U4 ( .IN1(B[4]), .IN2(carry[0]), .Q(B_AS[4]) );
  XOR2X1 U5 ( .IN1(B[3]), .IN2(carry[0]), .Q(B_AS[3]) );
  XOR2X1 U6 ( .IN1(B[2]), .IN2(carry[0]), .Q(B_AS[2]) );
  XOR2X1 U7 ( .IN1(B[1]), .IN2(carry[0]), .Q(B_AS[1]) );
  XOR2X1 U8 ( .IN1(B[0]), .IN2(carry[0]), .Q(B_AS[0]) );
endmodule


module alu ( in_a, in_b, opcode, alu_out, alu_zero, alu_carry );
  input [7:0] in_a;
  input [7:0] in_b;
  input [3:0] opcode;
  output [7:0] alu_out;
  output alu_zero, alu_carry;
  wire   N51, N52, N53, N54, N55, N56, N57, N58, N59, N86, N87, N88, N89, N90,
         N91, N92, N93, N94, N95, N96, N97, N98, N99, N100, N101, N102, N103,
         N104, N105, N106, N107, N108, N109, N131, N136, N137, \U3/U1/Z_0 ,
         \U3/U1/Z_1 , \U3/U1/Z_2 , \U3/U1/Z_3 , \U3/U1/Z_4 , \U3/U1/Z_5 ,
         \U3/U1/Z_6 , \U3/U1/Z_7 , \U3/U2/Z_0 , \U3/U2/Z_1 , \U3/U2/Z_2 ,
         \U3/U2/Z_3 , \U3/U2/Z_4 , \U3/U2/Z_5 , \U3/U2/Z_6 , \U3/U2/Z_7 ,
         \U3/U3/Z_0 , n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, n141,
         n142, n143, n144, n145, n146, n147, n148, n149, n150, n151, n152,
         n153, n154, n155, n156, n157, n158, n159, n160, n161, n162, n163,
         n164, n165, n166, n167, n168, n169, n170, n171, n172, n173, n174,
         n175, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185,
         n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196,
         n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213;
  assign alu_zero = N131;

  alu_DW01_addsub_0 r24 ( .A({n213, \U3/U1/Z_7 , \U3/U1/Z_6 , \U3/U1/Z_5 , 
        \U3/U1/Z_4 , \U3/U1/Z_3 , \U3/U1/Z_2 , \U3/U1/Z_1 , \U3/U1/Z_0 }), .B(
        {1'b0, \U3/U2/Z_7 , \U3/U2/Z_6 , \U3/U2/Z_5 , \U3/U2/Z_4 , \U3/U2/Z_3 , 
        \U3/U2/Z_2 , \U3/U2/Z_1 , \U3/U2/Z_0 }), .CI(1'b0), .ADD_SUB(
        \U3/U3/Z_0 ), .SUM({N59, N58, N57, N56, N55, N54, N53, N52, N51}) );
  LATCHX1 alu_carry_reg ( .CLK(N136), .D(N137), .Q(alu_carry) );
  INVX0 U138 ( .IN(n131), .QN(n163) );
  INVX0 U139 ( .IN(n133), .QN(n165) );
  INVX0 U140 ( .IN(n122), .QN(n166) );
  INVX0 U141 ( .IN(opcode[0]), .QN(n162) );
  INVX0 U142 ( .IN(opcode[2]), .QN(n164) );
  NOR2X0 U143 ( .IN1(n164), .IN2(opcode[3]), .QN(n123) );
  AND2X1 U144 ( .IN1(n123), .IN2(opcode[0]), .Q(n124) );
  AND2X1 U145 ( .IN1(n124), .IN2(opcode[1]), .Q(n157) );
  AND3X1 U146 ( .IN1(opcode[1]), .IN2(n162), .IN3(n123), .Q(n154) );
  XNOR2X1 U147 ( .IN1(opcode[3]), .IN2(n162), .Q(n122) );
  AO22X1 U148 ( .IN1(n166), .IN2(opcode[1]), .IN3(n122), .IN4(n169), .Q(n126)
         );
  NAND2X0 U149 ( .IN1(n162), .IN2(n196), .QN(n131) );
  NAND2X0 U150 ( .IN1(n123), .IN2(n163), .QN(n133) );
  AO21X1 U151 ( .IN1(n126), .IN2(n164), .IN3(n165), .Q(n128) );
  AND2X1 U152 ( .IN1(n124), .IN2(n196), .Q(n158) );
  OA22X1 U153 ( .IN1(n211), .IN2(opcode[1]), .IN3(in_a[0]), .IN4(n196), .Q(
        n125) );
  NOR4X0 U154 ( .IN1(opcode[2]), .IN2(n166), .IN3(n126), .IN4(n125), .QN(n127)
         );
  AO221X1 U155 ( .IN1(N51), .IN2(n128), .IN3(N93), .IN4(n158), .IN5(n127), .Q(
        n129) );
  AO221X1 U156 ( .IN1(N109), .IN2(n157), .IN3(N101), .IN4(n154), .IN5(n129), 
        .Q(alu_out[0]) );
  NOR2X0 U157 ( .IN1(n169), .IN2(opcode[2]), .QN(n132) );
  AND2X1 U158 ( .IN1(n132), .IN2(n163), .Q(n151) );
  AND3X1 U159 ( .IN1(opcode[1]), .IN2(n162), .IN3(n132), .Q(n159) );
  AO22X1 U160 ( .IN1(n211), .IN2(n159), .IN3(N108), .IN4(n157), .Q(n130) );
  AO221X1 U161 ( .IN1(n151), .IN2(in_a[2]), .IN3(N92), .IN4(n158), .IN5(n130), 
        .Q(n137) );
  AND3X1 U162 ( .IN1(opcode[0]), .IN2(n196), .IN3(n132), .Q(n155) );
  NAND3X0 U163 ( .IN1(n169), .IN2(n164), .IN3(n131), .QN(n135) );
  NAND3X0 U164 ( .IN1(opcode[0]), .IN2(opcode[1]), .IN3(n132), .QN(n134) );
  NAND3X0 U165 ( .IN1(n135), .IN2(n134), .IN3(n133), .QN(n156) );
  AO222X1 U166 ( .IN1(N100), .IN2(n154), .IN3(in_a[0]), .IN4(n155), .IN5(N52), 
        .IN6(n156), .Q(n136) );
  OR2X1 U167 ( .IN1(n137), .IN2(n136), .Q(alu_out[1]) );
  AO22X1 U168 ( .IN1(n210), .IN2(n159), .IN3(N107), .IN4(n157), .Q(n138) );
  AO221X1 U169 ( .IN1(n151), .IN2(in_a[3]), .IN3(N91), .IN4(n158), .IN5(n138), 
        .Q(n140) );
  AO222X1 U170 ( .IN1(N99), .IN2(n154), .IN3(n155), .IN4(in_a[1]), .IN5(N53), 
        .IN6(n156), .Q(n139) );
  OR2X1 U171 ( .IN1(n140), .IN2(n139), .Q(alu_out[2]) );
  AO22X1 U172 ( .IN1(n209), .IN2(n159), .IN3(N106), .IN4(n157), .Q(n141) );
  AO221X1 U173 ( .IN1(n151), .IN2(in_a[4]), .IN3(N90), .IN4(n158), .IN5(n141), 
        .Q(n143) );
  AO222X1 U174 ( .IN1(N98), .IN2(n154), .IN3(n155), .IN4(in_a[2]), .IN5(N54), 
        .IN6(n156), .Q(n142) );
  OR2X1 U175 ( .IN1(n143), .IN2(n142), .Q(alu_out[3]) );
  AO22X1 U176 ( .IN1(n208), .IN2(n159), .IN3(N105), .IN4(n157), .Q(n144) );
  AO221X1 U177 ( .IN1(n151), .IN2(in_a[5]), .IN3(N89), .IN4(n158), .IN5(n144), 
        .Q(n146) );
  AO222X1 U178 ( .IN1(N97), .IN2(n154), .IN3(n155), .IN4(in_a[3]), .IN5(N55), 
        .IN6(n156), .Q(n145) );
  OR2X1 U179 ( .IN1(n146), .IN2(n145), .Q(alu_out[4]) );
  AO22X1 U180 ( .IN1(n207), .IN2(n159), .IN3(N104), .IN4(n157), .Q(n147) );
  AO221X1 U181 ( .IN1(n151), .IN2(in_a[6]), .IN3(N88), .IN4(n158), .IN5(n147), 
        .Q(n149) );
  AO222X1 U182 ( .IN1(N96), .IN2(n154), .IN3(n155), .IN4(in_a[4]), .IN5(N56), 
        .IN6(n156), .Q(n148) );
  OR2X1 U183 ( .IN1(n149), .IN2(n148), .Q(alu_out[5]) );
  AO22X1 U184 ( .IN1(n206), .IN2(n159), .IN3(N103), .IN4(n157), .Q(n150) );
  AO221X1 U185 ( .IN1(n151), .IN2(in_a[7]), .IN3(N87), .IN4(n158), .IN5(n150), 
        .Q(n153) );
  AO222X1 U186 ( .IN1(N95), .IN2(n154), .IN3(n155), .IN4(in_a[5]), .IN5(N57), 
        .IN6(n156), .Q(n152) );
  OR2X1 U187 ( .IN1(n153), .IN2(n152), .Q(alu_out[6]) );
  AOI222X1 U188 ( .IN1(N58), .IN2(n156), .IN3(n155), .IN4(in_a[6]), .IN5(N94), 
        .IN6(n154), .QN(n161) );
  AOI222X1 U189 ( .IN1(n205), .IN2(n159), .IN3(N86), .IN4(n158), .IN5(N102), 
        .IN6(n157), .QN(n160) );
  NAND2X0 U190 ( .IN1(n161), .IN2(n160), .QN(alu_out[7]) );
  NAND2X0 U191 ( .IN1(n167), .IN2(n168), .QN(\U3/U3/Z_0 ) );
  NAND3X0 U192 ( .IN1(n164), .IN2(n169), .IN3(n170), .QN(n168) );
  NOR2X0 U193 ( .IN1(n171), .IN2(n172), .QN(\U3/U2/Z_7 ) );
  NOR2X0 U194 ( .IN1(n171), .IN2(n173), .QN(\U3/U2/Z_6 ) );
  NOR2X0 U195 ( .IN1(n171), .IN2(n174), .QN(\U3/U2/Z_5 ) );
  NOR2X0 U196 ( .IN1(n171), .IN2(n175), .QN(\U3/U2/Z_4 ) );
  NOR2X0 U197 ( .IN1(n171), .IN2(n176), .QN(\U3/U2/Z_3 ) );
  NOR2X0 U198 ( .IN1(n171), .IN2(n177), .QN(\U3/U2/Z_2 ) );
  NOR2X0 U199 ( .IN1(n171), .IN2(n178), .QN(\U3/U2/Z_1 ) );
  NAND4X0 U200 ( .IN1(n179), .IN2(n180), .IN3(n167), .IN4(n181), .QN(
        \U3/U2/Z_0 ) );
  NAND2X0 U201 ( .IN1(in_b[0]), .IN2(n182), .QN(n179) );
  MUX21X1 U202 ( .IN1(n183), .IN2(n213), .S(n205), .Q(\U3/U1/Z_7 ) );
  MUX21X1 U203 ( .IN1(n183), .IN2(n213), .S(n206), .Q(\U3/U1/Z_6 ) );
  MUX21X1 U204 ( .IN1(n183), .IN2(n213), .S(n207), .Q(\U3/U1/Z_5 ) );
  MUX21X1 U205 ( .IN1(n183), .IN2(n213), .S(n208), .Q(\U3/U1/Z_4 ) );
  MUX21X1 U206 ( .IN1(n183), .IN2(n213), .S(n209), .Q(\U3/U1/Z_3 ) );
  MUX21X1 U207 ( .IN1(n183), .IN2(n213), .S(n210), .Q(\U3/U1/Z_2 ) );
  MUX21X1 U208 ( .IN1(n183), .IN2(n213), .S(n211), .Q(\U3/U1/Z_1 ) );
  MUX21X1 U209 ( .IN1(n183), .IN2(n213), .S(n212), .Q(\U3/U1/Z_0 ) );
  NAND3X0 U210 ( .IN1(n167), .IN2(n171), .IN3(n180), .QN(n183) );
  NOR2X0 U211 ( .IN1(n210), .IN2(n177), .QN(N99) );
  NOR2X0 U212 ( .IN1(n209), .IN2(n176), .QN(N98) );
  NOR2X0 U213 ( .IN1(n208), .IN2(n175), .QN(N97) );
  NOR2X0 U214 ( .IN1(n207), .IN2(n174), .QN(N96) );
  NOR2X0 U215 ( .IN1(n206), .IN2(n173), .QN(N95) );
  NOR2X0 U216 ( .IN1(n205), .IN2(n172), .QN(N94) );
  NAND2X0 U217 ( .IN1(n184), .IN2(n212), .QN(N93) );
  NAND2X0 U218 ( .IN1(n178), .IN2(n211), .QN(N92) );
  NAND2X0 U219 ( .IN1(n177), .IN2(n210), .QN(N91) );
  INVX0 U220 ( .IN(in_a[2]), .QN(n210) );
  NAND2X0 U221 ( .IN1(n176), .IN2(n209), .QN(N90) );
  INVX0 U222 ( .IN(in_a[3]), .QN(n209) );
  NAND2X0 U223 ( .IN1(n175), .IN2(n208), .QN(N89) );
  INVX0 U224 ( .IN(in_a[4]), .QN(n208) );
  NAND2X0 U225 ( .IN1(n174), .IN2(n207), .QN(N88) );
  NAND2X0 U226 ( .IN1(n173), .IN2(n206), .QN(N87) );
  NAND2X0 U227 ( .IN1(n172), .IN2(n205), .QN(N86) );
  OR4X1 U228 ( .IN1(n185), .IN2(n186), .IN3(n187), .IN4(n188), .Q(N137) );
  NOR4X0 U229 ( .IN1(n189), .IN2(n190), .IN3(N55), .IN4(N54), .QN(n188) );
  OR3X1 U230 ( .IN1(N58), .IN2(N57), .IN3(N56), .Q(n190) );
  OR4X1 U231 ( .IN1(N51), .IN2(n180), .IN3(N53), .IN4(N52), .Q(n189) );
  NAND2X0 U232 ( .IN1(n191), .IN2(n169), .QN(n180) );
  NOR4X0 U233 ( .IN1(n192), .IN2(n193), .IN3(in_a[4]), .IN4(in_a[3]), .QN(n187) );
  NAND3X0 U234 ( .IN1(n206), .IN2(n205), .IN3(n207), .QN(n193) );
  INVX0 U235 ( .IN(in_a[5]), .QN(n207) );
  INVX0 U236 ( .IN(in_a[7]), .QN(n205) );
  INVX0 U237 ( .IN(in_a[6]), .QN(n206) );
  OR4X1 U238 ( .IN1(n167), .IN2(in_a[0]), .IN3(in_a[1]), .IN4(in_a[2]), .Q(
        n192) );
  NAND2X0 U239 ( .IN1(opcode[2]), .IN2(n194), .QN(n167) );
  OA21X1 U240 ( .IN1(n213), .IN2(n182), .IN3(N59), .Q(n186) );
  INVX0 U241 ( .IN(n171), .QN(n182) );
  NAND3X0 U242 ( .IN1(n164), .IN2(n169), .IN3(n195), .QN(n171) );
  AO21X1 U243 ( .IN1(opcode[0]), .IN2(n196), .IN3(n170), .Q(n195) );
  INVX0 U244 ( .IN(n197), .QN(n170) );
  INVX0 U245 ( .IN(n181), .QN(n213) );
  NAND2X0 U246 ( .IN1(opcode[3]), .IN2(n191), .QN(n181) );
  AND3X1 U247 ( .IN1(opcode[0]), .IN2(n164), .IN3(opcode[1]), .Q(n191) );
  AND3X1 U248 ( .IN1(n198), .IN2(n164), .IN3(opcode[3]), .Q(n185) );
  NAND2X0 U249 ( .IN1(n197), .IN2(n199), .QN(n198) );
  NAND3X0 U250 ( .IN1(in_a[7]), .IN2(n196), .IN3(opcode[0]), .QN(n199) );
  NAND2X0 U251 ( .IN1(opcode[1]), .IN2(n162), .QN(n197) );
  NOR4X0 U252 ( .IN1(n200), .IN2(n201), .IN3(alu_out[4]), .IN4(alu_out[3]), 
        .QN(N131) );
  OR3X1 U253 ( .IN1(alu_out[7]), .IN2(alu_out[6]), .IN3(alu_out[5]), .Q(n201)
         );
  OR4X1 U254 ( .IN1(alu_out[2]), .IN2(alu_out[1]), .IN3(alu_out[0]), .IN4(n202), .Q(n200) );
  NAND2X0 U255 ( .IN1(N136), .IN2(n203), .QN(n202) );
  NAND3X0 U256 ( .IN1(opcode[1]), .IN2(opcode[0]), .IN3(opcode[3]), .QN(n203)
         );
  INVX0 U257 ( .IN(n204), .QN(N136) );
  MUX21X1 U258 ( .IN1(opcode[3]), .IN2(n194), .S(n164), .Q(n204) );
  AND3X1 U259 ( .IN1(n196), .IN2(n169), .IN3(n162), .Q(n194) );
  INVX0 U260 ( .IN(opcode[3]), .QN(n169) );
  INVX0 U261 ( .IN(opcode[1]), .QN(n196) );
  XNOR2X1 U262 ( .IN1(n184), .IN2(in_a[0]), .Q(N109) );
  XNOR2X1 U263 ( .IN1(n178), .IN2(in_a[1]), .Q(N108) );
  XNOR2X1 U264 ( .IN1(n177), .IN2(in_a[2]), .Q(N107) );
  INVX0 U265 ( .IN(in_b[2]), .QN(n177) );
  XNOR2X1 U266 ( .IN1(n176), .IN2(in_a[3]), .Q(N106) );
  INVX0 U267 ( .IN(in_b[3]), .QN(n176) );
  XNOR2X1 U268 ( .IN1(n175), .IN2(in_a[4]), .Q(N105) );
  INVX0 U269 ( .IN(in_b[4]), .QN(n175) );
  XNOR2X1 U270 ( .IN1(n174), .IN2(in_a[5]), .Q(N104) );
  INVX0 U271 ( .IN(in_b[5]), .QN(n174) );
  XNOR2X1 U272 ( .IN1(n173), .IN2(in_a[6]), .Q(N103) );
  INVX0 U273 ( .IN(in_b[6]), .QN(n173) );
  XNOR2X1 U274 ( .IN1(n172), .IN2(in_a[7]), .Q(N102) );
  INVX0 U275 ( .IN(in_b[7]), .QN(n172) );
  NOR2X0 U276 ( .IN1(n212), .IN2(n184), .QN(N101) );
  INVX0 U277 ( .IN(in_b[0]), .QN(n184) );
  INVX0 U278 ( .IN(in_a[0]), .QN(n212) );
  NOR2X0 U279 ( .IN1(n211), .IN2(n178), .QN(N100) );
  INVX0 U280 ( .IN(in_b[1]), .QN(n178) );
  INVX0 U281 ( .IN(in_a[1]), .QN(n211) );
endmodule

