let test_atom = 
  let line = "C  6.0  1.  2. 3." in
  let atom = Atom.of_string line in
  print_string (Atom.to_string atom)
;;
