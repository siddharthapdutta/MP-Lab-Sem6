// Square of a Number using Lookup Table
# ORG 2001
# DB 01,04,09,16,25,36,49,64,81

// Number is Stored in 3000H
# ORG 3000
# DB 08

# ORG 0000
LXI H, 2000H
LDA 3000H
MOV C,A
DAD B
MOV A,M
STA 3001H
HLT


// Result is Stored in 3001H
