// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License foar the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none
`timescale 1 ns / 1 ps


module WPT(
`ifdef USE_POWER_PINS
    inout vss,
`endif
    input VBias1,
    input VBias2,
    input VBias3,
    input VBias4,
    input VCasc1,
    input VCasc2,
    input VSWP,
    input RFIN,

    output LNA_OUT,
    output PA_OUT
);


//Two Internal registers to connect to outputs
reg OUT1;
reg OUT2;

//assign internal registers to output wires
assign LNA_OUT=OUT1;
assign PA_OUT=OUT2;


//Dummy behaviour of WPT
always @(VSWP)
begin
    if (VBias1 && VBias2 && VBias3 && VBias4)
    begin
        if (VSWP)
        begin
            OUT1<=1;
            OUT2<=0;
        end
        else
        begin
            OUT1<=0;
            OUT2<=0;
        end 

    end
    else
    begin
        OUT1<=0;
        OUT2<=0;
    end
end



endmodule
`default_nettype wire
