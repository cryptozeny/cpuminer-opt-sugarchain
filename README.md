cpuminer-opt-sugarchain
=======================
![GitHub All Releases](https://img.shields.io/github/downloads/cryptozeny/cpuminer-opt-sugarchain/total)

# Install
Works on:
- Ubuntu 16.04 
- Devuan 2.1

Doesn't work on: 
- Ubuntu 20.04

```bash
sudo apt-get install -y \
build-essential libssl-dev libcurl4-openssl-dev libjansson-dev libgmp-dev automake zlib1g-dev && \
git clone https://github.com/cryptozeny/cpuminer-opt-sugarchain.git && \
cd cpuminer-opt-sugarchain && \
./build-yespower.sh && \
./cpuminer --cputest
```

# Run
All address format (legacy, p2sh-segwit and ___bech32___) supported.

 * Mining Pool - `-t1` using 1 thread.
```
./cpuminer -a yespower -o stratum+tcp://1pool-testnet.cryptozeny.com:3333 -u sugar1qnd3mamq6e7wsrml40ve95h3y3l9u9sq7gj0fc0.$HOSTNAME -t$(nproc)
```

 * Solo - `44229` is testnet. `-u` and `-p` is on the coind. (adding `--no-longpoll` for displaying correct net_diff)
```
./cpuminer -a yespower -o http://localhost:44229 --no-longpoll -u rpcuser -p rpcpassword --coinbase-addr=tugar1qt9tcmdq7w002j8rw78h8nraj382ptqh7fe83f8 -t$(nproc)
```

 * Screenshot

![screenshot-cpuminer.png](https://github.com/cryptozeny/cpuminer-opt-sugarchain/blob/master/res/screenshot-cpuminer.png?raw=true)

-----

# README

cpuminer-opt is a fork of cpuminer-multi by TPruvot with optimizations
imported from other miners developped by lucas Jones, djm34, Wolf0, pooler,
Jeff garzik, ig0tik3d, elmad, palmd, and Optiminer, with additional
optimizations by Jay D Dee.

All of the code is believed to be open and free. If anyone has a
claim to any of the code, please post your case in the cpuminer-opt Bitcoin Talk forum
or by email.

Miner programs are often flagged as malware by antivirus programs. This is
a false positive, they are flagged simply because they are cryptocurrency
miners. The source code is open for anyone to inspect. If you don't trust
the software, don't use it.

https://bitcointalk.org/index.php?topic=1326803.0

mailto://jayddee246@gmail.com

See file RELEASE_NOTES for change log and compile instructions.

Requirements
------------

1. A x64 bit (x86_64) CPU with a minimum of SSE2 support. This includes
Intel Core2 and newer, and AMD equivalents. In order to take advantage of AES_NI
optimizations, a CPU with AES_NI is required. This includes Intel Westbridge
and newer, and AMD equivalents. Further optimizations are available on some
algoritms for CPUs with AVX and AVX2, Sandybridge and Haswell respectively.

Older CPUs are supported by cpuminer-multi by TPruvot but at reduced
performance.

ARM CPUs are not supported.

2. 64 bit Linux OS: Ubuntu and Fedora based distributions, including Mint and
Centos, are known to work and have all dependencies in their repositories.
Others may work but may require more effort. Older versions such as Centos 6
don't work due to missing features.
64 bit Windows OS is supported with mingw_w64 and msys or pre-built binaries.

MacOS, OSx and Android are not supported.

3. Stratum pool: Some algos may work with wallet mining using getwork or GBT. YMMV.

Supported Algorithms
--------------------

                          allium        Garlicoin
                          anime         Animecoin
                          argon2        Argon2 coin (AR2)
                          argon2d250    argon2d-crds, Credits (CRDS)
                          argon2d500    argon2d-dyn,  Dynamic (DYN)
                          argon2d4096   argon2d-uis, Unitus, (UIS)
                          axiom         Shabal-256 MemoHash
                          bastion
                          blake         Blake-256 (SFR)
                          blakecoin     blake256r8
                          blake2s       Blake-2 S
                          bmw           BMW 256
                          c11           Chaincoin
                          cryptolight   Cryptonight-light
                          cryptonight  
                          cryptonightv7 Monero (XMR)
                          decred
                          deep          Deepcoin (DCN)
                          dmd-gr        Diamond-Groestl
                          drop          Dropcoin
                          fresh         Fresh
                          groestl       Groestl coin
                          heavy         Heavy
                          hmq1725       Espers
                          hodl          Hodlcoin
                          jha           Jackpotcoin
                          keccak        Maxcoin
                          keccakc       Creative coin
                          lbry          LBC, LBRY Credits
                          luffa         Luffa
                          lyra2h        Hppcoin
                          lyra2re       lyra2
                          lyra2rev2     lyra2v2, Vertcoin
                          lyra2z        Zcoin (XZC)
                          lyra2z330     Lyra2 330 rows, Zoin (ZOI)
                          m7m           Magi (XMG)
                          myr-gr        Myriad-Groestl
                          neoscrypt     NeoScrypt(128, 2, 1)
                          nist5         Nist5
                          pentablake    Pentablake
                          phi1612       phi, LUX coin
                          pluck         Pluck:128 (Supcoin)
                          polytimos     Ninja
                          quark         Quark
                          qubit         Qubit
                          scrypt        scrypt(1024, 1, 1) (default)
                          scrypt:N      scrypt(N, 1, 1)
                          scryptjane:nf
                          sha256d       Double SHA-256
                          sha256t       Triple SHA-256, Onecoin (OC)
                          shavite3      Shavite3
                          skein         Skein+Sha (Skeincoin)
                          skein2        Double Skein (Woodcoin)
                          skunk         Signatum (SIGT)
                          timetravel    Machinecoin (MAC)
                          timetravel10  Bitcore
                          tribus        Denarius (DNR)
                          vanilla       blake256r8vnl (VCash)
                          veltor        (VLT)
                          whirlpool
                          whirlpoolx
                          x11           Dash
                          x11evo        Revolvercoin
                          x11gost       sib (SibCoin)
                          x12           Galaxie Cash (GCH)
                          x13           X13
                          x13sm3        hsr (Hshare)
                          x14           X14
                          x15           X15
                          x16r          Ravencoin (RVN)
                          x16s          pigeoncoin (PGN)
                          x17
                          xevan         Bitsend (BSD)
                          yescrypt      Globalboost-Y (BSTY)
                          yescryptr8    BitZeny (ZNY)
                          yescryptr16   Yenten (YTN)
                          yescryptr24   JagaricoinR (JAGAR)
                          yescryptr32   WAVI
                          yespower      Sugarchain (SUGAR)
                          yespowerr8    BitZeny (ZNY)
                          yespowerr16   Yenten (YTN)
                          yespowerr24   JagaricoinR (JAGAR)
                          yespowerr32   WAVI
                          zr5           Ziftr

Errata
------

- Neoscrypt crashes on Windows, please use legacy version.

- AMD CPUs older than Piledriver, including Athlon x2 and Phenom II x4, are not
supported by cpuminer-opt due to an incompatible implementation of SSE2 on
these CPUs. Some algos may crash the miner with an invalid instruction.
Users are recommended to use an unoptimized miner such as cpuminer-multi.

- cpuminer-opt does not work when mining with Decred algo at Nicehash and produces
only "invalid extranonce2 size" rejects.

- Benchmark testing does not work for x11evo.

Bugs
----

Users are encouraged to post their bug reports on the Bitcoin Talk
forum at:

https://bitcointalk.org/index.php?topic=1326803.0

All bug reports must be accompanied by a proper definition.
This should include how the problem occurred, the command line 
output from the miner showing at startup and any errors.

Donations
---------

cpuminer-opt-sugarchain has no fees of any kind but donations are accepted.

 BTC: 3Gcbpn4QU4iGibZox378VdEJvjx7Z7J7Tr (cryptozeny)  
 SUGAR: sugar1qcu07vm47ceh7lec3umx7nv7e8tm8r8zw4l2uyx (cryptozeny)  

Happy mining!
