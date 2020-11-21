# VC-Scheme
Peer-to-peer visual cryptography scheme (P-P IVCS)
## Description
This study introduces a visual cryptography scheme called Peer-to-peer visual cryptography scheme (P-P IVCS) which share secrets among the members of a set with arbitrary topology. In the proposed P-P IVCS scheme, the network contains n members that include common secrets among some of them (or all). Only one key is allocated to any member. So maximum number of secrets will be C(n,2). Encoding operation of plain image’s content (that include all of secrets) should contribute some prominent features. First, each single key cannot reveal any secrets. Second, the secret between two participants will be disclosed by superimposing their keys. Third, although there is a common secret between any pair of members, revelation of common secrets is impossible for others. In this method, by adding one member to n-member network, pixel expansion will increase only one unit, whereas, number of secrets will increase up to n units.
## Source Code & Data
* All source code are released in this repository.
* You can download original images and result files from this [Link](https://github.com/omidshafiei/VC-Scheme/blob/main/vcs_code.m).
## Try to do with your own plain image
Please contact me or submit "issues" in this repository, and I can help you in person
## Sample Plain Image
![plain](https://user-images.githubusercontent.com/74077380/99885532-d0f74480-2c4a-11eb-8844-361357572a83.png)
## Sample Key
Sample keys have maximum entropy.
![key](https://user-images.githubusercontent.com/74077380/99885536-d6ed2580-2c4a-11eb-9fdf-209099d2bea2.png)
## Simulation Result
Superimposing any two keys would reveals the secret between them.
![Key11 Key2](https://user-images.githubusercontent.com/74077380/99885538-dbb1d980-2c4a-11eb-8a1c-6f2d57f673f4.png)
