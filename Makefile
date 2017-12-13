HEAD		=header.v

VLOG		=ncverilog

SRC			=ifmap_rom_tb.v\
			 ifmap_rom.v

SRC_syn 	= ifmap_rom_tb.v\
			 ifmap_rom_syn.v\
			 -v /theda21_2/CBDK_IC_Contest/cur/Verilog/tsmc13.v
			 		 
SDF			=+define+SDF


MODE1		=+define+MODE1

MODE2		=+define+MODE2

VLOGARG		= +access+r

TMPFILE		=*.log\
			 INCA_libs\
			*.fsdb

RM			=-rm -rf

all :: sim 
gen_ram:
		./ram_prgen.py -w 16 -l 65536 "ifmap_block"
		./ram_prgen.py -w 16 -l 1024 "weight_block"
sim :
		$(VLOG) $(HEAD) $(SRC) $(VLOGARG) 

syn : 
		$(VLOG) $(HEAD) $(SRC_syn) $(SDF) $(VLOGARG) 

check :
		$(VLOG) -c $(SRC)
clean :
		$(RM) $(TMPFILE)
