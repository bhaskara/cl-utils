(defpackage :cl-utils
  (:documentation "Useful macros and utility functions for Ansi Common Lisp.")
  (:use common-lisp)
  (:export

   ;; Types
   :non-null

   ;; Vars
   :defvars

   ;; Symbols
   :build-symbol-name :intern-compound-symbol

   ;; Binding
   :with-gensyms :with-readers :with-struct :condlet  

   ;; Assertions
   :verify-type :check-not-null

   ;; Destructuring
   :dbind 

   ;; Control flow
   :while :till :repeat-until :repeat :for-loop

   ;; Abbreviations
   :abbrev :mvbind :dsbind :mvsetq :unbind-slot

   ;; CLOS
   :def-symmetric-method

   ;; Anaphoric macros
   :it :aif :awhen :awhile :aand

   ;; Setf
   :_f :toggle :orf

   ;; Randomized
   :generate-histogram :if-rand :when-rand :hist-count

   ;; Output
   :bind-pprint-args

   ;; Functional 
   :compose :nth-arg-fn :fn :defaggregator :partial

   ;; Hash tables
   :hash-table-has-key :do-hash-entries :hash-keys :pprint-hash-table
   :hash-table-to-alist :alist-to-hash-table

   ;; Sequences
   :blocks :is-prefix

   ;; Lists
   :filter :is-permutation

   ;; Alists
   :lookup-alist

   ;; Sequences
   :blocks

   ;; Arrays
   :make-adjustable-vector

   ;; Iteration
   :do-iterator :map-iterator :realize

   ;; Math
   :close-to :*tol*

   ;; Printing
   :force-format
))