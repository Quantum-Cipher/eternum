import sys
import binascii

with open(sys.argv[1], 'rb') as f:
    data = f.read()

try:
    printable = ''.join(chr(b) if 32 <= b < 127 else '.' for b in data)
    print(printable)
except Exception as e:
    print("[!] Decode failed:", e)
