# CS 201 Project Part1

students: Songyu Zhang (862468110)
students: Shaoyu Tu (862137500)

## step-2b

Translate between different representations using some of the above tools with different flags.

The `-o` option will write output to a specific file

If not specified, the output file will have the same name with input except the extension

All outputs is included in the working directory attached.

1. source(.c) to binary(executable)

```bash
# we use clang to transfer source(.c) to binary
# input: clang test.c -o test.out / output: test.out
clang test.c -o test.out
```

2. source(.c) to object file(.o)

```bash
# use the -c flag to transfer the source(.c) to object file
# input: clang -c test.c / output: test.o
clang -c test.c
```

3. source(.c) to machine assembly(.s)

```bash
# use the -S flag to transfer source(.c) to machine assembly(.s)
# input: clang -S test.c / output: test-clang.s
clang -S test.c -o test-clang.s
```

4. source(.c) to llvm bitcode(.bc)

```bash
# -c option tells clang to stop after generating object files
# input: clang -emit-llvm test.c -c -o test.bc / output: test.bc
clang -emit-llvm test.c -c -o test.bc
```

5. source(.c) to llvm IR(.ll)

```bash
# input: clang -S -emit-llvm test.c -c -o test.ll / output: test.ll
clang -S -emit-llvm test.c -c -o test.ll
```

6. llvm IR(.ll) to llvm bitcode(.bc)

```bash
# input: llvm-as test.ll -o test-llvm.bc / output: test-llvm.bc
llvm-as test.ll -o test-llvm.bc
```

7. llvm bitcode(.bc) to llvm IR(.ll)

```bash
# input: llvm-dis test.bc -o test-llvm.ll / output: test-llvm.ll
llvm-dis test.bc -o test-llvm.ll
```

8. llvm IR(.ll) to machine assembly(.s)

```bash
# input: llc test.ll -o test-llvm.s / output: test-llvm.s
llc test.ll -o test-llvm.s
```

## step-3

In the HelloPass.cpp, we add the following line

```cpp
for (auto &basic_block : F)
{
  int np = distance(pred_begin(&basic_block), pred_end(&basic_block));
  int ns = distance(succ_begin(&basic_block), succ_end(&basic_block));
  errs() << "!!block " << basic_block.getName() << " has " << np << " predecessors"<<"\n";
  errs() << "!!block " << basic_block.getName() << " has " << ns << " successors"<<"\n";
```

under the for loop that iterates the basic blocks.

The predecessors and successors are stored in a array.
The `pred_begin` function returns the begin iterator of the predecessors array.
The `pred_end` function returns the end iterate of the predecessors array.
The `succ_begin` function returns the begin iterate of the successors array.
The `succ_end` function returns the end iterate of the successors array.
We can use the `distance` function to calculate the number of elements in each array, and output the information to error stream.

```bash
# first change directory to HelloPass
cmake .
# generate libHelloPass.so
make
cd ../../test/phase1
# using llvm rename pass to rename all basic blocks
opt -instnamer test.bc -o rename.bc
# load the HelloPass, information is print out to out.log
opt -load ../../Pass/HelloPass/libHelloPass.so -Hello < ./rename.bc > out.bc 2> out.log

llvm-dis out.bc -o out.s
```

We can use the instnamer pass provided by llvm to rename all basic blocks.

Then wen load our pass and output information to `out.log` file.

The result:

```bash
# the diagram of test function is listed below.
test function

bb: pre 0; succ 1

bb6: pre 2; succ 2

bb14: pre 1; succ 1

bb20: pre 1; succ 1

bb25: pre 2; succ 1

bb27: pre 1; succ 2

bb30: pre 1; succ 0


# main function has just one basic block, this block has no pre succ.
main function

bb: pre: 0; succ 0
```

![Untitled](.\test-function.png)
