ASM = qtasm/qtasm.exe
WINE = wine
BURNER = ./ezotgdbg
BIN = stierlitz

all :	$(BIN)

stierlitz : $(BIN).asm
	$(WINE) $(ASM) -r $(BIN).asm

burn :
	$(BURNER) -w $(BIN).bin

clean :
	rm -f *.bin *.dat *.fix *.lst *.obj *.sym