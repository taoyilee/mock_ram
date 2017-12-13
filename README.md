# mock_ram

## Workflow
Python script ram_prgen will generate Verilog snippets basedon given output width and length. 
```
[user@pc mock_rom]$ ./ram_prgen.py -h
usage: ram_prgen.py [-h] [-w w] [-l l] output_file

Generate CASE table for mocking RAM/ROMs

positional arguments:
  output_file  Output Verilog snippet file

optional arguments:
  -h, --help   show this help message and exit
  -w w         Width of word-line
  -l l         Length of memory
```

Usage:

```bash
make gen_ram
```

```
./ram_prgen.py -w 16 -l 65536 "ifmap_block"
Writing to "ifmap_block.v", generating 65536 words with width 16
./ram_prgen.py -w 16 -l 1024 "weight_block"
Writing to "weight_block.v", generating 1024 words with width 16
```
