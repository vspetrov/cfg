;;; Compiled snippets and support files for `c-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'c-mode
                     '(("uni" "#include <unistd.h>" "unistd" nil nil nil "/labhome/valentinp/.emacs.d/elpa/yasnippet-20160226.1359/snippets/c-mode/unistd" nil nil)
                       ("union" "typedef union {\n        $0\n} ${1:name};" "union" nil nil nil "/labhome/valentinp/.emacs.d/elpa/yasnippet-20160226.1359/snippets/c-mode/union" nil nil)
                       ("str" "#include <string.h>" "string" nil nil nil "/labhome/valentinp/.emacs.d/elpa/yasnippet-20160226.1359/snippets/c-mode/string" nil nil)
                       ("std" "#include <stdlib.h>\n" "stdlib" nil nil nil "/labhome/valentinp/.emacs.d/elpa/yasnippet-20160226.1359/snippets/c-mode/stdlib" nil nil)
                       ("io" "#include <stdio.h>" "stdio" nil nil nil "/labhome/valentinp/.emacs.d/elpa/yasnippet-20160226.1359/snippets/c-mode/stdio" nil nil)
                       ("smpi" "\n#include <mpi.h>\n#include <stdio.h>\n#include <stdlib.h>\n#include <string.h>\n#include <unistd.h>\n\nint main (int argc, char **argv) {\n    int rank, size;\n    MPI_Init(&argc, &argv);\n    MPI_Comm_rank(MPI_COMM_WORLD, &rank);\n    MPI_Comm_size(MPI_COMM_WORLD, &size);\n\n\n    MPI_Finalize();\n}\n" "simple-mpi" nil nil nil "/labhome/valentinp/.emacs.d/elpa/yasnippet-20160226.1359/snippets/c-mode/simple_mpi" nil nil)
                       ("pr" "printf(\"${1:format string}\"${2: ,a0,a1});" "printf" nil nil nil "/labhome/valentinp/.emacs.d/elpa/yasnippet-20160226.1359/snippets/c-mode/printf" nil nil)
                       ("packed" "__attribute__((__packed__))$0" "packed" nil nil nil "/labhome/valentinp/.emacs.d/elpa/yasnippet-20160226.1359/snippets/c-mode/packed" nil nil)
                       ("malloc" "malloc(sizeof($1)${2: * ${3:3}});\n$0" "malloc" nil nil nil "/labhome/valentinp/.emacs.d/elpa/yasnippet-20160226.1359/snippets/c-mode/malloc" nil nil)
                       ("d" "#define $0" "define" nil nil nil "/labhome/valentinp/.emacs.d/elpa/yasnippet-20160226.1359/snippets/c-mode/define" nil nil)
                       ("dbg" "{\n    volatile int i = 0;\n    char hostname[256];\n    gethostname(hostname, sizeof(hostname));\n    printf(\"PID %d on %s ready for attach\\n\", getpid(), hostname);\n    fflush(stdout);\n    while (0 == i)\n        sleep(5);\n}\n" "debug-stop" nil nil nil "/labhome/valentinp/.emacs.d/elpa/yasnippet-20160226.1359/snippets/c-mode/debug_stop" nil nil)
                       ("dbp" "fprintf(stderr,\"[%d][%s] -- [%d]\\n\",getpid(),__FUNCTION__,__LINE__);" "debug-print" nil nil nil "/labhome/valentinp/.emacs.d/elpa/yasnippet-20160226.1359/snippets/c-mode/debug_print" nil nil)
                       ("compile" "// -*- compile-command: \"${1:gcc -Wall -o ${2:dest} ${3:file}}\" -*-" "compile" nil nil nil "/labhome/valentinp/.emacs.d/elpa/yasnippet-20160226.1359/snippets/c-mode/compile" nil nil)
                       ("bti" "#include \"execinfo.h\"\n\n" "backtrace_include" nil nil nil "/labhome/valentinp/.emacs.d/elpa/yasnippet-20160226.1359/snippets/c-mode/backtrace_include" nil nil)
                       ("btr" "{\n    int j, nptrs; void *buffer[100]; char **strings;\n    nptrs = backtrace(buffer, 100);\n    strings = backtrace_symbols(buffer, nptrs);\n    for (j = 0; j < nptrs; j++) printf(\"%s\\n\", strings[j]);\n    free(strings);\n}\n" "backtrace" nil nil nil "/labhome/valentinp/.emacs.d/elpa/yasnippet-20160226.1359/snippets/c-mode/backtrace" nil nil)
                       ("ass" "#include <assert.h>\n$0" "assert" nil nil nil "/labhome/valentinp/.emacs.d/elpa/yasnippet-20160226.1359/snippets/c-mode/assert" nil nil)))


;;; Do not edit! File generated at Tue Apr 17 14:58:25 2018
