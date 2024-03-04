# Sparse Coding

Manaal Faruqui, manaalfar@gmail.com  
Docker implementation by Anthe Sevenants

This tool implements sparse coding for converting dense word vector representations to highly sparse vectors. The implementation can be run on multiple cores in parallel with asynchronous updates. The sparsity is introduced in the word vectors using L1 regularization. For technical details please refer to Faruqui et al (2015).

### Data you need

Word Vector File. Each vector file should have one word vector per line as follows (space delimited):-

```the -1.0 2.4 -0.3 ...```

### Compile

You need to download the latest Eigen stable release from here: http://eigen.tuxfamily.org/index.php?title=Main_Page

Unzip the folder and provide its path in the makefile:
INCLUDES = -I PATH_TO_EIGEN

After this just execute the following command:

For sparse coding: ```make```

For non-negative sparse coding: ```make nonneg```

### Running the executable

For sparse coding: ```sparse.o```

For non-negative sparse coding: ```nonneg.o```

Usage: ```./sparse.o vec_corpus factor l1_reg l2_reg num_cores outfilename```

Example: ```./sparse.o sample_vecs.txt 10 0.5 1e-5 1 out_vecs.txt```

This example would expand the vectors in sample_vecs.txt to 10 times their original length.

### Running the executable with Docker

I (Anthe Sevenants) compiled the program for use in Docker. You can use it as follows:

```
docker run \
-v "./sample_vecs.txt:/sparse/my_vectors.txt" \
-v "./output.txt:/sparse/output.txt" \
"ghcr.io/anthesevenants/sparse-coding" \
my_vectors.txt 10 0.5 1e-5 1 output.txt
```

The arguments remain the same.

**Two important points**:

1. Make sure your volume mappings and arguments correspond (e.g. /sparse/my_vectors.txt in the volume mapping and my_vectors.txt in the arguments - the same applies for output.txt)
2. Make sure to create your output text file before running the command. If the file does not yet exist, Docker will make a directory for it (and output will fail!). The file can be empty, but it must exist.

You can use the non-negative version of this program by using the `ghcr.io/anthesevenants/sparse-coding:nonneg` image.

### Reference

```
@InProceedings{faruqui:2015:sparse,
  author    = {Faruqui, Manaal and Tsvetkov, Yulia and Yogatama, Dani and Dyer, Chris and Smith, Noah A.},
  title     = {Sparse Overcomplete Word Vector Representations},
  booktitle = {Proceedings of ACL},
  year      = {2015},
}
```
