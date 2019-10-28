# random-levels-of-dirs-and-files-given-arguments

Compile:
chmod +x generate.sh
Running:
./generate.sh dir_name num_of_files num_of_dirs levels

- dir_name: το directory όπου θα γραφτούν τα αρχεία.
- num_of_files: το συνολικό πλήθος των αρχείων
- num_of_dirs: το συνολικό πλήθος των directories
- levels: σε πόσα επίπεδα θα κατανέμονται τα directories

Το script κάνει τα εξής:
1. Κάνει ελέγχους για νούμερα εισόδου
2. Αν το dir_name δεν υπάρχει το δημιουργεί
3. Δημιουργεί τα directory names με τυχαία αλφαριθμητικά μήκους από 1 έως 8 χαρακτήρες και
γράμματα (π.χ. 138kjd ή jkkm180k)
4. Ξεκινάει και φτιάχνει τα directories επίπεδο-επίπεδο μέχρι να φτιάξει num_of_dirs directories
σε levels επίπεδα. Για παράδειγμα αν έχουμε τα ονόματα aaa, bbb, cc, dddd, eee
(num_of_dirs=5) και levels=2 τότε θα φτιάξουμε με τη σειρά:
a. dir_name/aaa/
b. dir_name/aaa/bbb
c. dir_name/cc/
d. dir_name/cc/dddd
e. dir_name/eee
5. Αντίστοιχα δημιουργούνται num_of_files τυχαία ονόματα αρχείων από 1 έως 8 χαρακτήρες. Τα
αρχεία αυτά κατανεμένονται ομοιόμορφα στα directories που δημιουργούνται με round-robin
σειρά. Για παράδειγμα αν έχουμε τα ονόματα f1, f2, f3 … f10 τότε η τελική ιεραρχία θα έχει ώς
εξής:
a. dir_name/f1
b. dir_name/f7
c. dir_name/aaa/f2
d. dir_name/aaa/f8
e. dir_name/aaa/bbb/f3
f. dir_name/aaa/bbb/f9
g. dir_name/cc/f4
h. dir_name/cc/f10
i. dir_name/cc/dddd/f5
j. dir_name/eee/f6
6. Σε καθένα από αυτά τα αρχεία θα γράψετε ένα τυχαίο αλφαριθμητικό από 1 kb έως 128 kb.
