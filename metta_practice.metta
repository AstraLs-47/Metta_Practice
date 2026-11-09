; LIST HELPER FUNCTIONS
; Is $x inside $list?  Returns True or False.
(= (in-list $x $list)
   (if (== $list ())
       False                                    ; empty list: not found
       (let ($first $rest) (decons-atom $list)  ; split into first item + rest
            (if (== $x $first)
                True
                (in-list $x $rest)))))

; Add one item to the END of a list.
(= (list-add $list $x)
   (if (== $list ())
       ($x)                                     ; empty list becomes a 1-item list
       (let ($first $rest) (decons-atom $list)
            (let $newrest (list-add $rest $x)   ; evaluate first...
                 (cons-atom $first $newrest)))))  ; ...then rebuild the list

; Glue two lists together: (1 2) + (3 4) = (1 2 3 4)
(= (list-join $a $b)
   (if (== $a ())
       $b
       (let ($first $rest) (decons-atom $a)
            (let $newrest (list-join $rest $b)
                 (cons-atom $first $newrest)))))



(edge A B)
(edge A C)
(edge B D)
(edge B E)
(edge C H)
(edge C I)
(edge E F)
(edge E G)
(edge I J)

; All neighbors of a node, collected into one list.
(= (next-nodes $node)
   (collapse (match &self (edge $node $x) $x)))


; DEPTH-FIRST SEARCH (DFS)

(= (dfs $start)
   (dfs-visit $start ()))

; Visit one node. Skip it if already visited.
(= (dfs-visit $node $visited)
   (if (in-list $node $visited)
       $visited
       (let $seen (list-add $visited $node)
            (let $kids (next-nodes $node)
                 (dfs-all $kids $seen)))))

; Visit a list of nodes one by one.
(= (dfs-all $nodes $visited)
   (if (== $nodes ())
       $visited
       (let ($first $rest) (decons-atom $nodes)
            (let $seen (dfs-visit $first $visited)
                 (dfs-all $rest $seen)))))

; BREADTH-FIRST SEARCH (BFS)


(= (bfs $start)
   (bfs-loop ($start) ()))

(= (bfs-loop $queue $visited)
   (if (== $queue ())
       $visited
       (let ($node $rest) (decons-atom $queue)
            (if (in-list $node $visited)
                (bfs-loop $rest $visited)
                (let $seen (list-add $visited $node)
                     (let $kids (next-nodes $node)
                          (let $newq (list-join $rest $kids)
                               (bfs-loop $newq $seen))))))))


; BINARY SEARCH TREE (BST) CHECKER


(= (is-bst $tree)
   (bst-check $tree -1000000 1000000))

(= (bst-check Leaf $low $high)
   True)

(= (bst-check (Node $v $left $right) $low $high)
   (if (and (> $v $low) (< $v $high))
       (and (bst-check $left $low $v)
            (bst-check $right $v $high))
       False))


; TEST ALL ALGORITHMS

; Test DFS
!(let $result (dfs A)
   (println! (format-args "DFS order: {}" ($result))))

; Test BFS
!(let $result (bfs A)
   (println! (format-args "BFS order: {}" ($result))))

; Test valid BST
!(let $result
   (is-bst
      (Node 5
         (Node 3
            (Node 2 Leaf Leaf)
            (Node 4 Leaf Leaf))
         (Node 8 Leaf Leaf)))
   (println! (format-args "Valid tree, is BST? {}" ($result))))

; Test invalid BST
!(let $result
   (is-bst
      (Node 5
         (Node 3 Leaf
            (Node 6 Leaf Leaf))
         (Node 8 Leaf Leaf)))
   (println! (format-args "Invalid tree, is BST? {}" ($result))))