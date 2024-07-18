#!/bin/python

n = 72

s = 1
e = n
rst = []
while (s < e):
    rst.append(str(e))
    rst.append(str(s))
    s += 1
    e -= 1
    rst.append(str(s))
    rst.append(str(e))
    s += 1
    e -= 1

print(','.join(rst))

