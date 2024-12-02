# Dynamic Path exploration and mutation of seeds through AFL (American Fuzzy Lop)

## Warning ##
Don't run these programs in the host machine, as it has vulnerable code for demonstration purposes. 

## Docker Installation ##
1. Before installing the docker, you can encounter errors regarding the linux kernel in the future so make sure to run the below command.
   ```bash
   echo core > /proc/sys/kernel/core_pattern
   ```
2. Download docker and install it using the following commands.
   ```bash
   sudo apt update
   sudo apt install docker.io
   sudo systemctl start docker
   sudo systemctl enable docker
   ```
3. Pull Ubuntu 20.04 image using docker.
   ```bash
   docker pull ubuntu:20.04
   docker run -it ubuntu:20.04
   ```

## AFL Installation ##
1. Update the packages.
   ```bash
   sudo apt-get update # Make sure to run this command if you get unable to locate package error.
   ```
2. Adding important libraries for supporting AFL.
   ```bash
   sudo apt install -y build-essential clang llvm python3 wget git
   ```
3. Cloning the AFL (American Fuzzy Lop) through git.
   ```bash
   git clone https://github.com/google/AFL.git
   ```
4. Once you recieved the objects, now time to install it locally.
   ```bash
   cd AFL
   make
   make install
   ```
5. Once you installed it without any errors you can see the version number for checking the installation.
   ```bash
   afl-fuzz -V
   ```

# Why AFL is better ? #
**AFL (American Fuzzy Lop)** is widely regarded as one of the best fuzzing tools because of its coverage-guided fuzzing approach, which ensures that the tool explores new code paths effectively. By monitoring program execution during fuzzing, AFL intelligently prioritizes inputs that lead to unexplored execution paths, making it highly efficient in uncovering complex bugs. Its robust mutation strategies, such as bit flips, arithmetic operations, and byte-level mutations, combined with automatic queue management of interesting test cases, allow AFL to comprehensively and systematically explore vulnerabilities. Additionally, its seamless integration with sanitizers like **AddressSanitizer (ASan) and UndefinedBehaviorSanitizer (UBSan)** enhances its ability to detect subtle issues, including memory corruption and undefined behavior.

AFL is also praised for its ease of use and performance optimization. It simplifies the fuzzing workflow, requiring minimal setup and automating tasks like input generation and crash detection. Features like persistent mode reduce the overhead of reinitializing the program, improving fuzzing throughput significantly. Its scalability, with support for parallel fuzzing across multiple CPUs or systems, allows users to maximize coverage quickly. AFL’s proven track record of finding critical vulnerabilities in real-world software, combined with strong community support and extended versions like AFL++, solidifies its reputation as an essential tool for both novice and experienced security researchers.

## AFLRL ##
This C program has been specifically developed and modified to include deliberate **backdoors and multiple memory corruption vulnerabilities**, aiming to enhance the efficacy of fuzzers and analysis tools. Each vulnerability is carefully documented in **aflrl.c**, with corresponding input files under **input-files/** designed to trigger them. By incorporating these vulnerabilities, the code provides a robust framework for training AFL to adopt **reinforcement learning strategies**, enabling better mutation techniques and leveraging counterexamples for improved fuzzing in future scenarios.

## Building the Vulnerable code ##
1. Clone this repository into your Ubuntu 20.04 docker container or virtual machine.
   ```bash
   git clone https://github.com/kp18-cpu/aflrl.git
   ```
2. Navigate to the folder.
   ```bash
   cd aflrl
   ```
3. Build the C program using make.
   ```bash
   make
   ```
4. Once the build is ready execute the afl-fuzz using either of the commands.  
   ```bash
   make afl

   ----or----

   afl-fuzz -i in -o out ./aflrl @@
   ```
   <img width="644" alt="image" src="https://github.com/user-attachments/assets/fb19c155-9ff3-4513-922e-146d0b8bdaf4">



## Observation ##

After running the fuzzer for a while stop the program and navigate to **out** folder and look into the crashes and plot values etc for analyzing the program.
<img width="1266" alt="image" src="https://github.com/user-attachments/assets/129afedb-861a-42b3-8510-25e3730702e1">

## Credits ##
1. AFL created by google
2. Fuzz Station
3. Json-Parser
