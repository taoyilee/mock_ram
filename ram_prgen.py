#!/usr/bin/python3
import argparse
from random import choice

parser = argparse.ArgumentParser(description='Generate CASE table for mocking RAM/ROMs')
parser.add_argument('-w', metavar='w', type=int, help='Width of word-line')
parser.add_argument('-l', metavar='l', type=int, help='Length of memory')
parser.add_argument('output_file', type=str, help='Output Verilog snippet file')

args = parser.parse_args()
output_file = args.output_file + '.v'
print("Writing to \"" + output_file + "\", generating " + str(args.l) + " words with width " + str(args.w))

hexset = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F']
with open(output_file, 'w+') as f:
	for i in range(args.l):
		wordstr = ''.join([choice(hexset) for i in range(4)])
		f.write('{:d}: oport <= {:d}\'h{:s};\n'.format(i, args.w, wordstr))

