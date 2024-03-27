This code was originally created following Heath Adams's Practical Ethical Hacking course at https://academy.tcm-sec.com/<br><br>

Originally it's limiation is that only Class C IP addresses are able to be scanned by providing the first 3 octets of the Network address. (i.e. 192.168.1. )<br><br>
I wanted to expand upon it by enableing Class A and B scans.
This required additional code to read the inputed ip value and cidr notation, to properly scan.<br><br>
With my additions, if you provide the full IP network address with CIDR notation (i.e 192.168.1.0/24), the script will identify the subnet class and perform actions based upon that. 
Currently class C is the only subnet with the calculations, I am working on addiding in A and B.
