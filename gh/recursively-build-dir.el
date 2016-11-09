



(defun my-byte-recompile-directory (directory)
  "Recompile every `.el' file in DIRECTORY that needs recompilation.
This happens when a `.elc' file exists but is older than the `.el' file.
Files in subdirectories of DIRECTORY are processed also.

If the `.elc' file does not exist, normally this function *does not*
compile the corresponding `.el' file.  However, if the prefix argument
ARG is 0, that means do compile all those files.  A nonzero
ARG means ask the user, for each such `.el' file, whether to
compile it.  A nonzero ARG also means ask about each subdirectory
before scanning it.

If the third argument FORCE is non-nil, recompile every `.el' file
that already has a `.elc' file."
  (interactive "DByte compile and recompile directory: \nP")
  (byte-recompile-directory directory 0 nil)
  )
